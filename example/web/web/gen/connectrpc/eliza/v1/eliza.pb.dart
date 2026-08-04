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
// Generated from connectrpc/eliza/v1/eliza.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// SayRequest is a single-sentence request.
class SayRequest extends $pb.GeneratedMessage {
  factory SayRequest({
    $core.String? sentence,
  }) {
    final result = create();
    if (sentence != null) result.sentence = sentence;
    return result;
  }

  SayRequest._();

  factory SayRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SayRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SayRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'connectrpc.eliza.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sentence')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SayRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SayRequest copyWith(void Function(SayRequest) updates) =>
      super.copyWith((message) => updates(message as SayRequest)) as SayRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SayRequest create() => SayRequest._();
  @$core.override
  SayRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SayRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SayRequest>(create);
  static SayRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sentence => $_getSZ(0);
  @$pb.TagNumber(1)
  set sentence($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSentence() => $_has(0);
  @$pb.TagNumber(1)
  void clearSentence() => $_clearField(1);
}

/// SayResponse is a single-sentence response.
class SayResponse extends $pb.GeneratedMessage {
  factory SayResponse({
    $core.String? sentence,
  }) {
    final result = create();
    if (sentence != null) result.sentence = sentence;
    return result;
  }

  SayResponse._();

  factory SayResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SayResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SayResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'connectrpc.eliza.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sentence')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SayResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SayResponse copyWith(void Function(SayResponse) updates) =>
      super.copyWith((message) => updates(message as SayResponse))
          as SayResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SayResponse create() => SayResponse._();
  @$core.override
  SayResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SayResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SayResponse>(create);
  static SayResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sentence => $_getSZ(0);
  @$pb.TagNumber(1)
  set sentence($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSentence() => $_has(0);
  @$pb.TagNumber(1)
  void clearSentence() => $_clearField(1);
}

/// ConverseRequest is a single sentence request sent as part of a
/// back-and-forth conversation.
class ConverseRequest extends $pb.GeneratedMessage {
  factory ConverseRequest({
    $core.String? sentence,
  }) {
    final result = create();
    if (sentence != null) result.sentence = sentence;
    return result;
  }

  ConverseRequest._();

  factory ConverseRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ConverseRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConverseRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'connectrpc.eliza.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sentence')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConverseRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConverseRequest copyWith(void Function(ConverseRequest) updates) =>
      super.copyWith((message) => updates(message as ConverseRequest))
          as ConverseRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConverseRequest create() => ConverseRequest._();
  @$core.override
  ConverseRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ConverseRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConverseRequest>(create);
  static ConverseRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sentence => $_getSZ(0);
  @$pb.TagNumber(1)
  set sentence($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSentence() => $_has(0);
  @$pb.TagNumber(1)
  void clearSentence() => $_clearField(1);
}

/// ConverseResponse is a single sentence response sent in answer to a
/// ConverseRequest.
class ConverseResponse extends $pb.GeneratedMessage {
  factory ConverseResponse({
    $core.String? sentence,
  }) {
    final result = create();
    if (sentence != null) result.sentence = sentence;
    return result;
  }

  ConverseResponse._();

  factory ConverseResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ConverseResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConverseResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'connectrpc.eliza.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sentence')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConverseResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConverseResponse copyWith(void Function(ConverseResponse) updates) =>
      super.copyWith((message) => updates(message as ConverseResponse))
          as ConverseResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConverseResponse create() => ConverseResponse._();
  @$core.override
  ConverseResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ConverseResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConverseResponse>(create);
  static ConverseResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sentence => $_getSZ(0);
  @$pb.TagNumber(1)
  set sentence($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSentence() => $_has(0);
  @$pb.TagNumber(1)
  void clearSentence() => $_clearField(1);
}

/// IntroduceRequest asks Eliza to introduce itself to the named user.
class IntroduceRequest extends $pb.GeneratedMessage {
  factory IntroduceRequest({
    $core.String? name,
  }) {
    final result = create();
    if (name != null) result.name = name;
    return result;
  }

  IntroduceRequest._();

  factory IntroduceRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory IntroduceRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'IntroduceRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'connectrpc.eliza.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IntroduceRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IntroduceRequest copyWith(void Function(IntroduceRequest) updates) =>
      super.copyWith((message) => updates(message as IntroduceRequest))
          as IntroduceRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IntroduceRequest create() => IntroduceRequest._();
  @$core.override
  IntroduceRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static IntroduceRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<IntroduceRequest>(create);
  static IntroduceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);
}

/// IntroduceResponse is one sentence of Eliza's introductory monologue.
class IntroduceResponse extends $pb.GeneratedMessage {
  factory IntroduceResponse({
    $core.String? sentence,
  }) {
    final result = create();
    if (sentence != null) result.sentence = sentence;
    return result;
  }

  IntroduceResponse._();

  factory IntroduceResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory IntroduceResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'IntroduceResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'connectrpc.eliza.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sentence')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IntroduceResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  IntroduceResponse copyWith(void Function(IntroduceResponse) updates) =>
      super.copyWith((message) => updates(message as IntroduceResponse))
          as IntroduceResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IntroduceResponse create() => IntroduceResponse._();
  @$core.override
  IntroduceResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static IntroduceResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<IntroduceResponse>(create);
  static IntroduceResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sentence => $_getSZ(0);
  @$pb.TagNumber(1)
  set sentence($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSentence() => $_has(0);
  @$pb.TagNumber(1)
  void clearSentence() => $_clearField(1);
}

/// ElizaService provides a way to talk to Eliza, a port of the DOCTOR script
/// for Joseph Weizenbaum's original ELIZA program. Created in the mid-1960s at
/// the MIT Artificial Intelligence Laboratory, ELIZA demonstrates the
/// superficiality of human-computer communication. DOCTOR simulates a
/// psychotherapist, and is commonly found as an Easter egg in emacs
/// distributions.
class ElizaServiceApi {
  final $pb.RpcClient _client;

  ElizaServiceApi(this._client);

  /// Say is a unary RPC. Eliza responds to the prompt with a single sentence.
  $async.Future<SayResponse> say($pb.ClientContext? ctx, SayRequest request) =>
      _client.invoke<SayResponse>(
          ctx, 'ElizaService', 'Say', request, SayResponse());

  /// Converse is a bidirectional RPC. The caller may exchange multiple
  /// back-and-forth messages with Eliza over a long-lived connection. Eliza
  /// responds to each ConverseRequest with a ConverseResponse.
  $async.Future<ConverseResponse> converse(
          $pb.ClientContext? ctx, ConverseRequest request) =>
      _client.invoke<ConverseResponse>(
          ctx, 'ElizaService', 'Converse', request, ConverseResponse());

  /// Introduce is a server streaming RPC. Given the caller's name, Eliza
  /// returns a stream of sentences to introduce itself.
  $async.Future<IntroduceResponse> introduce(
          $pb.ClientContext? ctx, IntroduceRequest request) =>
      _client.invoke<IntroduceResponse>(
          ctx, 'ElizaService', 'Introduce', request, IntroduceResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
