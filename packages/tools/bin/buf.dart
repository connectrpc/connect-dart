// Copyright 2024-2025 The Connect Authors
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

import 'dart:ffi';
import 'dart:io';

import 'package:path/path.dart' as p;

const version = "1.53.0";
const cacheDir = ".tmp/bin";

Future<int> main(List<String> args) async {
  final bufProcess = await Process.start(await binary(), args);
  stdin.pipe(bufProcess.stdin);
  bufProcess.stdout.pipe(stdout);
  bufProcess.stderr.pipe(stderr);
  return await bufProcess.exitCode;
}

Future<String> binary() async {
  final bin = Platform.operatingSystem == "windows" ? "buf.exe" : "buf";
  final binPath = p.join(cacheDir, bin);
  // Check to see if the binary is already at path and matches the version.
  if (File(binPath).existsSync()) {
    final binVersion = Process.runSync(binPath, ["--version"]).stdout as String;
    if (binVersion.trim().contains(version)) {
      return binPath;
    }
  }
  final artifactName = getArtifactNameForEnv();
  await download(
    'https://github.com/bufbuild/buf/releases/download/v$version/$artifactName',
    binPath,
  );
  await Process.run('chmod', ['+x', binPath]);
  return binPath;
}

/// Downloads a file to [to].
Future<void> download(String url, String to) async {
  final req = await HttpClient().getUrl(Uri.parse(url));
  final res = await req.close();
  if (res.statusCode != 200) {
    throw Exception("Failed to download: $url:  ${res.statusCode}");
  }
  final file = await File(to).create(recursive: true);
  await res.pipe(file.openWrite());
}

String getArtifactNameForEnv() {
  final suffix = switch (Abi.current()) {
    Abi.macosX64 => "Darwin-x86_64",
    Abi.macosArm64 => "Darwin-arm64",
    Abi.linuxArm64 => "Linux-aarch64",
    Abi.linuxX64 => "Linux-x86_64",
    Abi.windowsArm64 => "Windows-arm64.exe",
    Abi.windowsX64 => "Windows-x86_64.exe",
    _ => throw 'Unsupported platform ${Abi.current()}',
  };
  return 'buf-$suffix';
}
