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
//  source: google/protobuf/cpp_features.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class CppFeatures_StringType extends $pb.ProtobufEnum {
  static const CppFeatures_StringType STRING_TYPE_UNKNOWN =
      CppFeatures_StringType._(0, _omitEnumNames ? '' : 'STRING_TYPE_UNKNOWN');
  static const CppFeatures_StringType VIEW =
      CppFeatures_StringType._(1, _omitEnumNames ? '' : 'VIEW');
  static const CppFeatures_StringType CORD =
      CppFeatures_StringType._(2, _omitEnumNames ? '' : 'CORD');
  static const CppFeatures_StringType STRING =
      CppFeatures_StringType._(3, _omitEnumNames ? '' : 'STRING');

  static const $core.List<CppFeatures_StringType> values =
      <CppFeatures_StringType>[
    STRING_TYPE_UNKNOWN,
    VIEW,
    CORD,
    STRING,
  ];

  static final $core.Map<$core.int, CppFeatures_StringType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static CppFeatures_StringType? valueOf($core.int value) => _byValue[value];

  const CppFeatures_StringType._($core.int v, $core.String n) : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
