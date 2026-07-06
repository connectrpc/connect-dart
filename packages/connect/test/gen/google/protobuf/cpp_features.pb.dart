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
// Generated from google/protobuf/cpp_features.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'cpp_features.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'cpp_features.pbenum.dart';

class CppFeatures extends $pb.GeneratedMessage {
  factory CppFeatures({
    $core.bool? legacyClosedEnum,
    CppFeatures_StringType? stringType,
    $core.bool? enumNameUsesStringView,
  }) {
    final result = create();
    if (legacyClosedEnum != null) result.legacyClosedEnum = legacyClosedEnum;
    if (stringType != null) result.stringType = stringType;
    if (enumNameUsesStringView != null)
      result.enumNameUsesStringView = enumNameUsesStringView;
    return result;
  }

  CppFeatures._();

  factory CppFeatures.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CppFeatures.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CppFeatures',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'legacyClosedEnum')
    ..aE<CppFeatures_StringType>(2, _omitFieldNames ? '' : 'stringType',
        enumValues: CppFeatures_StringType.values)
    ..aOB(3, _omitFieldNames ? '' : 'enumNameUsesStringView')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CppFeatures clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CppFeatures copyWith(void Function(CppFeatures) updates) =>
      super.copyWith((message) => updates(message as CppFeatures))
          as CppFeatures;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CppFeatures create() => CppFeatures._();
  @$core.override
  CppFeatures createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static CppFeatures getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CppFeatures>(create);
  static CppFeatures? _defaultInstance;

  /// Whether or not to treat an enum field as closed.  This option is only
  /// applicable to enum fields, and will be removed in the future.  It is
  /// consistent with the legacy behavior of using proto3 enum types for proto2
  /// fields.
  @$pb.TagNumber(1)
  $core.bool get legacyClosedEnum => $_getBF(0);
  @$pb.TagNumber(1)
  set legacyClosedEnum($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLegacyClosedEnum() => $_has(0);
  @$pb.TagNumber(1)
  void clearLegacyClosedEnum() => $_clearField(1);

  @$pb.TagNumber(2)
  CppFeatures_StringType get stringType => $_getN(1);
  @$pb.TagNumber(2)
  set stringType(CppFeatures_StringType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasStringType() => $_has(1);
  @$pb.TagNumber(2)
  void clearStringType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get enumNameUsesStringView => $_getBF(2);
  @$pb.TagNumber(3)
  set enumNameUsesStringView($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasEnumNameUsesStringView() => $_has(2);
  @$pb.TagNumber(3)
  void clearEnumNameUsesStringView() => $_clearField(3);
}

class Cpp_features {
  static final cpp = $pb.Extension<CppFeatures>(
      _omitMessageNames ? '' : 'google.protobuf.FeatureSet',
      _omitFieldNames ? '' : 'cpp',
      1000,
      $pb.PbFieldType.OM,
      defaultOrMaker: CppFeatures.getDefault,
      subBuilder: CppFeatures.create);
  static void registerAllExtensions($pb.ExtensionRegistry registry) {
    registry.add(cpp);
  }
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
