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

import 'go_features.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'go_features.pbenum.dart';

/// Wrap the OptimizeMode enum in a message for scoping:
/// This way, users can type shorter names (SPEED, CODE_SIZE).
class GoFeatures_OptimizeModeFeature extends $pb.GeneratedMessage {
  factory GoFeatures_OptimizeModeFeature() => create();

  GoFeatures_OptimizeModeFeature._();

  factory GoFeatures_OptimizeModeFeature.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GoFeatures_OptimizeModeFeature.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GoFeatures.OptimizeModeFeature',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GoFeatures_OptimizeModeFeature clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GoFeatures_OptimizeModeFeature copyWith(
          void Function(GoFeatures_OptimizeModeFeature) updates) =>
      super.copyWith(
              (message) => updates(message as GoFeatures_OptimizeModeFeature))
          as GoFeatures_OptimizeModeFeature;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GoFeatures_OptimizeModeFeature create() =>
      GoFeatures_OptimizeModeFeature._();
  @$core.override
  GoFeatures_OptimizeModeFeature createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GoFeatures_OptimizeModeFeature getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GoFeatures_OptimizeModeFeature>(create);
  static GoFeatures_OptimizeModeFeature? _defaultInstance;
}

class GoFeatures extends $pb.GeneratedMessage {
  factory GoFeatures({
    $core.bool? legacyUnmarshalJsonEnum,
    GoFeatures_APILevel? apiLevel,
    GoFeatures_StripEnumPrefix? stripEnumPrefix,
    GoFeatures_OptimizeModeFeature_OptimizeMode? optimizeMode,
  }) {
    final result = create();
    if (legacyUnmarshalJsonEnum != null)
      result.legacyUnmarshalJsonEnum = legacyUnmarshalJsonEnum;
    if (apiLevel != null) result.apiLevel = apiLevel;
    if (stripEnumPrefix != null) result.stripEnumPrefix = stripEnumPrefix;
    if (optimizeMode != null) result.optimizeMode = optimizeMode;
    return result;
  }

  GoFeatures._();

  factory GoFeatures.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GoFeatures.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GoFeatures',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'legacyUnmarshalJsonEnum')
    ..aE<GoFeatures_APILevel>(2, _omitFieldNames ? '' : 'apiLevel',
        enumValues: GoFeatures_APILevel.values)
    ..aE<GoFeatures_StripEnumPrefix>(
        3, _omitFieldNames ? '' : 'stripEnumPrefix',
        enumValues: GoFeatures_StripEnumPrefix.values)
    ..aE<GoFeatures_OptimizeModeFeature_OptimizeMode>(
        4, _omitFieldNames ? '' : 'optimizeMode',
        enumValues: GoFeatures_OptimizeModeFeature_OptimizeMode.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GoFeatures clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GoFeatures copyWith(void Function(GoFeatures) updates) =>
      super.copyWith((message) => updates(message as GoFeatures)) as GoFeatures;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GoFeatures create() => GoFeatures._();
  @$core.override
  GoFeatures createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GoFeatures getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GoFeatures>(create);
  static GoFeatures? _defaultInstance;

  /// Whether or not to generate the deprecated UnmarshalJSON method for enums.
  /// Can only be true for proto using the Open Struct api.
  @$pb.TagNumber(1)
  $core.bool get legacyUnmarshalJsonEnum => $_getBF(0);
  @$pb.TagNumber(1)
  set legacyUnmarshalJsonEnum($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLegacyUnmarshalJsonEnum() => $_has(0);
  @$pb.TagNumber(1)
  void clearLegacyUnmarshalJsonEnum() => $_clearField(1);

  /// One of OPEN, HYBRID or OPAQUE.
  @$pb.TagNumber(2)
  GoFeatures_APILevel get apiLevel => $_getN(1);
  @$pb.TagNumber(2)
  set apiLevel(GoFeatures_APILevel value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasApiLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearApiLevel() => $_clearField(2);

  @$pb.TagNumber(3)
  GoFeatures_StripEnumPrefix get stripEnumPrefix => $_getN(2);
  @$pb.TagNumber(3)
  set stripEnumPrefix(GoFeatures_StripEnumPrefix value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasStripEnumPrefix() => $_has(2);
  @$pb.TagNumber(3)
  void clearStripEnumPrefix() => $_clearField(3);

  @$pb.TagNumber(4)
  GoFeatures_OptimizeModeFeature_OptimizeMode get optimizeMode => $_getN(3);
  @$pb.TagNumber(4)
  set optimizeMode(GoFeatures_OptimizeModeFeature_OptimizeMode value) =>
      $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasOptimizeMode() => $_has(3);
  @$pb.TagNumber(4)
  void clearOptimizeMode() => $_clearField(4);
}

class Go_features {
  static final go = $pb.Extension<GoFeatures>(
      _omitMessageNames ? '' : 'google.protobuf.FeatureSet',
      _omitFieldNames ? '' : 'go',
      1002,
      $pb.PbFieldType.OM,
      defaultOrMaker: GoFeatures.getDefault,
      subBuilder: GoFeatures.create);
  static void registerAllExtensions($pb.ExtensionRegistry registry) {
    registry.add(go);
  }
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
