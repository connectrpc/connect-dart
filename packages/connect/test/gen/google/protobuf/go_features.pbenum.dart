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
// Generated from google/protobuf/go_features.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class GoFeatures_APILevel extends $pb.ProtobufEnum {
  /// API_LEVEL_UNSPECIFIED results in selecting the OPEN API,
  /// but needs to be a separate value to distinguish between
  /// an explicitly set api level or a missing api level.
  static const GoFeatures_APILevel API_LEVEL_UNSPECIFIED =
      GoFeatures_APILevel._(0, _omitEnumNames ? '' : 'API_LEVEL_UNSPECIFIED');
  static const GoFeatures_APILevel API_OPEN =
      GoFeatures_APILevel._(1, _omitEnumNames ? '' : 'API_OPEN');
  static const GoFeatures_APILevel API_HYBRID =
      GoFeatures_APILevel._(2, _omitEnumNames ? '' : 'API_HYBRID');
  static const GoFeatures_APILevel API_OPAQUE =
      GoFeatures_APILevel._(3, _omitEnumNames ? '' : 'API_OPAQUE');

  static const $core.List<GoFeatures_APILevel> values = <GoFeatures_APILevel>[
    API_LEVEL_UNSPECIFIED,
    API_OPEN,
    API_HYBRID,
    API_OPAQUE,
  ];

  static final $core.List<GoFeatures_APILevel?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static GoFeatures_APILevel? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const GoFeatures_APILevel._(super.value, super.name);
}

class GoFeatures_StripEnumPrefix extends $pb.ProtobufEnum {
  static const GoFeatures_StripEnumPrefix STRIP_ENUM_PREFIX_UNSPECIFIED =
      GoFeatures_StripEnumPrefix._(
          0, _omitEnumNames ? '' : 'STRIP_ENUM_PREFIX_UNSPECIFIED');
  static const GoFeatures_StripEnumPrefix STRIP_ENUM_PREFIX_KEEP =
      GoFeatures_StripEnumPrefix._(
          1, _omitEnumNames ? '' : 'STRIP_ENUM_PREFIX_KEEP');
  static const GoFeatures_StripEnumPrefix STRIP_ENUM_PREFIX_GENERATE_BOTH =
      GoFeatures_StripEnumPrefix._(
          2, _omitEnumNames ? '' : 'STRIP_ENUM_PREFIX_GENERATE_BOTH');
  static const GoFeatures_StripEnumPrefix STRIP_ENUM_PREFIX_STRIP =
      GoFeatures_StripEnumPrefix._(
          3, _omitEnumNames ? '' : 'STRIP_ENUM_PREFIX_STRIP');

  static const $core.List<GoFeatures_StripEnumPrefix> values =
      <GoFeatures_StripEnumPrefix>[
    STRIP_ENUM_PREFIX_UNSPECIFIED,
    STRIP_ENUM_PREFIX_KEEP,
    STRIP_ENUM_PREFIX_GENERATE_BOTH,
    STRIP_ENUM_PREFIX_STRIP,
  ];

  static final $core.List<GoFeatures_StripEnumPrefix?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static GoFeatures_StripEnumPrefix? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const GoFeatures_StripEnumPrefix._(super.value, super.name);
}

/// The name of this enum matches OptimizeMode in descriptor.proto.
class GoFeatures_OptimizeModeFeature_OptimizeMode extends $pb.ProtobufEnum {
  /// OPTIMIZE_MODE_UNSPECIFIED results in falling back to the default
  /// (optimize for code size), but needs to be a separate value to distinguish
  /// between an explicitly set optimize mode or a missing optimize mode.
  static const GoFeatures_OptimizeModeFeature_OptimizeMode
      OPTIMIZE_MODE_UNSPECIFIED = GoFeatures_OptimizeModeFeature_OptimizeMode._(
          0, _omitEnumNames ? '' : 'OPTIMIZE_MODE_UNSPECIFIED');
  static const GoFeatures_OptimizeModeFeature_OptimizeMode SPEED =
      GoFeatures_OptimizeModeFeature_OptimizeMode._(
          1, _omitEnumNames ? '' : 'SPEED');
  static const GoFeatures_OptimizeModeFeature_OptimizeMode CODE_SIZE =
      GoFeatures_OptimizeModeFeature_OptimizeMode._(
          2, _omitEnumNames ? '' : 'CODE_SIZE');

  static const $core.List<GoFeatures_OptimizeModeFeature_OptimizeMode> values =
      <GoFeatures_OptimizeModeFeature_OptimizeMode>[
    OPTIMIZE_MODE_UNSPECIFIED,
    SPEED,
    CODE_SIZE,
  ];

  static final $core.List<GoFeatures_OptimizeModeFeature_OptimizeMode?>
      _byValue = $pb.ProtobufEnum.$_initByValueList(values, 2);
  static GoFeatures_OptimizeModeFeature_OptimizeMode? valueOf(
          $core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const GoFeatures_OptimizeModeFeature_OptimizeMode._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
