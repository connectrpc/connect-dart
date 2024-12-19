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

@TestOn('vm')
library;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:test/test.dart';

import '../../bin/src/gen/google/protobuf/compiler/plugin.pb.dart';
import '../../bin/src/gen/google/protobuf/descriptor.pb.dart';
import '../../bin/src/run.dart';

void main() async {
  final image = await buildTestImage();
  test('generating all rpc types with protos in the same file', () async {
    expect(
      await runPlugin(image, "foo/v1/foo.proto"),
      matchGenerated(
        ['foo/v1/foo.connect.client', 'foo/v1/foo.connect.spec'],
      ),
    );
  });
  test('generating with request in a different proto file', () async {
    expect(
      await runPlugin(image, "bar/bar_service.proto"),
      matchGenerated(
        ['bar/bar_service.connect.client', 'bar/bar_service.connect.spec'],
      ),
    );
  });
  test('skips empty file', () async {
    final res = await runPlugin(image, "bar/bar.proto");
    expect(res.file, hasLength(0));
  });
  test('generate empty file with keep_empty_files', () async {
    expect(
      await runPlugin(image, "bar/bar.proto", paramter: "keep_empty_files"),
      matchGenerated(
        ['bar/bar.connect.client', 'bar/bar.connect.spec'],
      ),
    );
  });
  test('generates well-known-types as request/response', () async {
    expect(
      await runPlugin(image, "wkt.proto"),
      matchGenerated(
        ['wkt.connect.client', 'wkt.connect.spec'],
      ),
    );
  });
  test('generates for keywords', () async {
    expect(
      await runPlugin(image, "dart.proto"),
      matchGenerated(
        ['dart.connect.client', 'dart.connect.spec'],
      ),
    );
  });
  test('generates with conflicting imports', () async {
    expect(
      await runPlugin(image, "connect.proto"),
      matchGenerated(
        ['connect.connect.client', 'connect.connect.spec'],
      ),
    );
  });
  test('generates idempotency option', () async {
    expect(
      await runPlugin(image, "idempotency.proto"),
      matchGenerated(
        ['idempotency.connect.client', 'idempotency.connect.spec'],
      ),
    );
  });
}

Future<CodeGeneratorResponse> runPlugin(
  FileDescriptorSet image,
  String file, {
  String paramter = "",
}) async {
  final req = CodeGeneratorRequest(
    fileToGenerate: [file],
    protoFile: image.file,
    sourceFileDescriptors: image.file.where((fd) => fd.name == file),
    parameter: paramter,
  );
  final buffer = StreamController<List<int>>();
  await run(Stream.fromIterable([req.writeToBuffer()]), buffer);
  return CodeGeneratorResponse.fromBuffer(
    (await buffer.stream.toList()).reduce(
      ((v, e) => v + e),
    ),
  );
}

Future<FileDescriptorSet> buildTestImage() async {
  final result = Process.runSync(
    'buf',
    [
      'build',
      '--as-file-descriptor-set',
      'test/plugin/proto',
      '-o',
      '-#format=json'
    ],
  );
  return FileDescriptorSet()
    ..mergeFromProto3Json(jsonDecode(result.stdout as String));
}

/// Matches generated files against golden files.
///
/// [files] should be Relative to the `test/plugin/golden` directory.
/// Files should omit the `.dart` at the end.
///
/// Setting [replace] to true will replace the golden file with
/// the generated file. This means content verification is effectively skipped.
GeneratedFilesMatcher matchGenerated(
  List<String> files, [
  bool replace = false,
]) {
  return GeneratedFilesMatcher(
    files,
    replace,
  );
}

class GeneratedFilesMatcher extends Matcher {
  final Map<String, File> files;

  /// Whether to replace before checking. Usefule to populate first runs.
  final bool replace;

  GeneratedFilesMatcher(
    List<String> files,
    this.replace,
  ) : files = Map.fromEntries(
          files.map(
            (path) => MapEntry(
              "$path.dart",
              File(p.join("test/plugin/golden", path)),
            ),
          ),
        );

  @override
  // ignore: strict_raw_type
  bool matches(item, Map matchState) {
    if (item is! CodeGeneratorResponse) {
      return false;
    }
    if (item.file.length != files.length) {
      return false;
    }
    for (final file in item.file) {
      final golden = files[file.name];
      if (golden == null) {
        return false;
      }
      if (replace) {
        if (!golden.existsSync()) {
          golden.createSync(recursive: true);
        }
        golden.writeAsStringSync(file.content, flush: true);
      }
      if (golden.readAsStringSync() != file.content) {
        return false;
      }
    }
    return true;
  }

  @override
  Description describe(Description description) {
    return description.add('matches golden files');
  }

  @override
  Description describeMismatch(
    item,
    Description description,
    // ignore: strict_raw_type
    Map matchState,
    bool verbose,
  ) {
    if (item is! CodeGeneratorResponse) {
      return description.add(
        'Expected a CodeGeneratorRespone, got: ${item.runtimeType}',
      );
    }
    if (item.file.length != files.length) {
      return description.add(
        "Generated file count ${item.file.length}, doesn't match expected ${files.length}",
      );
    }
    for (final file in item.file) {
      final golden = files[file.name];
      if (golden == null) {
        description.add(
          'Unexpected file ${file.name} generated',
        );
        continue;
      }
      final goldenContent = golden.readAsStringSync();
      if (goldenContent != file.content) {
        // Reusing the equals matcher gives us a passable diff
        equals(goldenContent).describeMismatch(
          file.content,
          description,
          matchState,
          verbose,
        );
      }
    }
    return description;
  }
}
