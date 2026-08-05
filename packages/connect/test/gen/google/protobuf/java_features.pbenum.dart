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

// This is a generated file - do not edit.
//
// Generated from google/protobuf/java_features.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// The UTF8 validation strategy to use.
class JavaFeatures_Utf8Validation extends $pb.ProtobufEnum {
  /// Invalid default, which should never be used.
  static const JavaFeatures_Utf8Validation UTF8_VALIDATION_UNKNOWN =
      JavaFeatures_Utf8Validation._(
          0, _omitEnumNames ? '' : 'UTF8_VALIDATION_UNKNOWN');

  /// Respect the UTF8 validation behavior specified by the global
  /// utf8_validation feature.
  static const JavaFeatures_Utf8Validation DEFAULT =
      JavaFeatures_Utf8Validation._(1, _omitEnumNames ? '' : 'DEFAULT');

  /// Verifies UTF8 validity overriding the global utf8_validation
  /// feature. This represents the legacy java_string_check_utf8 option.
  static const JavaFeatures_Utf8Validation VERIFY =
      JavaFeatures_Utf8Validation._(2, _omitEnumNames ? '' : 'VERIFY');

  static const $core.List<JavaFeatures_Utf8Validation> values =
      <JavaFeatures_Utf8Validation>[
    UTF8_VALIDATION_UNKNOWN,
    DEFAULT,
    VERIFY,
  ];

  static final $core.List<JavaFeatures_Utf8Validation?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static JavaFeatures_Utf8Validation? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const JavaFeatures_Utf8Validation._(super.value, super.name);
}

class JavaFeatures_NestInFileClassFeature_NestInFileClass
    extends $pb.ProtobufEnum {
  /// Invalid default, which should never be used.
  static const JavaFeatures_NestInFileClassFeature_NestInFileClass
      NEST_IN_FILE_CLASS_UNKNOWN =
      JavaFeatures_NestInFileClassFeature_NestInFileClass._(
          0, _omitEnumNames ? '' : 'NEST_IN_FILE_CLASS_UNKNOWN');

  /// Do not nest the generated class in the file class.
  static const JavaFeatures_NestInFileClassFeature_NestInFileClass NO =
      JavaFeatures_NestInFileClassFeature_NestInFileClass._(
          1, _omitEnumNames ? '' : 'NO');

  /// Nest the generated class in the file class.
  static const JavaFeatures_NestInFileClassFeature_NestInFileClass YES =
      JavaFeatures_NestInFileClassFeature_NestInFileClass._(
          2, _omitEnumNames ? '' : 'YES');

  /// Fall back to the `java_multiple_files` option. Users won't be able to
  /// set this option.
  static const JavaFeatures_NestInFileClassFeature_NestInFileClass LEGACY =
      JavaFeatures_NestInFileClassFeature_NestInFileClass._(
          3, _omitEnumNames ? '' : 'LEGACY');

  static const $core.List<JavaFeatures_NestInFileClassFeature_NestInFileClass>
      values = <JavaFeatures_NestInFileClassFeature_NestInFileClass>[
    NEST_IN_FILE_CLASS_UNKNOWN,
    NO,
    YES,
    LEGACY,
  ];

  static final $core.List<JavaFeatures_NestInFileClassFeature_NestInFileClass?>
      _byValue = $pb.ProtobufEnum.$_initByValueList(values, 3);
  static JavaFeatures_NestInFileClassFeature_NestInFileClass? valueOf(
          $core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const JavaFeatures_NestInFileClassFeature_NestInFileClass._(
      super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
