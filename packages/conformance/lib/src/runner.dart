// Copyright 2024 The Connect Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:archive/archive_io.dart';
import 'package:path/path.dart' as p;

import 'gen/connectrpc/conformance/v1/client_compat.pb.dart';
import 'gen/connectrpc/conformance/v1/client_compat.pbserver.dart';

/// Version of the conformance runner.
const defaultVersion = 'v1.0.3';

/// Conformance runner exposes programmatic access to the connectconformance
/// binary.
///
/// This lets us run the conformance tests via `dart test`.
final class ConformanceRunner {
  /// Version of the runner. Uses [defaultVersion] if not provided.
  final String version;

  /// Directory where the conformance binary will be cached.
  ///
  /// Can be controlled by 'CONFORMANCE_CACHE' environment variable.
  /// Defaults to the system's temporary directory..
  late final String cacheDir;

  ConformanceRunner({
    String? version,
    String? cacheDir,
  }) : version = version ?? defaultVersion {
    this.cacheDir = cacheDir ??
        Platform.environment['CONFORMANCE_CACHE'] ??
        Directory.systemTemp.absolute.path;
  }

  /// Runs the conformance runner in 'client' mode and exposes the
  /// in/out of the client-under-test via the [transform].
  Future<int> runClient(
    StreamTransformer<ClientCompatRequest, ClientCompatResponse> transform, {
    List<String>? args,
  }) async {
    return await run(
      ['--mode', 'client', ...(args ?? [])],
      StreamTransformer.fromBind(
        (input) => input
            .transform(_splitEnvelope())
            .map(ClientCompatRequest.fromBuffer)
            .transform(transform)
            .map((m) => m.writeToBuffer())
            .transform(_encodeEnvelope()),
      ),
    );
  }

  /// Runs the conformance runner with given args
  /// as if [handle] is the thing-under-test and
  /// returns the exit code.
  Future<int> run(
    List<String> args,
    StreamTransformer<Uint8List, Uint8List> transform,
  ) async {
    final serverSocket = await ServerSocket.bind(
      InternetAddress.loopbackIPv4,
      0,
    );
    final process = await Process.start(await _binary, [
      ...args,
      '--',
      'dart',
      'run',
      'conformance:pipe', // package:bin https://dart.dev/tools/dart-run#in-a-depended-on-package
      '--port',
      serverSocket.port.toString(),
    ]);
    // Forward the runner's own output to stdout
    process.stdout.pipe(stdout);
    process.stderr.pipe(stderr);
    final socket = await serverSocket.first;
    // Apply the transform and send pipe the output back to the socket.
    // pipe closes the socket.
    await socket.transform(transform).cast<List<int>>().pipe(socket);
    await serverSocket.close();
    return await process.exitCode;
  }

  /// Returns the path to the binary.
  Future<String> get _binary async {
    final bin = Platform.operatingSystem == "windows"
        ? "connectconformance.exe"
        : "connectconformance";
    final binPath = p.join(cacheDir, bin);
    // Check to see if the binary is already at path and matches the version.
    if (File(binPath).existsSync()) {
      final version = Process.runSync(binPath, ["--version"]).stdout as String;
      if (version.endsWith(this.version)) {
        return binPath;
      }
    }
    final artifactName = _getArtifactNameForEnv(version);
    final tempDir = await Directory.systemTemp.createTemp("conformance");
    final downloadTo = p.join(tempDir.absolute.path, artifactName);
    await _download(
      'https://github.com/connectrpc/conformance/releases/download/$version/$artifactName',
      downloadTo,
    );
    await _extractBinary(downloadTo, binPath);
    await Process.run('chmod', ['+x', binPath]);
    return binPath;
  }
}

/// Downloads a file to [to].
Future<void> _download(String url, String to) async {
  final req = await HttpClient().getUrl(Uri.parse(url));
  final res = await req.close();
  await res.pipe(File(to).openWrite());
}

String _getArtifactNameForEnv(String version) {
  final suffix = switch (Abi.current()) {
    Abi.macosX64 => "Darwin-x86_64.tar.gz",
    Abi.macosArm64 => "Darwin-arm64.tar.gz",
    Abi.linuxArm64 => "Linux-aarch64.tar.gz",
    Abi.linuxX64 => "Linux-x86_64.tar.gz",
    Abi.windowsArm64 => "Windows-arm64.zip",
    Abi.windowsX64 => "Windows-x86_64.zip",
    _ => throw 'Unsupported platform ${Abi.current()}',
  };
  return 'connectconformance-$version-$suffix';
}

Future<void> _extractBinary(String path, String to) async {
  final archiveFile = InputFileStream(path);
  final binName =
      path.endsWith(".zip") ? "connectconformance.exe" : "connectconformance";
  final archive = path.endsWith(".zip")
      ? ZipDecoder().decodeBuffer(archiveFile)
      : TarDecoder().decodeBytes(GZipDecoder().decodeBuffer(archiveFile));
  final file = archive.files.singleWhere((f) => f.name == binName, orElse: () {
    throw "Failed to extract connectconformance.exe";
  });
  final out = OutputFileStream(to);
  file.writeContent(out);
  await out.close();
}

StreamTransformer<Uint8List, Uint8List> _splitEnvelope() {
  return StreamTransformer.fromBind((stream) async* {
    var buffer = Uint8List(0);
    await for (final data in stream) {
      buffer = Uint8List.fromList(buffer + data);
      while (true) {
        if (buffer.lengthInBytes < 4) {
          // size is incomplete, buffer more data
          break;
        }
        final size = ByteData.sublistView(buffer, 0, 4).getUint32(0);
        if (size + 4 > buffer.lengthInBytes) {
          // message is incomplete, buffer more data
          break;
        }
        yield buffer.sublist(4, size + 4);
        buffer = buffer.sublist(size + 4);
      }
    }
  });
}

StreamTransformer<Uint8List, Uint8List> _encodeEnvelope() {
  return StreamTransformer.fromHandlers(
    handleData: (data, sink) {
      final sizeBytes = Uint8List(4);
      ByteData.sublistView(sizeBytes).setUint32(
        0,
        data.lengthInBytes,
      );
      sink.add(sizeBytes);
      sink.add(data);
    },
  );
}
