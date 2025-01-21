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

import 'dart:typed_data';

import 'gen/google/protobuf/compiler/plugin.pb.dart';
import 'gen/google/protobuf/descriptor.pb.dart';
import 'plugin.dart';

/// Schema describes the files and types that the plugin is
/// requested to generate.
final class Schema {
  /// Files to generate.
  final List<FileDescriptorProto> files;

  /// All files by their path.
  final Map<String, FileDescriptorProto> file;

  final CodeGeneratorRequest proto;

  /// Whether to print empty files or not.
  final bool keepEmptyFiles;

  factory Schema.fromProto(CodeGeneratorRequest proto) {
    final file = <String, FileDescriptorProto>{};
    for (final protoFile in proto.protoFile) {
      file[protoFile.name] = protoFile;
    }
    var keepEmptyFiles = false;
    if (proto.parameter.isNotEmpty) {
      for (final raw in proto.parameter.split(",")) {
        final parts = raw.split('=');
        final key = parts.first;
        final value = parts.length == 1 ? "" : parts.last;
        switch (key) {
          case "keep_empty_files":
            final val = value.isEmpty ? true : bool.tryParse(value);
            if (val == null) {
              throw "invalid plugin option 'keep_empty_files' must be a bool, got $value";
            }
            keepEmptyFiles = val;
          default:
            throw "Unsupported plugin option $raw";
        }
      }
    }
    return Schema._(proto.sourceFileDescriptors, file, proto, keepEmptyFiles);
  }
  Schema._(this.files, this.file, this.proto, this.keepEmptyFiles);
}

/// Runs the plugin by parsing the [input] into a [CodeGeneratorRequest]
/// and writing the [CodeGeneratorResponse] to [output].
Future<void> run(
  Stream<List<int>> input,
  Sink<List<int>> output,
) async {
  var reqBytes = Uint8List(0);
  await for (final chunk in input) {
    reqBytes = Uint8List.fromList(reqBytes + chunk);
  }
  final res = CodeGeneratorResponse();
  // Adding here instead of setting directly lets us avoid a direct dependency on fixnum package.
  res.supportedFeatures = res.supportedFeatures +
      CodeGeneratorResponse_Feature.FEATURE_PROTO3_OPTIONAL.value;
  try {
    final files = generate(Schema.fromProto(
      CodeGeneratorRequest.fromBuffer(reqBytes),
    ));
    res.file.addAll(files.map(
      (f) => CodeGeneratorResponse_File(
        name: f.path,
        content: f.content,
      ),
    ));
  } catch (err) {
    res.error = err.toString();
  }
  output.add(res.writeToBuffer());
  output.close();
}
