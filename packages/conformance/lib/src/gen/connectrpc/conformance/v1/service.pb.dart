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
//  source: connectrpc/conformance/v1/service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../../google/protobuf/any.pb.dart' as $0;
import 'config.pbenum.dart' as $1;

enum UnaryResponseDefinition_Response { responseData, error, notSet }

/// A definition of a response to be sent from a single-response endpoint.
/// Can be used to define a response for unary or client-streaming calls.
class UnaryResponseDefinition extends $pb.GeneratedMessage {
  factory UnaryResponseDefinition({
    $core.Iterable<Header>? responseHeaders,
    $core.List<$core.int>? responseData,
    Error? error,
    $core.Iterable<Header>? responseTrailers,
    RawHTTPResponse? rawResponse,
    $core.int? responseDelayMs,
  }) {
    final $result = create();
    if (responseHeaders != null) {
      $result.responseHeaders.addAll(responseHeaders);
    }
    if (responseData != null) {
      $result.responseData = responseData;
    }
    if (error != null) {
      $result.error = error;
    }
    if (responseTrailers != null) {
      $result.responseTrailers.addAll(responseTrailers);
    }
    if (rawResponse != null) {
      $result.rawResponse = rawResponse;
    }
    if (responseDelayMs != null) {
      $result.responseDelayMs = responseDelayMs;
    }
    return $result;
  }
  UnaryResponseDefinition._() : super();
  factory UnaryResponseDefinition.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnaryResponseDefinition.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, UnaryResponseDefinition_Response>
      _UnaryResponseDefinition_ResponseByTag = {
    2: UnaryResponseDefinition_Response.responseData,
    3: UnaryResponseDefinition_Response.error,
    0: UnaryResponseDefinition_Response.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UnaryResponseDefinition',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'connectrpc.conformance.v1'),
      createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..pc<Header>(
        1, _omitFieldNames ? '' : 'responseHeaders', $pb.PbFieldType.PM,
        subBuilder: Header.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'responseData', $pb.PbFieldType.OY)
    ..aOM<Error>(3, _omitFieldNames ? '' : 'error', subBuilder: Error.create)
    ..pc<Header>(
        4, _omitFieldNames ? '' : 'responseTrailers', $pb.PbFieldType.PM,
        subBuilder: Header.create)
    ..aOM<RawHTTPResponse>(5, _omitFieldNames ? '' : 'rawResponse',
        subBuilder: RawHTTPResponse.create)
    ..a<$core.int>(
        6, _omitFieldNames ? '' : 'responseDelayMs', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnaryResponseDefinition clone() =>
      UnaryResponseDefinition()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnaryResponseDefinition copyWith(
          void Function(UnaryResponseDefinition) updates) =>
      super.copyWith((message) => updates(message as UnaryResponseDefinition))
          as UnaryResponseDefinition;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnaryResponseDefinition create() => UnaryResponseDefinition._();
  UnaryResponseDefinition createEmptyInstance() => create();
  static $pb.PbList<UnaryResponseDefinition> createRepeated() =>
      $pb.PbList<UnaryResponseDefinition>();
  @$core.pragma('dart2js:noInline')
  static UnaryResponseDefinition getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnaryResponseDefinition>(create);
  static UnaryResponseDefinition? _defaultInstance;

  UnaryResponseDefinition_Response whichResponse() =>
      _UnaryResponseDefinition_ResponseByTag[$_whichOneof(0)]!;
  void clearResponse() => clearField($_whichOneof(0));

  /// Response headers to send
  @$pb.TagNumber(1)
  $core.List<Header> get responseHeaders => $_getList(0);

  /// Response data to send
  @$pb.TagNumber(2)
  $core.List<$core.int> get responseData => $_getN(1);
  @$pb.TagNumber(2)
  set responseData($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasResponseData() => $_has(1);
  @$pb.TagNumber(2)
  void clearResponseData() => clearField(2);

  /// Error to raise instead of response message
  /// Servers should build a RequestInfo and append it to the details of the
  /// requested error.
  @$pb.TagNumber(3)
  Error get error => $_getN(2);
  @$pb.TagNumber(3)
  set error(Error v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => clearField(3);
  @$pb.TagNumber(3)
  Error ensureError() => $_ensure(2);

  /// Response trailers to send - together with the error if present
  @$pb.TagNumber(4)
  $core.List<Header> get responseTrailers => $_getList(3);

  ///  This field is only used by the reference server. If you are implementing a
  ///  server under test, you can ignore this field or respond with an error if the
  ///  server receives a request where it is set.
  ///
  ///  For test definitions, this field should be used instead of the above fields.
  @$pb.TagNumber(5)
  RawHTTPResponse get rawResponse => $_getN(4);
  @$pb.TagNumber(5)
  set rawResponse(RawHTTPResponse v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasRawResponse() => $_has(4);
  @$pb.TagNumber(5)
  void clearRawResponse() => clearField(5);
  @$pb.TagNumber(5)
  RawHTTPResponse ensureRawResponse() => $_ensure(4);

  /// Wait this many milliseconds before sending a response message
  @$pb.TagNumber(6)
  $core.int get responseDelayMs => $_getIZ(5);
  @$pb.TagNumber(6)
  set responseDelayMs($core.int v) {
    $_setUnsignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasResponseDelayMs() => $_has(5);
  @$pb.TagNumber(6)
  void clearResponseDelayMs() => clearField(6);
}

/// A definition of responses to be sent from a streaming endpoint.
/// Can be used to define responses for server-streaming or bidi-streaming calls.
class StreamResponseDefinition extends $pb.GeneratedMessage {
  factory StreamResponseDefinition({
    $core.Iterable<Header>? responseHeaders,
    $core.Iterable<$core.List<$core.int>>? responseData,
    $core.int? responseDelayMs,
    Error? error,
    $core.Iterable<Header>? responseTrailers,
    RawHTTPResponse? rawResponse,
  }) {
    final $result = create();
    if (responseHeaders != null) {
      $result.responseHeaders.addAll(responseHeaders);
    }
    if (responseData != null) {
      $result.responseData.addAll(responseData);
    }
    if (responseDelayMs != null) {
      $result.responseDelayMs = responseDelayMs;
    }
    if (error != null) {
      $result.error = error;
    }
    if (responseTrailers != null) {
      $result.responseTrailers.addAll(responseTrailers);
    }
    if (rawResponse != null) {
      $result.rawResponse = rawResponse;
    }
    return $result;
  }
  StreamResponseDefinition._() : super();
  factory StreamResponseDefinition.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StreamResponseDefinition.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StreamResponseDefinition',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'connectrpc.conformance.v1'),
      createEmptyInstance: create)
    ..pc<Header>(
        1, _omitFieldNames ? '' : 'responseHeaders', $pb.PbFieldType.PM,
        subBuilder: Header.create)
    ..p<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'responseData', $pb.PbFieldType.PY)
    ..a<$core.int>(
        3, _omitFieldNames ? '' : 'responseDelayMs', $pb.PbFieldType.OU3)
    ..aOM<Error>(4, _omitFieldNames ? '' : 'error', subBuilder: Error.create)
    ..pc<Header>(
        5, _omitFieldNames ? '' : 'responseTrailers', $pb.PbFieldType.PM,
        subBuilder: Header.create)
    ..aOM<RawHTTPResponse>(6, _omitFieldNames ? '' : 'rawResponse',
        subBuilder: RawHTTPResponse.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StreamResponseDefinition clone() =>
      StreamResponseDefinition()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StreamResponseDefinition copyWith(
          void Function(StreamResponseDefinition) updates) =>
      super.copyWith((message) => updates(message as StreamResponseDefinition))
          as StreamResponseDefinition;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamResponseDefinition create() => StreamResponseDefinition._();
  StreamResponseDefinition createEmptyInstance() => create();
  static $pb.PbList<StreamResponseDefinition> createRepeated() =>
      $pb.PbList<StreamResponseDefinition>();
  @$core.pragma('dart2js:noInline')
  static StreamResponseDefinition getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StreamResponseDefinition>(create);
  static StreamResponseDefinition? _defaultInstance;

  /// Response headers to send
  @$pb.TagNumber(1)
  $core.List<Header> get responseHeaders => $_getList(0);

  /// Response data to send
  @$pb.TagNumber(2)
  $core.List<$core.List<$core.int>> get responseData => $_getList(1);

  /// Wait this many milliseconds before sending each response message
  @$pb.TagNumber(3)
  $core.int get responseDelayMs => $_getIZ(2);
  @$pb.TagNumber(3)
  set responseDelayMs($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasResponseDelayMs() => $_has(2);
  @$pb.TagNumber(3)
  void clearResponseDelayMs() => clearField(3);

  /// Optional error to raise, but only after sending any response messages.
  /// In the event an immediate error is thrown before any responses are sent,
  /// (i.e. the equivalent of a trailers-only response), then servers should
  /// build a RequestInfo message with available information and append that to
  /// the error details.
  @$pb.TagNumber(4)
  Error get error => $_getN(3);
  @$pb.TagNumber(4)
  set error(Error v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasError() => $_has(3);
  @$pb.TagNumber(4)
  void clearError() => clearField(4);
  @$pb.TagNumber(4)
  Error ensureError() => $_ensure(3);

  /// Response trailers to send - together with the error if present
  @$pb.TagNumber(5)
  $core.List<Header> get responseTrailers => $_getList(4);

  ///  This field is only used by the reference server. If you are implementing a
  ///  server under test, you can ignore this field or respond with an error if the
  ///  server receives a request where it is set.
  ///
  ///  For test definitions, this field should be used instead of the above fields.
  @$pb.TagNumber(6)
  RawHTTPResponse get rawResponse => $_getN(5);
  @$pb.TagNumber(6)
  set rawResponse(RawHTTPResponse v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasRawResponse() => $_has(5);
  @$pb.TagNumber(6)
  void clearRawResponse() => clearField(6);
  @$pb.TagNumber(6)
  RawHTTPResponse ensureRawResponse() => $_ensure(5);
}

class UnaryRequest extends $pb.GeneratedMessage {
  factory UnaryRequest({
    UnaryResponseDefinition? responseDefinition,
    $core.List<$core.int>? requestData,
  }) {
    final $result = create();
    if (responseDefinition != null) {
      $result.responseDefinition = responseDefinition;
    }
    if (requestData != null) {
      $result.requestData = requestData;
    }
    return $result;
  }
  UnaryRequest._() : super();
  factory UnaryRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnaryRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UnaryRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'connectrpc.conformance.v1'),
      createEmptyInstance: create)
    ..aOM<UnaryResponseDefinition>(
        1, _omitFieldNames ? '' : 'responseDefinition',
        subBuilder: UnaryResponseDefinition.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'requestData', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnaryRequest clone() => UnaryRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnaryRequest copyWith(void Function(UnaryRequest) updates) =>
      super.copyWith((message) => updates(message as UnaryRequest))
          as UnaryRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnaryRequest create() => UnaryRequest._();
  UnaryRequest createEmptyInstance() => create();
  static $pb.PbList<UnaryRequest> createRepeated() =>
      $pb.PbList<UnaryRequest>();
  @$core.pragma('dart2js:noInline')
  static UnaryRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnaryRequest>(create);
  static UnaryRequest? _defaultInstance;

  /// The response definition which should be returned in the conformance payload
  @$pb.TagNumber(1)
  UnaryResponseDefinition get responseDefinition => $_getN(0);
  @$pb.TagNumber(1)
  set responseDefinition(UnaryResponseDefinition v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasResponseDefinition() => $_has(0);
  @$pb.TagNumber(1)
  void clearResponseDefinition() => clearField(1);
  @$pb.TagNumber(1)
  UnaryResponseDefinition ensureResponseDefinition() => $_ensure(0);

  /// Additional data. Only used to pad the request size to test large request messages.
  @$pb.TagNumber(2)
  $core.List<$core.int> get requestData => $_getN(1);
  @$pb.TagNumber(2)
  set requestData($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRequestData() => $_has(1);
  @$pb.TagNumber(2)
  void clearRequestData() => clearField(2);
}

class UnaryResponse extends $pb.GeneratedMessage {
  factory UnaryResponse({
    ConformancePayload? payload,
  }) {
    final $result = create();
    if (payload != null) {
      $result.payload = payload;
    }
    return $result;
  }
  UnaryResponse._() : super();
  factory UnaryResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnaryResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UnaryResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'connectrpc.conformance.v1'),
      createEmptyInstance: create)
    ..aOM<ConformancePayload>(1, _omitFieldNames ? '' : 'payload',
        subBuilder: ConformancePayload.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnaryResponse clone() => UnaryResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnaryResponse copyWith(void Function(UnaryResponse) updates) =>
      super.copyWith((message) => updates(message as UnaryResponse))
          as UnaryResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnaryResponse create() => UnaryResponse._();
  UnaryResponse createEmptyInstance() => create();
  static $pb.PbList<UnaryResponse> createRepeated() =>
      $pb.PbList<UnaryResponse>();
  @$core.pragma('dart2js:noInline')
  static UnaryResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnaryResponse>(create);
  static UnaryResponse? _defaultInstance;

  /// The conformance payload to respond with.
  @$pb.TagNumber(1)
  ConformancePayload get payload => $_getN(0);
  @$pb.TagNumber(1)
  set payload(ConformancePayload v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPayload() => $_has(0);
  @$pb.TagNumber(1)
  void clearPayload() => clearField(1);
  @$pb.TagNumber(1)
  ConformancePayload ensurePayload() => $_ensure(0);
}

class IdempotentUnaryRequest extends $pb.GeneratedMessage {
  factory IdempotentUnaryRequest({
    UnaryResponseDefinition? responseDefinition,
    $core.List<$core.int>? requestData,
  }) {
    final $result = create();
    if (responseDefinition != null) {
      $result.responseDefinition = responseDefinition;
    }
    if (requestData != null) {
      $result.requestData = requestData;
    }
    return $result;
  }
  IdempotentUnaryRequest._() : super();
  factory IdempotentUnaryRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory IdempotentUnaryRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'IdempotentUnaryRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'connectrpc.conformance.v1'),
      createEmptyInstance: create)
    ..aOM<UnaryResponseDefinition>(
        1, _omitFieldNames ? '' : 'responseDefinition',
        subBuilder: UnaryResponseDefinition.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'requestData', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  IdempotentUnaryRequest clone() =>
      IdempotentUnaryRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  IdempotentUnaryRequest copyWith(
          void Function(IdempotentUnaryRequest) updates) =>
      super.copyWith((message) => updates(message as IdempotentUnaryRequest))
          as IdempotentUnaryRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IdempotentUnaryRequest create() => IdempotentUnaryRequest._();
  IdempotentUnaryRequest createEmptyInstance() => create();
  static $pb.PbList<IdempotentUnaryRequest> createRepeated() =>
      $pb.PbList<IdempotentUnaryRequest>();
  @$core.pragma('dart2js:noInline')
  static IdempotentUnaryRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<IdempotentUnaryRequest>(create);
  static IdempotentUnaryRequest? _defaultInstance;

  /// The response definition which should be returned in the conformance payload
  @$pb.TagNumber(1)
  UnaryResponseDefinition get responseDefinition => $_getN(0);
  @$pb.TagNumber(1)
  set responseDefinition(UnaryResponseDefinition v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasResponseDefinition() => $_has(0);
  @$pb.TagNumber(1)
  void clearResponseDefinition() => clearField(1);
  @$pb.TagNumber(1)
  UnaryResponseDefinition ensureResponseDefinition() => $_ensure(0);

  /// Additional data. Only used to pad the request size to test large request messages.
  @$pb.TagNumber(2)
  $core.List<$core.int> get requestData => $_getN(1);
  @$pb.TagNumber(2)
  set requestData($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRequestData() => $_has(1);
  @$pb.TagNumber(2)
  void clearRequestData() => clearField(2);
}

class IdempotentUnaryResponse extends $pb.GeneratedMessage {
  factory IdempotentUnaryResponse({
    ConformancePayload? payload,
  }) {
    final $result = create();
    if (payload != null) {
      $result.payload = payload;
    }
    return $result;
  }
  IdempotentUnaryResponse._() : super();
  factory IdempotentUnaryResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory IdempotentUnaryResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'IdempotentUnaryResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'connectrpc.conformance.v1'),
      createEmptyInstance: create)
    ..aOM<ConformancePayload>(1, _omitFieldNames ? '' : 'payload',
        subBuilder: ConformancePayload.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  IdempotentUnaryResponse clone() =>
      IdempotentUnaryResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  IdempotentUnaryResponse copyWith(
          void Function(IdempotentUnaryResponse) updates) =>
      super.copyWith((message) => updates(message as IdempotentUnaryResponse))
          as IdempotentUnaryResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static IdempotentUnaryResponse create() => IdempotentUnaryResponse._();
  IdempotentUnaryResponse createEmptyInstance() => create();
  static $pb.PbList<IdempotentUnaryResponse> createRepeated() =>
      $pb.PbList<IdempotentUnaryResponse>();
  @$core.pragma('dart2js:noInline')
  static IdempotentUnaryResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<IdempotentUnaryResponse>(create);
  static IdempotentUnaryResponse? _defaultInstance;

  /// The conformance payload to respond with.
  @$pb.TagNumber(1)
  ConformancePayload get payload => $_getN(0);
  @$pb.TagNumber(1)
  set payload(ConformancePayload v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPayload() => $_has(0);
  @$pb.TagNumber(1)
  void clearPayload() => clearField(1);
  @$pb.TagNumber(1)
  ConformancePayload ensurePayload() => $_ensure(0);
}

class ServerStreamRequest extends $pb.GeneratedMessage {
  factory ServerStreamRequest({
    StreamResponseDefinition? responseDefinition,
    $core.List<$core.int>? requestData,
  }) {
    final $result = create();
    if (responseDefinition != null) {
      $result.responseDefinition = responseDefinition;
    }
    if (requestData != null) {
      $result.requestData = requestData;
    }
    return $result;
  }
  ServerStreamRequest._() : super();
  factory ServerStreamRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ServerStreamRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ServerStreamRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'connectrpc.conformance.v1'),
      createEmptyInstance: create)
    ..aOM<StreamResponseDefinition>(
        1, _omitFieldNames ? '' : 'responseDefinition',
        subBuilder: StreamResponseDefinition.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'requestData', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ServerStreamRequest clone() => ServerStreamRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ServerStreamRequest copyWith(void Function(ServerStreamRequest) updates) =>
      super.copyWith((message) => updates(message as ServerStreamRequest))
          as ServerStreamRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ServerStreamRequest create() => ServerStreamRequest._();
  ServerStreamRequest createEmptyInstance() => create();
  static $pb.PbList<ServerStreamRequest> createRepeated() =>
      $pb.PbList<ServerStreamRequest>();
  @$core.pragma('dart2js:noInline')
  static ServerStreamRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ServerStreamRequest>(create);
  static ServerStreamRequest? _defaultInstance;

  /// The response definition which should be returned in the conformance payload.
  @$pb.TagNumber(1)
  StreamResponseDefinition get responseDefinition => $_getN(0);
  @$pb.TagNumber(1)
  set responseDefinition(StreamResponseDefinition v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasResponseDefinition() => $_has(0);
  @$pb.TagNumber(1)
  void clearResponseDefinition() => clearField(1);
  @$pb.TagNumber(1)
  StreamResponseDefinition ensureResponseDefinition() => $_ensure(0);

  /// Additional data. Only used to pad the request size to test large request messages.
  @$pb.TagNumber(2)
  $core.List<$core.int> get requestData => $_getN(1);
  @$pb.TagNumber(2)
  set requestData($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRequestData() => $_has(1);
  @$pb.TagNumber(2)
  void clearRequestData() => clearField(2);
}

class ServerStreamResponse extends $pb.GeneratedMessage {
  factory ServerStreamResponse({
    ConformancePayload? payload,
  }) {
    final $result = create();
    if (payload != null) {
      $result.payload = payload;
    }
    return $result;
  }
  ServerStreamResponse._() : super();
  factory ServerStreamResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ServerStreamResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ServerStreamResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'connectrpc.conformance.v1'),
      createEmptyInstance: create)
    ..aOM<ConformancePayload>(1, _omitFieldNames ? '' : 'payload',
        subBuilder: ConformancePayload.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ServerStreamResponse clone() =>
      ServerStreamResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ServerStreamResponse copyWith(void Function(ServerStreamResponse) updates) =>
      super.copyWith((message) => updates(message as ServerStreamResponse))
          as ServerStreamResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ServerStreamResponse create() => ServerStreamResponse._();
  ServerStreamResponse createEmptyInstance() => create();
  static $pb.PbList<ServerStreamResponse> createRepeated() =>
      $pb.PbList<ServerStreamResponse>();
  @$core.pragma('dart2js:noInline')
  static ServerStreamResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ServerStreamResponse>(create);
  static ServerStreamResponse? _defaultInstance;

  /// The conformance payload to respond with
  @$pb.TagNumber(1)
  ConformancePayload get payload => $_getN(0);
  @$pb.TagNumber(1)
  set payload(ConformancePayload v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPayload() => $_has(0);
  @$pb.TagNumber(1)
  void clearPayload() => clearField(1);
  @$pb.TagNumber(1)
  ConformancePayload ensurePayload() => $_ensure(0);
}

class ClientStreamRequest extends $pb.GeneratedMessage {
  factory ClientStreamRequest({
    UnaryResponseDefinition? responseDefinition,
    $core.List<$core.int>? requestData,
  }) {
    final $result = create();
    if (responseDefinition != null) {
      $result.responseDefinition = responseDefinition;
    }
    if (requestData != null) {
      $result.requestData = requestData;
    }
    return $result;
  }
  ClientStreamRequest._() : super();
  factory ClientStreamRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ClientStreamRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClientStreamRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'connectrpc.conformance.v1'),
      createEmptyInstance: create)
    ..aOM<UnaryResponseDefinition>(
        1, _omitFieldNames ? '' : 'responseDefinition',
        subBuilder: UnaryResponseDefinition.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'requestData', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ClientStreamRequest clone() => ClientStreamRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ClientStreamRequest copyWith(void Function(ClientStreamRequest) updates) =>
      super.copyWith((message) => updates(message as ClientStreamRequest))
          as ClientStreamRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClientStreamRequest create() => ClientStreamRequest._();
  ClientStreamRequest createEmptyInstance() => create();
  static $pb.PbList<ClientStreamRequest> createRepeated() =>
      $pb.PbList<ClientStreamRequest>();
  @$core.pragma('dart2js:noInline')
  static ClientStreamRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClientStreamRequest>(create);
  static ClientStreamRequest? _defaultInstance;

  /// Tells the server how to reply once all client messages are
  /// complete. Required in the first message in the stream, but
  /// should be ignored in subsequent messages.
  @$pb.TagNumber(1)
  UnaryResponseDefinition get responseDefinition => $_getN(0);
  @$pb.TagNumber(1)
  set responseDefinition(UnaryResponseDefinition v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasResponseDefinition() => $_has(0);
  @$pb.TagNumber(1)
  void clearResponseDefinition() => clearField(1);
  @$pb.TagNumber(1)
  UnaryResponseDefinition ensureResponseDefinition() => $_ensure(0);

  /// Additional data for subsequent messages in the stream. Also
  /// used to pad the request size to test large request messages.
  @$pb.TagNumber(2)
  $core.List<$core.int> get requestData => $_getN(1);
  @$pb.TagNumber(2)
  set requestData($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRequestData() => $_has(1);
  @$pb.TagNumber(2)
  void clearRequestData() => clearField(2);
}

class ClientStreamResponse extends $pb.GeneratedMessage {
  factory ClientStreamResponse({
    ConformancePayload? payload,
  }) {
    final $result = create();
    if (payload != null) {
      $result.payload = payload;
    }
    return $result;
  }
  ClientStreamResponse._() : super();
  factory ClientStreamResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ClientStreamResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClientStreamResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'connectrpc.conformance.v1'),
      createEmptyInstance: create)
    ..aOM<ConformancePayload>(1, _omitFieldNames ? '' : 'payload',
        subBuilder: ConformancePayload.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ClientStreamResponse clone() =>
      ClientStreamResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ClientStreamResponse copyWith(void Function(ClientStreamResponse) updates) =>
      super.copyWith((message) => updates(message as ClientStreamResponse))
          as ClientStreamResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClientStreamResponse create() => ClientStreamResponse._();
  ClientStreamResponse createEmptyInstance() => create();
  static $pb.PbList<ClientStreamResponse> createRepeated() =>
      $pb.PbList<ClientStreamResponse>();
  @$core.pragma('dart2js:noInline')
  static ClientStreamResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClientStreamResponse>(create);
  static ClientStreamResponse? _defaultInstance;

  /// The conformance payload to respond with
  @$pb.TagNumber(1)
  ConformancePayload get payload => $_getN(0);
  @$pb.TagNumber(1)
  set payload(ConformancePayload v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPayload() => $_has(0);
  @$pb.TagNumber(1)
  void clearPayload() => clearField(1);
  @$pb.TagNumber(1)
  ConformancePayload ensurePayload() => $_ensure(0);
}

class BidiStreamRequest extends $pb.GeneratedMessage {
  factory BidiStreamRequest({
    StreamResponseDefinition? responseDefinition,
    $core.bool? fullDuplex,
    $core.List<$core.int>? requestData,
  }) {
    final $result = create();
    if (responseDefinition != null) {
      $result.responseDefinition = responseDefinition;
    }
    if (fullDuplex != null) {
      $result.fullDuplex = fullDuplex;
    }
    if (requestData != null) {
      $result.requestData = requestData;
    }
    return $result;
  }
  BidiStreamRequest._() : super();
  factory BidiStreamRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BidiStreamRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BidiStreamRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'connectrpc.conformance.v1'),
      createEmptyInstance: create)
    ..aOM<StreamResponseDefinition>(
        1, _omitFieldNames ? '' : 'responseDefinition',
        subBuilder: StreamResponseDefinition.create)
    ..aOB(2, _omitFieldNames ? '' : 'fullDuplex')
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'requestData', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BidiStreamRequest clone() => BidiStreamRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BidiStreamRequest copyWith(void Function(BidiStreamRequest) updates) =>
      super.copyWith((message) => updates(message as BidiStreamRequest))
          as BidiStreamRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BidiStreamRequest create() => BidiStreamRequest._();
  BidiStreamRequest createEmptyInstance() => create();
  static $pb.PbList<BidiStreamRequest> createRepeated() =>
      $pb.PbList<BidiStreamRequest>();
  @$core.pragma('dart2js:noInline')
  static BidiStreamRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BidiStreamRequest>(create);
  static BidiStreamRequest? _defaultInstance;

  /// Tells the server how to reply; required in the first message
  /// in the stream. Should be ignored in subsequent messages.
  @$pb.TagNumber(1)
  StreamResponseDefinition get responseDefinition => $_getN(0);
  @$pb.TagNumber(1)
  set responseDefinition(StreamResponseDefinition v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasResponseDefinition() => $_has(0);
  @$pb.TagNumber(1)
  void clearResponseDefinition() => clearField(1);
  @$pb.TagNumber(1)
  StreamResponseDefinition ensureResponseDefinition() => $_ensure(0);

  ///  Tells the server whether it should wait for each request
  ///  before sending a response.
  ///
  ///  If true, it indicates the server should effectively interleave the
  ///  stream so messages are sent in request->response pairs.
  ///
  ///  If false, then the response stream will be sent once all request messages
  ///  are finished sending with the only delays between messages
  ///  being the optional fixed milliseconds defined in the response
  ///  definition.
  ///
  ///  This field is only relevant in the first message in the stream
  ///  and should be ignored in subsequent messages.
  @$pb.TagNumber(2)
  $core.bool get fullDuplex => $_getBF(1);
  @$pb.TagNumber(2)
  set fullDuplex($core.bool v) {
    $_setBool(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasFullDuplex() => $_has(1);
  @$pb.TagNumber(2)
  void clearFullDuplex() => clearField(2);

  /// Additional data for subsequent messages in the stream. Also
  /// used to pad the request size to test large request messages.
  @$pb.TagNumber(3)
  $core.List<$core.int> get requestData => $_getN(2);
  @$pb.TagNumber(3)
  set requestData($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasRequestData() => $_has(2);
  @$pb.TagNumber(3)
  void clearRequestData() => clearField(3);
}

class BidiStreamResponse extends $pb.GeneratedMessage {
  factory BidiStreamResponse({
    ConformancePayload? payload,
  }) {
    final $result = create();
    if (payload != null) {
      $result.payload = payload;
    }
    return $result;
  }
  BidiStreamResponse._() : super();
  factory BidiStreamResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory BidiStreamResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BidiStreamResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'connectrpc.conformance.v1'),
      createEmptyInstance: create)
    ..aOM<ConformancePayload>(1, _omitFieldNames ? '' : 'payload',
        subBuilder: ConformancePayload.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  BidiStreamResponse clone() => BidiStreamResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  BidiStreamResponse copyWith(void Function(BidiStreamResponse) updates) =>
      super.copyWith((message) => updates(message as BidiStreamResponse))
          as BidiStreamResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BidiStreamResponse create() => BidiStreamResponse._();
  BidiStreamResponse createEmptyInstance() => create();
  static $pb.PbList<BidiStreamResponse> createRepeated() =>
      $pb.PbList<BidiStreamResponse>();
  @$core.pragma('dart2js:noInline')
  static BidiStreamResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BidiStreamResponse>(create);
  static BidiStreamResponse? _defaultInstance;

  /// The conformance payload to respond with
  @$pb.TagNumber(1)
  ConformancePayload get payload => $_getN(0);
  @$pb.TagNumber(1)
  set payload(ConformancePayload v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasPayload() => $_has(0);
  @$pb.TagNumber(1)
  void clearPayload() => clearField(1);
  @$pb.TagNumber(1)
  ConformancePayload ensurePayload() => $_ensure(0);
}

class UnimplementedRequest extends $pb.GeneratedMessage {
  factory UnimplementedRequest() => create();
  UnimplementedRequest._() : super();
  factory UnimplementedRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnimplementedRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UnimplementedRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'connectrpc.conformance.v1'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnimplementedRequest clone() =>
      UnimplementedRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnimplementedRequest copyWith(void Function(UnimplementedRequest) updates) =>
      super.copyWith((message) => updates(message as UnimplementedRequest))
          as UnimplementedRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnimplementedRequest create() => UnimplementedRequest._();
  UnimplementedRequest createEmptyInstance() => create();
  static $pb.PbList<UnimplementedRequest> createRepeated() =>
      $pb.PbList<UnimplementedRequest>();
  @$core.pragma('dart2js:noInline')
  static UnimplementedRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnimplementedRequest>(create);
  static UnimplementedRequest? _defaultInstance;
}

class UnimplementedResponse extends $pb.GeneratedMessage {
  factory UnimplementedResponse() => create();
  UnimplementedResponse._() : super();
  factory UnimplementedResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory UnimplementedResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UnimplementedResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'connectrpc.conformance.v1'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  UnimplementedResponse clone() =>
      UnimplementedResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  UnimplementedResponse copyWith(
          void Function(UnimplementedResponse) updates) =>
      super.copyWith((message) => updates(message as UnimplementedResponse))
          as UnimplementedResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UnimplementedResponse create() => UnimplementedResponse._();
  UnimplementedResponse createEmptyInstance() => create();
  static $pb.PbList<UnimplementedResponse> createRepeated() =>
      $pb.PbList<UnimplementedResponse>();
  @$core.pragma('dart2js:noInline')
  static UnimplementedResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UnimplementedResponse>(create);
  static UnimplementedResponse? _defaultInstance;
}

class ConformancePayload_RequestInfo extends $pb.GeneratedMessage {
  factory ConformancePayload_RequestInfo({
    $core.Iterable<Header>? requestHeaders,
    $fixnum.Int64? timeoutMs,
    $core.Iterable<$0.Any>? requests,
    ConformancePayload_ConnectGetInfo? connectGetInfo,
  }) {
    final $result = create();
    if (requestHeaders != null) {
      $result.requestHeaders.addAll(requestHeaders);
    }
    if (timeoutMs != null) {
      $result.timeoutMs = timeoutMs;
    }
    if (requests != null) {
      $result.requests.addAll(requests);
    }
    if (connectGetInfo != null) {
      $result.connectGetInfo = connectGetInfo;
    }
    return $result;
  }
  ConformancePayload_RequestInfo._() : super();
  factory ConformancePayload_RequestInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConformancePayload_RequestInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConformancePayload.RequestInfo',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'connectrpc.conformance.v1'),
      createEmptyInstance: create)
    ..pc<Header>(1, _omitFieldNames ? '' : 'requestHeaders', $pb.PbFieldType.PM,
        subBuilder: Header.create)
    ..aInt64(2, _omitFieldNames ? '' : 'timeoutMs')
    ..pc<$0.Any>(3, _omitFieldNames ? '' : 'requests', $pb.PbFieldType.PM,
        subBuilder: $0.Any.create)
    ..aOM<ConformancePayload_ConnectGetInfo>(
        4, _omitFieldNames ? '' : 'connectGetInfo',
        subBuilder: ConformancePayload_ConnectGetInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConformancePayload_RequestInfo clone() =>
      ConformancePayload_RequestInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConformancePayload_RequestInfo copyWith(
          void Function(ConformancePayload_RequestInfo) updates) =>
      super.copyWith(
              (message) => updates(message as ConformancePayload_RequestInfo))
          as ConformancePayload_RequestInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConformancePayload_RequestInfo create() =>
      ConformancePayload_RequestInfo._();
  ConformancePayload_RequestInfo createEmptyInstance() => create();
  static $pb.PbList<ConformancePayload_RequestInfo> createRepeated() =>
      $pb.PbList<ConformancePayload_RequestInfo>();
  @$core.pragma('dart2js:noInline')
  static ConformancePayload_RequestInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConformancePayload_RequestInfo>(create);
  static ConformancePayload_RequestInfo? _defaultInstance;

  /// The server echos back the request headers it observed here.
  @$pb.TagNumber(1)
  $core.List<Header> get requestHeaders => $_getList(0);

  /// The timeout observed that was included in the request. Other timeouts use a
  /// type of uint32, but we want to be lenient here to allow whatever value the RPC
  /// server observes, even if it's outside the range of uint32.
  @$pb.TagNumber(2)
  $fixnum.Int64 get timeoutMs => $_getI64(1);
  @$pb.TagNumber(2)
  set timeoutMs($fixnum.Int64 v) {
    $_setInt64(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasTimeoutMs() => $_has(1);
  @$pb.TagNumber(2)
  void clearTimeoutMs() => clearField(2);

  /// The server should echo back all requests received.
  /// For unary and server-streaming requests, this should always contain a single request
  /// For client-streaming and half-duplex bidi-streaming, this should contain
  /// all client requests in the order received and be present in each response.
  /// For full-duplex bidirectional-streaming, this should contain all requests in the order
  /// they were received since the last sent response.
  @$pb.TagNumber(3)
  $core.List<$0.Any> get requests => $_getList(2);

  /// If present, the request used the Connect protocol and a GET method. This
  /// captures other relevant information about the request. If a server implementation
  /// is unable to populate this (due to the server framework not exposing all of these
  /// details to application code), it may be an empty message. This implies that the
  /// server framework, at a minimum, at least expose to application code whether the
  /// request used GET vs. POST.
  @$pb.TagNumber(4)
  ConformancePayload_ConnectGetInfo get connectGetInfo => $_getN(3);
  @$pb.TagNumber(4)
  set connectGetInfo(ConformancePayload_ConnectGetInfo v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasConnectGetInfo() => $_has(3);
  @$pb.TagNumber(4)
  void clearConnectGetInfo() => clearField(4);
  @$pb.TagNumber(4)
  ConformancePayload_ConnectGetInfo ensureConnectGetInfo() => $_ensure(3);
}

class ConformancePayload_ConnectGetInfo extends $pb.GeneratedMessage {
  factory ConformancePayload_ConnectGetInfo({
    $core.Iterable<Header>? queryParams,
  }) {
    final $result = create();
    if (queryParams != null) {
      $result.queryParams.addAll(queryParams);
    }
    return $result;
  }
  ConformancePayload_ConnectGetInfo._() : super();
  factory ConformancePayload_ConnectGetInfo.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConformancePayload_ConnectGetInfo.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConformancePayload.ConnectGetInfo',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'connectrpc.conformance.v1'),
      createEmptyInstance: create)
    ..pc<Header>(1, _omitFieldNames ? '' : 'queryParams', $pb.PbFieldType.PM,
        subBuilder: Header.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConformancePayload_ConnectGetInfo clone() =>
      ConformancePayload_ConnectGetInfo()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConformancePayload_ConnectGetInfo copyWith(
          void Function(ConformancePayload_ConnectGetInfo) updates) =>
      super.copyWith((message) =>
              updates(message as ConformancePayload_ConnectGetInfo))
          as ConformancePayload_ConnectGetInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConformancePayload_ConnectGetInfo create() =>
      ConformancePayload_ConnectGetInfo._();
  ConformancePayload_ConnectGetInfo createEmptyInstance() => create();
  static $pb.PbList<ConformancePayload_ConnectGetInfo> createRepeated() =>
      $pb.PbList<ConformancePayload_ConnectGetInfo>();
  @$core.pragma('dart2js:noInline')
  static ConformancePayload_ConnectGetInfo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConformancePayload_ConnectGetInfo>(
          create);
  static ConformancePayload_ConnectGetInfo? _defaultInstance;

  /// The query params observed in the request URL.
  @$pb.TagNumber(1)
  $core.List<Header> get queryParams => $_getList(0);
}

class ConformancePayload extends $pb.GeneratedMessage {
  factory ConformancePayload({
    $core.List<$core.int>? data,
    ConformancePayload_RequestInfo? requestInfo,
  }) {
    final $result = create();
    if (data != null) {
      $result.data = data;
    }
    if (requestInfo != null) {
      $result.requestInfo = requestInfo;
    }
    return $result;
  }
  ConformancePayload._() : super();
  factory ConformancePayload.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConformancePayload.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConformancePayload',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'connectrpc.conformance.v1'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'data', $pb.PbFieldType.OY)
    ..aOM<ConformancePayload_RequestInfo>(
        2, _omitFieldNames ? '' : 'requestInfo',
        subBuilder: ConformancePayload_RequestInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConformancePayload clone() => ConformancePayload()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConformancePayload copyWith(void Function(ConformancePayload) updates) =>
      super.copyWith((message) => updates(message as ConformancePayload))
          as ConformancePayload;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConformancePayload create() => ConformancePayload._();
  ConformancePayload createEmptyInstance() => create();
  static $pb.PbList<ConformancePayload> createRepeated() =>
      $pb.PbList<ConformancePayload>();
  @$core.pragma('dart2js:noInline')
  static ConformancePayload getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConformancePayload>(create);
  static ConformancePayload? _defaultInstance;

  /// Any response data specified in the response definition to the server should be
  /// echoed back here.
  @$pb.TagNumber(1)
  $core.List<$core.int> get data => $_getN(0);
  @$pb.TagNumber(1)
  set data($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasData() => $_has(0);
  @$pb.TagNumber(1)
  void clearData() => clearField(1);

  /// Echoes back information about the request stream observed so far.
  @$pb.TagNumber(2)
  ConformancePayload_RequestInfo get requestInfo => $_getN(1);
  @$pb.TagNumber(2)
  set requestInfo(ConformancePayload_RequestInfo v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasRequestInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearRequestInfo() => clearField(2);
  @$pb.TagNumber(2)
  ConformancePayload_RequestInfo ensureRequestInfo() => $_ensure(1);
}

/// An error definition used for specifying a desired error response
class Error extends $pb.GeneratedMessage {
  factory Error({
    $1.Code? code,
    $core.String? message,
    $core.Iterable<$0.Any>? details,
  }) {
    final $result = create();
    if (code != null) {
      $result.code = code;
    }
    if (message != null) {
      $result.message = message;
    }
    if (details != null) {
      $result.details.addAll(details);
    }
    return $result;
  }
  Error._() : super();
  factory Error.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Error.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Error',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'connectrpc.conformance.v1'),
      createEmptyInstance: create)
    ..e<$1.Code>(1, _omitFieldNames ? '' : 'code', $pb.PbFieldType.OE,
        defaultOrMaker: $1.Code.CODE_UNSPECIFIED,
        valueOf: $1.Code.valueOf,
        enumValues: $1.Code.values)
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..pc<$0.Any>(3, _omitFieldNames ? '' : 'details', $pb.PbFieldType.PM,
        subBuilder: $0.Any.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Error clone() => Error()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Error copyWith(void Function(Error) updates) =>
      super.copyWith((message) => updates(message as Error)) as Error;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Error create() => Error._();
  Error createEmptyInstance() => create();
  static $pb.PbList<Error> createRepeated() => $pb.PbList<Error>();
  @$core.pragma('dart2js:noInline')
  static Error getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Error>(create);
  static Error? _defaultInstance;

  /// The error code.
  /// For a list of Connect error codes see: https://connectrpc.com/docs/protocol#error-codes
  @$pb.TagNumber(1)
  $1.Code get code => $_getN(0);
  @$pb.TagNumber(1)
  set code($1.Code v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  /// If this value is absent in a test case response definition, the contents of the
  /// actual error message will not be checked. This is useful for certain kinds of
  /// error conditions where the exact message to be used is not specified, only the
  /// code.
  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  /// Errors in Connect and gRPC protocols can have arbitrary messages
  /// attached to them, which are known as error details.
  @$pb.TagNumber(3)
  $core.List<$0.Any> get details => $_getList(2);
}

/// A tuple of name and values (ASCII) for a header or trailer entry.
class Header extends $pb.GeneratedMessage {
  factory Header({
    $core.String? name,
    $core.Iterable<$core.String>? value,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (value != null) {
      $result.value.addAll(value);
    }
    return $result;
  }
  Header._() : super();
  factory Header.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Header.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Header',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'connectrpc.conformance.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..pPS(2, _omitFieldNames ? '' : 'value')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Header clone() => Header()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Header copyWith(void Function(Header) updates) =>
      super.copyWith((message) => updates(message as Header)) as Header;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Header create() => Header._();
  Header createEmptyInstance() => create();
  static $pb.PbList<Header> createRepeated() => $pb.PbList<Header>();
  @$core.pragma('dart2js:noInline')
  static Header getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Header>(create);
  static Header? _defaultInstance;

  /// Header/trailer name (key).
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

  /// Header/trailer value. This is repeated to explicitly support headers and
  /// trailers where a key is repeated. In such a case, these values must be in
  /// the same order as which values appeared in the header or trailer block.
  @$pb.TagNumber(2)
  $core.List<$core.String> get value => $_getList(1);
}

class RawHTTPRequest_EncodedQueryParam extends $pb.GeneratedMessage {
  factory RawHTTPRequest_EncodedQueryParam({
    $core.String? name,
    MessageContents? value,
    $core.bool? base64Encode,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (value != null) {
      $result.value = value;
    }
    if (base64Encode != null) {
      $result.base64Encode = base64Encode;
    }
    return $result;
  }
  RawHTTPRequest_EncodedQueryParam._() : super();
  factory RawHTTPRequest_EncodedQueryParam.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RawHTTPRequest_EncodedQueryParam.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RawHTTPRequest.EncodedQueryParam',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'connectrpc.conformance.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOM<MessageContents>(2, _omitFieldNames ? '' : 'value',
        subBuilder: MessageContents.create)
    ..aOB(3, _omitFieldNames ? '' : 'base64Encode')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RawHTTPRequest_EncodedQueryParam clone() =>
      RawHTTPRequest_EncodedQueryParam()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RawHTTPRequest_EncodedQueryParam copyWith(
          void Function(RawHTTPRequest_EncodedQueryParam) updates) =>
      super.copyWith(
              (message) => updates(message as RawHTTPRequest_EncodedQueryParam))
          as RawHTTPRequest_EncodedQueryParam;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RawHTTPRequest_EncodedQueryParam create() =>
      RawHTTPRequest_EncodedQueryParam._();
  RawHTTPRequest_EncodedQueryParam createEmptyInstance() => create();
  static $pb.PbList<RawHTTPRequest_EncodedQueryParam> createRepeated() =>
      $pb.PbList<RawHTTPRequest_EncodedQueryParam>();
  @$core.pragma('dart2js:noInline')
  static RawHTTPRequest_EncodedQueryParam getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RawHTTPRequest_EncodedQueryParam>(
          create);
  static RawHTTPRequest_EncodedQueryParam? _defaultInstance;

  /// Query param name.
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

  /// Query param value.
  @$pb.TagNumber(2)
  MessageContents get value => $_getN(1);
  @$pb.TagNumber(2)
  set value(MessageContents v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasValue() => $_has(1);
  @$pb.TagNumber(2)
  void clearValue() => clearField(2);
  @$pb.TagNumber(2)
  MessageContents ensureValue() => $_ensure(1);

  /// If true, the message contents will be base64-encoded and the
  /// resulting string used as the query parameter value.
  @$pb.TagNumber(3)
  $core.bool get base64Encode => $_getBF(2);
  @$pb.TagNumber(3)
  set base64Encode($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasBase64Encode() => $_has(2);
  @$pb.TagNumber(3)
  void clearBase64Encode() => clearField(3);
}

enum RawHTTPRequest_Body { unary, stream, notSet }

/// RawHTTPRequest models a raw HTTP request. This can be used to craft
/// custom requests with odd properties (including certain kinds of
/// malformed requests) to test edge cases in servers.
class RawHTTPRequest extends $pb.GeneratedMessage {
  factory RawHTTPRequest({
    $core.String? verb,
    $core.String? uri,
    $core.Iterable<Header>? headers,
    $core.Iterable<Header>? rawQueryParams,
    $core.Iterable<RawHTTPRequest_EncodedQueryParam>? encodedQueryParams,
    MessageContents? unary,
    StreamContents? stream,
  }) {
    final $result = create();
    if (verb != null) {
      $result.verb = verb;
    }
    if (uri != null) {
      $result.uri = uri;
    }
    if (headers != null) {
      $result.headers.addAll(headers);
    }
    if (rawQueryParams != null) {
      $result.rawQueryParams.addAll(rawQueryParams);
    }
    if (encodedQueryParams != null) {
      $result.encodedQueryParams.addAll(encodedQueryParams);
    }
    if (unary != null) {
      $result.unary = unary;
    }
    if (stream != null) {
      $result.stream = stream;
    }
    return $result;
  }
  RawHTTPRequest._() : super();
  factory RawHTTPRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RawHTTPRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, RawHTTPRequest_Body>
      _RawHTTPRequest_BodyByTag = {
    6: RawHTTPRequest_Body.unary,
    7: RawHTTPRequest_Body.stream,
    0: RawHTTPRequest_Body.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RawHTTPRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'connectrpc.conformance.v1'),
      createEmptyInstance: create)
    ..oo(0, [6, 7])
    ..aOS(1, _omitFieldNames ? '' : 'verb')
    ..aOS(2, _omitFieldNames ? '' : 'uri')
    ..pc<Header>(3, _omitFieldNames ? '' : 'headers', $pb.PbFieldType.PM,
        subBuilder: Header.create)
    ..pc<Header>(4, _omitFieldNames ? '' : 'rawQueryParams', $pb.PbFieldType.PM,
        subBuilder: Header.create)
    ..pc<RawHTTPRequest_EncodedQueryParam>(
        5, _omitFieldNames ? '' : 'encodedQueryParams', $pb.PbFieldType.PM,
        subBuilder: RawHTTPRequest_EncodedQueryParam.create)
    ..aOM<MessageContents>(6, _omitFieldNames ? '' : 'unary',
        subBuilder: MessageContents.create)
    ..aOM<StreamContents>(7, _omitFieldNames ? '' : 'stream',
        subBuilder: StreamContents.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RawHTTPRequest clone() => RawHTTPRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RawHTTPRequest copyWith(void Function(RawHTTPRequest) updates) =>
      super.copyWith((message) => updates(message as RawHTTPRequest))
          as RawHTTPRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RawHTTPRequest create() => RawHTTPRequest._();
  RawHTTPRequest createEmptyInstance() => create();
  static $pb.PbList<RawHTTPRequest> createRepeated() =>
      $pb.PbList<RawHTTPRequest>();
  @$core.pragma('dart2js:noInline')
  static RawHTTPRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RawHTTPRequest>(create);
  static RawHTTPRequest? _defaultInstance;

  RawHTTPRequest_Body whichBody() =>
      _RawHTTPRequest_BodyByTag[$_whichOneof(0)]!;
  void clearBody() => clearField($_whichOneof(0));

  /// The HTTP verb (i.e. GET , POST).
  @$pb.TagNumber(1)
  $core.String get verb => $_getSZ(0);
  @$pb.TagNumber(1)
  set verb($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasVerb() => $_has(0);
  @$pb.TagNumber(1)
  void clearVerb() => clearField(1);

  /// The URI to send the request to.
  @$pb.TagNumber(2)
  $core.String get uri => $_getSZ(1);
  @$pb.TagNumber(2)
  set uri($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasUri() => $_has(1);
  @$pb.TagNumber(2)
  void clearUri() => clearField(2);

  /// Any headers to set on the request.
  @$pb.TagNumber(3)
  $core.List<Header> get headers => $_getList(2);

  /// These query params will be encoded and added to the uri before
  /// the request is sent.
  @$pb.TagNumber(4)
  $core.List<Header> get rawQueryParams => $_getList(3);

  /// This provides an easier way to define a complex binary query param
  /// than having to write literal base64-encoded bytes in raw_query_params.
  @$pb.TagNumber(5)
  $core.List<RawHTTPRequest_EncodedQueryParam> get encodedQueryParams =>
      $_getList(4);

  /// The body is a single message.
  @$pb.TagNumber(6)
  MessageContents get unary => $_getN(5);
  @$pb.TagNumber(6)
  set unary(MessageContents v) {
    setField(6, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasUnary() => $_has(5);
  @$pb.TagNumber(6)
  void clearUnary() => clearField(6);
  @$pb.TagNumber(6)
  MessageContents ensureUnary() => $_ensure(5);

  /// The body is a stream, encoded using a five-byte
  /// prefix before each item in the stream.
  @$pb.TagNumber(7)
  StreamContents get stream => $_getN(6);
  @$pb.TagNumber(7)
  set stream(StreamContents v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasStream() => $_has(6);
  @$pb.TagNumber(7)
  void clearStream() => clearField(7);
  @$pb.TagNumber(7)
  StreamContents ensureStream() => $_ensure(6);
}

enum MessageContents_Data { binary, text, binaryMessage, notSet }

/// MessageContents represents a message in a request body.
class MessageContents extends $pb.GeneratedMessage {
  factory MessageContents({
    $core.List<$core.int>? binary,
    $core.String? text,
    $0.Any? binaryMessage,
    $1.Compression? compression,
  }) {
    final $result = create();
    if (binary != null) {
      $result.binary = binary;
    }
    if (text != null) {
      $result.text = text;
    }
    if (binaryMessage != null) {
      $result.binaryMessage = binaryMessage;
    }
    if (compression != null) {
      $result.compression = compression;
    }
    return $result;
  }
  MessageContents._() : super();
  factory MessageContents.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory MessageContents.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, MessageContents_Data>
      _MessageContents_DataByTag = {
    1: MessageContents_Data.binary,
    2: MessageContents_Data.text,
    3: MessageContents_Data.binaryMessage,
    0: MessageContents_Data.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'MessageContents',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'connectrpc.conformance.v1'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'binary', $pb.PbFieldType.OY)
    ..aOS(2, _omitFieldNames ? '' : 'text')
    ..aOM<$0.Any>(3, _omitFieldNames ? '' : 'binaryMessage',
        subBuilder: $0.Any.create)
    ..e<$1.Compression>(
        4, _omitFieldNames ? '' : 'compression', $pb.PbFieldType.OE,
        defaultOrMaker: $1.Compression.COMPRESSION_UNSPECIFIED,
        valueOf: $1.Compression.valueOf,
        enumValues: $1.Compression.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  MessageContents clone() => MessageContents()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  MessageContents copyWith(void Function(MessageContents) updates) =>
      super.copyWith((message) => updates(message as MessageContents))
          as MessageContents;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static MessageContents create() => MessageContents._();
  MessageContents createEmptyInstance() => create();
  static $pb.PbList<MessageContents> createRepeated() =>
      $pb.PbList<MessageContents>();
  @$core.pragma('dart2js:noInline')
  static MessageContents getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<MessageContents>(create);
  static MessageContents? _defaultInstance;

  MessageContents_Data whichData() =>
      _MessageContents_DataByTag[$_whichOneof(0)]!;
  void clearData() => clearField($_whichOneof(0));

  /// Arbitrary bytes.
  @$pb.TagNumber(1)
  $core.List<$core.int> get binary => $_getN(0);
  @$pb.TagNumber(1)
  set binary($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBinary() => $_has(0);
  @$pb.TagNumber(1)
  void clearBinary() => clearField(1);

  /// Arbitrary text.
  @$pb.TagNumber(2)
  $core.String get text => $_getSZ(1);
  @$pb.TagNumber(2)
  set text($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasText() => $_has(1);
  @$pb.TagNumber(2)
  void clearText() => clearField(2);

  /// An actual message. The message inside the Any will be
  /// serialized to the protobuf binary formats, and the
  /// resulting bytes will be the contents.
  @$pb.TagNumber(3)
  $0.Any get binaryMessage => $_getN(2);
  @$pb.TagNumber(3)
  set binaryMessage($0.Any v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasBinaryMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearBinaryMessage() => clearField(3);
  @$pb.TagNumber(3)
  $0.Any ensureBinaryMessage() => $_ensure(2);

  /// If specified and not identity, the above data will be
  /// compressed using the given algorithm.
  @$pb.TagNumber(4)
  $1.Compression get compression => $_getN(3);
  @$pb.TagNumber(4)
  set compression($1.Compression v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCompression() => $_has(3);
  @$pb.TagNumber(4)
  void clearCompression() => clearField(4);
}

class StreamContents_StreamItem extends $pb.GeneratedMessage {
  factory StreamContents_StreamItem({
    $core.int? flags,
    $core.int? length,
    MessageContents? payload,
  }) {
    final $result = create();
    if (flags != null) {
      $result.flags = flags;
    }
    if (length != null) {
      $result.length = length;
    }
    if (payload != null) {
      $result.payload = payload;
    }
    return $result;
  }
  StreamContents_StreamItem._() : super();
  factory StreamContents_StreamItem.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StreamContents_StreamItem.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StreamContents.StreamItem',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'connectrpc.conformance.v1'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'flags', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'length', $pb.PbFieldType.OU3)
    ..aOM<MessageContents>(3, _omitFieldNames ? '' : 'payload',
        subBuilder: MessageContents.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StreamContents_StreamItem clone() =>
      StreamContents_StreamItem()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StreamContents_StreamItem copyWith(
          void Function(StreamContents_StreamItem) updates) =>
      super.copyWith((message) => updates(message as StreamContents_StreamItem))
          as StreamContents_StreamItem;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamContents_StreamItem create() => StreamContents_StreamItem._();
  StreamContents_StreamItem createEmptyInstance() => create();
  static $pb.PbList<StreamContents_StreamItem> createRepeated() =>
      $pb.PbList<StreamContents_StreamItem>();
  @$core.pragma('dart2js:noInline')
  static StreamContents_StreamItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StreamContents_StreamItem>(create);
  static StreamContents_StreamItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get flags => $_getIZ(0);
  @$pb.TagNumber(1)
  set flags($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFlags() => $_has(0);
  @$pb.TagNumber(1)
  void clearFlags() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get length => $_getIZ(1);
  @$pb.TagNumber(2)
  set length($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasLength() => $_has(1);
  @$pb.TagNumber(2)
  void clearLength() => clearField(2);

  @$pb.TagNumber(3)
  MessageContents get payload => $_getN(2);
  @$pb.TagNumber(3)
  set payload(MessageContents v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPayload() => $_has(2);
  @$pb.TagNumber(3)
  void clearPayload() => clearField(3);
  @$pb.TagNumber(3)
  MessageContents ensurePayload() => $_ensure(2);
}

/// StreamContents represents a sequence of messages in a request body.
class StreamContents extends $pb.GeneratedMessage {
  factory StreamContents({
    $core.Iterable<StreamContents_StreamItem>? items,
  }) {
    final $result = create();
    if (items != null) {
      $result.items.addAll(items);
    }
    return $result;
  }
  StreamContents._() : super();
  factory StreamContents.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory StreamContents.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StreamContents',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'connectrpc.conformance.v1'),
      createEmptyInstance: create)
    ..pc<StreamContents_StreamItem>(
        1, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM,
        subBuilder: StreamContents_StreamItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  StreamContents clone() => StreamContents()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  StreamContents copyWith(void Function(StreamContents) updates) =>
      super.copyWith((message) => updates(message as StreamContents))
          as StreamContents;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamContents create() => StreamContents._();
  StreamContents createEmptyInstance() => create();
  static $pb.PbList<StreamContents> createRepeated() =>
      $pb.PbList<StreamContents>();
  @$core.pragma('dart2js:noInline')
  static StreamContents getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StreamContents>(create);
  static StreamContents? _defaultInstance;

  /// The messages in the stream.
  @$pb.TagNumber(1)
  $core.List<StreamContents_StreamItem> get items => $_getList(0);
}

enum RawHTTPResponse_Body { unary, stream, notSet }

/// RawHTTPResponse models a raw HTTP response. This can be used to craft
/// custom responses with odd properties (including certain kinds of
/// malformed responses) to test edge cases in clients.
class RawHTTPResponse extends $pb.GeneratedMessage {
  factory RawHTTPResponse({
    $core.int? statusCode,
    $core.Iterable<Header>? headers,
    MessageContents? unary,
    StreamContents? stream,
    $core.Iterable<Header>? trailers,
  }) {
    final $result = create();
    if (statusCode != null) {
      $result.statusCode = statusCode;
    }
    if (headers != null) {
      $result.headers.addAll(headers);
    }
    if (unary != null) {
      $result.unary = unary;
    }
    if (stream != null) {
      $result.stream = stream;
    }
    if (trailers != null) {
      $result.trailers.addAll(trailers);
    }
    return $result;
  }
  RawHTTPResponse._() : super();
  factory RawHTTPResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory RawHTTPResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, RawHTTPResponse_Body>
      _RawHTTPResponse_BodyByTag = {
    3: RawHTTPResponse_Body.unary,
    4: RawHTTPResponse_Body.stream,
    0: RawHTTPResponse_Body.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RawHTTPResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'connectrpc.conformance.v1'),
      createEmptyInstance: create)
    ..oo(0, [3, 4])
    ..a<$core.int>(1, _omitFieldNames ? '' : 'statusCode', $pb.PbFieldType.OU3)
    ..pc<Header>(2, _omitFieldNames ? '' : 'headers', $pb.PbFieldType.PM,
        subBuilder: Header.create)
    ..aOM<MessageContents>(3, _omitFieldNames ? '' : 'unary',
        subBuilder: MessageContents.create)
    ..aOM<StreamContents>(4, _omitFieldNames ? '' : 'stream',
        subBuilder: StreamContents.create)
    ..pc<Header>(5, _omitFieldNames ? '' : 'trailers', $pb.PbFieldType.PM,
        subBuilder: Header.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  RawHTTPResponse clone() => RawHTTPResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  RawHTTPResponse copyWith(void Function(RawHTTPResponse) updates) =>
      super.copyWith((message) => updates(message as RawHTTPResponse))
          as RawHTTPResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RawHTTPResponse create() => RawHTTPResponse._();
  RawHTTPResponse createEmptyInstance() => create();
  static $pb.PbList<RawHTTPResponse> createRepeated() =>
      $pb.PbList<RawHTTPResponse>();
  @$core.pragma('dart2js:noInline')
  static RawHTTPResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RawHTTPResponse>(create);
  static RawHTTPResponse? _defaultInstance;

  RawHTTPResponse_Body whichBody() =>
      _RawHTTPResponse_BodyByTag[$_whichOneof(0)]!;
  void clearBody() => clearField($_whichOneof(0));

  /// If status code is not specified, it will default to a 200 response code.
  @$pb.TagNumber(1)
  $core.int get statusCode => $_getIZ(0);
  @$pb.TagNumber(1)
  set statusCode($core.int v) {
    $_setUnsignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasStatusCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatusCode() => clearField(1);

  /// Headers to be set on the response.
  @$pb.TagNumber(2)
  $core.List<Header> get headers => $_getList(1);

  /// The body is a single message.
  @$pb.TagNumber(3)
  MessageContents get unary => $_getN(2);
  @$pb.TagNumber(3)
  set unary(MessageContents v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasUnary() => $_has(2);
  @$pb.TagNumber(3)
  void clearUnary() => clearField(3);
  @$pb.TagNumber(3)
  MessageContents ensureUnary() => $_ensure(2);

  /// The body is a stream, encoded using a five-byte
  /// prefix before each item in the stream.
  @$pb.TagNumber(4)
  StreamContents get stream => $_getN(3);
  @$pb.TagNumber(4)
  set stream(StreamContents v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasStream() => $_has(3);
  @$pb.TagNumber(4)
  void clearStream() => clearField(4);
  @$pb.TagNumber(4)
  StreamContents ensureStream() => $_ensure(3);

  /// Trailers to be set on the response.
  @$pb.TagNumber(5)
  $core.List<Header> get trailers => $_getList(4);
}

class ConformanceServiceApi {
  $pb.RpcClient _client;
  ConformanceServiceApi(this._client);

  $async.Future<UnaryResponse> unary(
          $pb.ClientContext? ctx, UnaryRequest request) =>
      _client.invoke<UnaryResponse>(
          ctx, 'ConformanceService', 'Unary', request, UnaryResponse());
  $async.Future<ServerStreamResponse> serverStream(
          $pb.ClientContext? ctx, ServerStreamRequest request) =>
      _client.invoke<ServerStreamResponse>(ctx, 'ConformanceService',
          'ServerStream', request, ServerStreamResponse());
  $async.Future<ClientStreamResponse> clientStream(
          $pb.ClientContext? ctx, ClientStreamRequest request) =>
      _client.invoke<ClientStreamResponse>(ctx, 'ConformanceService',
          'ClientStream', request, ClientStreamResponse());
  $async.Future<BidiStreamResponse> bidiStream(
          $pb.ClientContext? ctx, BidiStreamRequest request) =>
      _client.invoke<BidiStreamResponse>(ctx, 'ConformanceService',
          'BidiStream', request, BidiStreamResponse());
  $async.Future<UnimplementedResponse> unimplemented(
          $pb.ClientContext? ctx, UnimplementedRequest request) =>
      _client.invoke<UnimplementedResponse>(ctx, 'ConformanceService',
          'Unimplemented', request, UnimplementedResponse());
  $async.Future<IdempotentUnaryResponse> idempotentUnary(
          $pb.ClientContext? ctx, IdempotentUnaryRequest request) =>
      _client.invoke<IdempotentUnaryResponse>(ctx, 'ConformanceService',
          'IdempotentUnary', request, IdempotentUnaryResponse());
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
