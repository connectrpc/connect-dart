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

//
//  Generated code. Do not modify.
//  source: connectrpc/eliza/v1/eliza.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// SayRequest is a single-sentence request.
class SayRequest extends $pb.GeneratedMessage {
  factory SayRequest({
    $core.String? sentence,
  }) {
    final $result = create();
    if (sentence != null) {
      $result.sentence = sentence;
    }
    return $result;
  }
  SayRequest._() : super();
  factory SayRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SayRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SayRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'connectrpc.eliza.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sentence')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SayRequest clone() => SayRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SayRequest copyWith(void Function(SayRequest) updates) =>
      super.copyWith((message) => updates(message as SayRequest)) as SayRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SayRequest create() => SayRequest._();
  SayRequest createEmptyInstance() => create();
  static $pb.PbList<SayRequest> createRepeated() => $pb.PbList<SayRequest>();
  @$core.pragma('dart2js:noInline')
  static SayRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SayRequest>(create);
  static SayRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sentence => $_getSZ(0);
  @$pb.TagNumber(1)
  set sentence($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSentence() => $_has(0);
  @$pb.TagNumber(1)
  void clearSentence() => clearField(1);
}

/// SayResponse is a single-sentence response.
class SayResponse extends $pb.GeneratedMessage {
  factory SayResponse({
    $core.String? sentence,
  }) {
    final $result = create();
    if (sentence != null) {
      $result.sentence = sentence;
    }
    return $result;
  }
  SayResponse._() : super();
  factory SayResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory SayResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SayResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'connectrpc.eliza.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sentence')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  SayResponse clone() => SayResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  SayResponse copyWith(void Function(SayResponse) updates) =>
      super.copyWith((message) => updates(message as SayResponse))
          as SayResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SayResponse create() => SayResponse._();
  SayResponse createEmptyInstance() => create();
  static $pb.PbList<SayResponse> createRepeated() => $pb.PbList<SayResponse>();
  @$core.pragma('dart2js:noInline')
  static SayResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SayResponse>(create);
  static SayResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sentence => $_getSZ(0);
  @$pb.TagNumber(1)
  set sentence($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSentence() => $_has(0);
  @$pb.TagNumber(1)
  void clearSentence() => clearField(1);
}

/// ConverseRequest is a single sentence request sent as part of a
/// back-and-forth conversation.
class ConverseRequest extends $pb.GeneratedMessage {
  factory ConverseRequest({
    $core.String? sentence,
  }) {
    final $result = create();
    if (sentence != null) {
      $result.sentence = sentence;
    }
    return $result;
  }
  ConverseRequest._() : super();
  factory ConverseRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConverseRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConverseRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'connectrpc.eliza.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sentence')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConverseRequest clone() => ConverseRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConverseRequest copyWith(void Function(ConverseRequest) updates) =>
      super.copyWith((message) => updates(message as ConverseRequest))
          as ConverseRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConverseRequest create() => ConverseRequest._();
  ConverseRequest createEmptyInstance() => create();
  static $pb.PbList<ConverseRequest> createRepeated() =>
      $pb.PbList<ConverseRequest>();
  @$core.pragma('dart2js:noInline')
  static ConverseRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConverseRequest>(create);
  static ConverseRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sentence => $_getSZ(0);
  @$pb.TagNumber(1)
  set sentence($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSentence() => $_has(0);
  @$pb.TagNumber(1)
  void clearSentence() => clearField(1);
}

/// ConverseResponse is a single sentence response sent in answer to a
/// ConverseRequest.
class ConverseResponse extends $pb.GeneratedMessage {
  factory ConverseResponse({
    $core.String? sentence,
  }) {
    final $result = create();
    if (sentence != null) {
      $result.sentence = sentence;
    }
    return $result;
  }
  ConverseResponse._() : super();
  factory ConverseResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConverseResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConverseResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'connectrpc.eliza.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sentence')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConverseResponse clone() => ConverseResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConverseResponse copyWith(void Function(ConverseResponse) updates) =>
      super.copyWith((message) => updates(message as ConverseResponse))
          as ConverseResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConverseResponse create() => ConverseResponse._();
  ConverseResponse createEmptyInstance() => create();
  static $pb.PbList<ConverseResponse> createRepeated() =>
      $pb.PbList<ConverseResponse>();
  @$core.pragma('dart2js:noInline')
  static ConverseResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConverseResponse>(create);
  static ConverseResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sentence => $_getSZ(0);
  @$pb.TagNumber(1)
  set sentence($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSentence() => $_has(0);
  @$pb.TagNumber(1)
  void clearSentence() => clearField(1);
}

/// IntroduceRequest asks Eliza to introduce itself to the named user.
class IntroduceRequest extends $pb.GeneratedMessage {
  factory IntroduceRequest({
    $core.String? name,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  IntroduceRequest._() : super();
  factory IntroduceRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory IntroduceRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'IntroduceRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'connectrpc.eliza.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  IntroduceRequest clone() => IntroduceRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  IntroduceRequest copyWith(void Function(IntroduceRequest) updates) =>
      super.copyWith((message) => updates(message as IntroduceRequest))
          as IntroduceRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IntroduceRequest create() => IntroduceRequest._();
  IntroduceRequest createEmptyInstance() => create();
  static $pb.PbList<IntroduceRequest> createRepeated() =>
      $pb.PbList<IntroduceRequest>();
  @$core.pragma('dart2js:noInline')
  static IntroduceRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<IntroduceRequest>(create);
  static IntroduceRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);
}

/// IntroduceResponse is one sentence of Eliza's introductory monologue.
class IntroduceResponse extends $pb.GeneratedMessage {
  factory IntroduceResponse({
    $core.String? sentence,
  }) {
    final $result = create();
    if (sentence != null) {
      $result.sentence = sentence;
    }
    return $result;
  }
  IntroduceResponse._() : super();
  factory IntroduceResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory IntroduceResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'IntroduceResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'connectrpc.eliza.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'sentence')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  IntroduceResponse clone() => IntroduceResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  IntroduceResponse copyWith(void Function(IntroduceResponse) updates) =>
      super.copyWith((message) => updates(message as IntroduceResponse))
          as IntroduceResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IntroduceResponse create() => IntroduceResponse._();
  IntroduceResponse createEmptyInstance() => create();
  static $pb.PbList<IntroduceResponse> createRepeated() =>
      $pb.PbList<IntroduceResponse>();
  @$core.pragma('dart2js:noInline')
  static IntroduceResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<IntroduceResponse>(create);
  static IntroduceResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sentence => $_getSZ(0);
  @$pb.TagNumber(1)
  set sentence($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSentence() => $_has(0);
  @$pb.TagNumber(1)
  void clearSentence() => clearField(1);
}

class ElizaServiceApi {
  $pb.RpcClient _client;
  ElizaServiceApi(this._client);

  $async.Future<SayResponse> say($pb.ClientContext? ctx, SayRequest request) =>
      _client.invoke<SayResponse>(
          ctx, 'ElizaService', 'Say', request, SayResponse());
  $async.Future<ConverseResponse> converse(
          $pb.ClientContext? ctx, ConverseRequest request) =>
      _client.invoke<ConverseResponse>(
          ctx, 'ElizaService', 'Converse', request, ConverseResponse());
  $async.Future<IntroduceResponse> introduce(
          $pb.ClientContext? ctx, IntroduceRequest request) =>
      _client.invoke<IntroduceResponse>(
          ctx, 'ElizaService', 'Introduce', request, IntroduceResponse());
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
