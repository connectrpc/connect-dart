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

import 'java_features.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'java_features.pbenum.dart';

class JavaFeatures_NestInFileClassFeature extends $pb.GeneratedMessage {
  factory JavaFeatures_NestInFileClassFeature() => create();

  JavaFeatures_NestInFileClassFeature._();

  factory JavaFeatures_NestInFileClassFeature.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory JavaFeatures_NestInFileClassFeature.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'JavaFeatures.NestInFileClassFeature',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JavaFeatures_NestInFileClassFeature clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JavaFeatures_NestInFileClassFeature copyWith(
          void Function(JavaFeatures_NestInFileClassFeature) updates) =>
      super.copyWith((message) =>
              updates(message as JavaFeatures_NestInFileClassFeature))
          as JavaFeatures_NestInFileClassFeature;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JavaFeatures_NestInFileClassFeature create() =>
      JavaFeatures_NestInFileClassFeature._();
  @$core.override
  JavaFeatures_NestInFileClassFeature createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static JavaFeatures_NestInFileClassFeature getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          JavaFeatures_NestInFileClassFeature>(create);
  static JavaFeatures_NestInFileClassFeature? _defaultInstance;
}

class JavaFeatures extends $pb.GeneratedMessage {
  factory JavaFeatures({
    $core.bool? legacyClosedEnum,
    JavaFeatures_Utf8Validation? utf8Validation,
    $core.bool? largeEnum,
    $core.bool? useOldOuterClassnameDefault,
    JavaFeatures_NestInFileClassFeature_NestInFileClass? nestInFileClass,
  }) {
    final result = create();
    if (legacyClosedEnum != null) result.legacyClosedEnum = legacyClosedEnum;
    if (utf8Validation != null) result.utf8Validation = utf8Validation;
    if (largeEnum != null) result.largeEnum = largeEnum;
    if (useOldOuterClassnameDefault != null)
      result.useOldOuterClassnameDefault = useOldOuterClassnameDefault;
    if (nestInFileClass != null) result.nestInFileClass = nestInFileClass;
    return result;
  }

  JavaFeatures._();

  factory JavaFeatures.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory JavaFeatures.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'JavaFeatures',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'legacyClosedEnum')
    ..aE<JavaFeatures_Utf8Validation>(
        2, _omitFieldNames ? '' : 'utf8Validation',
        enumValues: JavaFeatures_Utf8Validation.values)
    ..aOB(3, _omitFieldNames ? '' : 'largeEnum')
    ..aOB(4, _omitFieldNames ? '' : 'useOldOuterClassnameDefault')
    ..aE<JavaFeatures_NestInFileClassFeature_NestInFileClass>(
        5, _omitFieldNames ? '' : 'nestInFileClass',
        enumValues: JavaFeatures_NestInFileClassFeature_NestInFileClass.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JavaFeatures clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  JavaFeatures copyWith(void Function(JavaFeatures) updates) =>
      super.copyWith((message) => updates(message as JavaFeatures))
          as JavaFeatures;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static JavaFeatures create() => JavaFeatures._();
  @$core.override
  JavaFeatures createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static JavaFeatures getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<JavaFeatures>(create);
  static JavaFeatures? _defaultInstance;

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
  JavaFeatures_Utf8Validation get utf8Validation => $_getN(1);
  @$pb.TagNumber(2)
  set utf8Validation(JavaFeatures_Utf8Validation value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasUtf8Validation() => $_has(1);
  @$pb.TagNumber(2)
  void clearUtf8Validation() => $_clearField(2);

  /// Allows creation of large Java enums, extending beyond the standard
  /// constant limits imposed by the Java language.
  @$pb.TagNumber(3)
  $core.bool get largeEnum => $_getBF(2);
  @$pb.TagNumber(3)
  set largeEnum($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLargeEnum() => $_has(2);
  @$pb.TagNumber(3)
  void clearLargeEnum() => $_clearField(3);

  /// Whether to use the old default outer class name scheme, or the new feature
  /// which adds a "Proto" suffix to the outer class name.
  ///
  /// Users will not be able to set this option, because we removed it in the
  /// same edition that it was introduced. But we use it to determine which
  /// naming scheme to use for outer class name defaults.
  @$pb.TagNumber(4)
  $core.bool get useOldOuterClassnameDefault => $_getBF(3);
  @$pb.TagNumber(4)
  set useOldOuterClassnameDefault($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUseOldOuterClassnameDefault() => $_has(3);
  @$pb.TagNumber(4)
  void clearUseOldOuterClassnameDefault() => $_clearField(4);

  /// Whether to nest the generated class in the generated file class. This is
  /// only applicable to *top-level* messages, enums, and services.
  @$pb.TagNumber(5)
  JavaFeatures_NestInFileClassFeature_NestInFileClass get nestInFileClass =>
      $_getN(4);
  @$pb.TagNumber(5)
  set nestInFileClass(
          JavaFeatures_NestInFileClassFeature_NestInFileClass value) =>
      $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasNestInFileClass() => $_has(4);
  @$pb.TagNumber(5)
  void clearNestInFileClass() => $_clearField(5);
}

class Java_features {
  static final java = $pb.Extension<JavaFeatures>(
      _omitMessageNames ? '' : 'google.protobuf.FeatureSet',
      _omitFieldNames ? '' : 'java',
      1001,
      $pb.PbFieldType.OM,
      defaultOrMaker: JavaFeatures.getDefault,
      subBuilder: JavaFeatures.create);
  static void registerAllExtensions($pb.ExtensionRegistry registry) {
    registry.add(java);
  }
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
