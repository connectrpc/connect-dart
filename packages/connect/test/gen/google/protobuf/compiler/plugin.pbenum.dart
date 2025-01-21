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

//
//  Generated code. Do not modify.
//  source: google/protobuf/compiler/plugin.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Sync with code_generator.h.
class CodeGeneratorResponse_Feature extends $pb.ProtobufEnum {
  static const CodeGeneratorResponse_Feature FEATURE_NONE =
      CodeGeneratorResponse_Feature._(0, _omitEnumNames ? '' : 'FEATURE_NONE');
  static const CodeGeneratorResponse_Feature FEATURE_PROTO3_OPTIONAL =
      CodeGeneratorResponse_Feature._(
          1, _omitEnumNames ? '' : 'FEATURE_PROTO3_OPTIONAL');
  static const CodeGeneratorResponse_Feature FEATURE_SUPPORTS_EDITIONS =
      CodeGeneratorResponse_Feature._(
          2, _omitEnumNames ? '' : 'FEATURE_SUPPORTS_EDITIONS');

  static const $core.List<CodeGeneratorResponse_Feature> values =
      <CodeGeneratorResponse_Feature>[
    FEATURE_NONE,
    FEATURE_PROTO3_OPTIONAL,
    FEATURE_SUPPORTS_EDITIONS,
  ];

  static final $core.Map<$core.int, CodeGeneratorResponse_Feature> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static CodeGeneratorResponse_Feature? valueOf($core.int value) =>
      _byValue[value];

  const CodeGeneratorResponse_Feature._($core.int v, $core.String n)
      : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
