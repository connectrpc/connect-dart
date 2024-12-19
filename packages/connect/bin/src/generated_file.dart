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

import 'gen/google/protobuf/descriptor.pb.dart';
import 'run.dart' show Schema;
import 'symbol.dart';

/// An abstraction for the generated files.
///
/// Handles imports and prints preamble.
final class GeneratedFile {
  /// Path to the generated file, relative to the output directory using "/" as
  /// seperator.
  final String path;

  /// The proto file against which this is generated.
  final FileDescriptorProto proto;

  /// The schema this file belongs to.
  final Schema schema;

  GeneratedFile(this.path, this.schema, this.proto);

  final Map<String, DartLibrary> _libs = {};
  final List<List<Object>> _lines = [];

  /// Print prints a line.
  void p(List<Object> printables) {
    for (var i = 0; i < printables.length; i++) {
      final ident = printables[i];
      if (ident is! DartIdentifier) {
        continue;
      }
      // To avoid duplicate imports we only store one for
      // a matching path. We also always store the first one
      // to be able to modify the import identifier as needed
      // in the case of conflicts.
      final first = _libs[ident.library.path];
      if (first != null) {
        printables[i] = DartIdentifier(first, ident.ident);
      } else {
        _libs[ident.library.path] = ident.library;
      }
    }
    _lines.add(printables);
  }

  /// Gets the content of the file.
  String get content {
    final content = StringBuffer();
    content.writeln("//");
    content.writeln("//  Generated code. Do not modify.");
    content.writeln("//  source: ${proto.name}");
    content.writeln("//");
    content.writeln();
    final importIdentSet = <String>{};
    for (final import in _libs.values) {
      while (importIdentSet.contains(import.ident)) {
        import.ident += r'$';
      }
      content.writeln('import "${import.path}" as ${import.ident};');
      importIdentSet.add(import.ident);
    }
    content.writeln();
    for (final line in _lines) {
      content.writeAll(line);
      content.writeln();
    }
    return content.toString();
  }
}
