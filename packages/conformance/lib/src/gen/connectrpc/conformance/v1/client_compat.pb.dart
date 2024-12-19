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
//  source: connectrpc/conformance/v1/client_compat.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../../google/protobuf/any.pb.dart' as $0;
import '../../../google/protobuf/empty.pb.dart' as $3;
import '../../../google/protobuf/struct.pb.dart' as $4;
import 'config.pb.dart' as $1;
import 'config.pbenum.dart' as $1;
import 'service.pb.dart' as $2;

enum ClientCompatRequest_Cancel_CancelTiming {
  beforeCloseSend,
  afterCloseSendMs,
  afterNumResponses,
  notSet
}

class ClientCompatRequest_Cancel extends $pb.GeneratedMessage {
  factory ClientCompatRequest_Cancel({
    $3.Empty? beforeCloseSend,
    $core.int? afterCloseSendMs,
    $core.int? afterNumResponses,
  }) {
    final $result = create();
    if (beforeCloseSend != null) {
      $result.beforeCloseSend = beforeCloseSend;
    }
    if (afterCloseSendMs != null) {
      $result.afterCloseSendMs = afterCloseSendMs;
    }
    if (afterNumResponses != null) {
      $result.afterNumResponses = afterNumResponses;
    }
    return $result;
  }
  ClientCompatRequest_Cancel._() : super();
  factory ClientCompatRequest_Cancel.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ClientCompatRequest_Cancel.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, ClientCompatRequest_Cancel_CancelTiming>
      _ClientCompatRequest_Cancel_CancelTimingByTag = {
    1: ClientCompatRequest_Cancel_CancelTiming.beforeCloseSend,
    2: ClientCompatRequest_Cancel_CancelTiming.afterCloseSendMs,
    3: ClientCompatRequest_Cancel_CancelTiming.afterNumResponses,
    0: ClientCompatRequest_Cancel_CancelTiming.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClientCompatRequest.Cancel',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'connectrpc.conformance.v1'),
      createEmptyInstance: create)
    ..oo(0, [1, 2, 3])
    ..aOM<$3.Empty>(1, _omitFieldNames ? '' : 'beforeCloseSend',
        subBuilder: $3.Empty.create)
    ..a<$core.int>(
        2, _omitFieldNames ? '' : 'afterCloseSendMs', $pb.PbFieldType.OU3)
    ..a<$core.int>(
        3, _omitFieldNames ? '' : 'afterNumResponses', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ClientCompatRequest_Cancel clone() =>
      ClientCompatRequest_Cancel()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ClientCompatRequest_Cancel copyWith(
          void Function(ClientCompatRequest_Cancel) updates) =>
      super.copyWith(
              (message) => updates(message as ClientCompatRequest_Cancel))
          as ClientCompatRequest_Cancel;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClientCompatRequest_Cancel create() => ClientCompatRequest_Cancel._();
  ClientCompatRequest_Cancel createEmptyInstance() => create();
  static $pb.PbList<ClientCompatRequest_Cancel> createRepeated() =>
      $pb.PbList<ClientCompatRequest_Cancel>();
  @$core.pragma('dart2js:noInline')
  static ClientCompatRequest_Cancel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClientCompatRequest_Cancel>(create);
  static ClientCompatRequest_Cancel? _defaultInstance;

  ClientCompatRequest_Cancel_CancelTiming whichCancelTiming() =>
      _ClientCompatRequest_Cancel_CancelTimingByTag[$_whichOneof(0)]!;
  void clearCancelTiming() => clearField($_whichOneof(0));

  ///  When present, the client should cancel *instead of*
  ///  closing the send side of the stream, after all requests
  ///  have been sent.
  ///
  ///  This applies only to client and bidi stream RPCs.
  @$pb.TagNumber(1)
  $3.Empty get beforeCloseSend => $_getN(0);
  @$pb.TagNumber(1)
  set beforeCloseSend($3.Empty v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasBeforeCloseSend() => $_has(0);
  @$pb.TagNumber(1)
  void clearBeforeCloseSend() => clearField(1);
  @$pb.TagNumber(1)
  $3.Empty ensureBeforeCloseSend() => $_ensure(0);

  ///  When present, the client should delay for this many
  ///  milliseconds after closing the send side of the stream
  ///  and then cancel.
  ///
  ///  This applies to all types of RPCs.
  ///
  ///  For unary and server stream RPCs, where the API usually
  ///  does not allow explicitly closing the send side, the
  ///  cancellation should be done immediately after invoking
  ///  the RPC (which should implicitly send the one-and-only
  ///  request and then close the send-side).
  ///
  ///  For APIs where unary RPCs block until the response
  ///  is received, there is no point after the request is
  ///  sent but before a response is received to cancel. So
  ///  the client must arrange for the RPC to be canceled
  ///  asynchronously before invoking the blocking unary call.
  @$pb.TagNumber(2)
  $core.int get afterCloseSendMs => $_getIZ(1);
  @$pb.TagNumber(2)
  set afterCloseSendMs($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasAfterCloseSendMs() => $_has(1);
  @$pb.TagNumber(2)
  void clearAfterCloseSendMs() => clearField(2);

  ///  When present, the client should cancel right after
  ///  reading this number of response messages from the stream.
  ///  When present, this will be greater than zero.
  ///
  ///  This applies only to server and bidi stream RPCs.
  @$pb.TagNumber(3)
  $core.int get afterNumResponses => $_getIZ(2);
  @$pb.TagNumber(3)
  set afterNumResponses($core.int v) {
    $_setUnsignedInt32(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasAfterNumResponses() => $_has(2);
  @$pb.TagNumber(3)
  void clearAfterNumResponses() => clearField(3);
}

/// Describes one call the client should make. The client reads
/// these from stdin and, for each one, invokes an RPC as directed
/// and writes the results (in the form of a ClientCompatResponse
/// message) to stdout.
class ClientCompatRequest extends $pb.GeneratedMessage {
  factory ClientCompatRequest({
    $core.String? testName,
    $1.HTTPVersion? httpVersion,
    $1.Protocol? protocol,
    $1.Codec? codec,
    $1.Compression? compression,
    $core.String? host,
    $core.int? port,
    $core.List<$core.int>? serverTlsCert,
    $1.TLSCreds? clientTlsCreds,
    $core.int? messageReceiveLimit,
    $core.String? service,
    $core.String? method,
    $1.StreamType? streamType,
    $core.bool? useGetHttpMethod,
    $core.Iterable<$2.Header>? requestHeaders,
    $core.Iterable<$0.Any>? requestMessages,
    $core.int? timeoutMs,
    $core.int? requestDelayMs,
    ClientCompatRequest_Cancel? cancel,
    $2.RawHTTPRequest? rawRequest,
  }) {
    final $result = create();
    if (testName != null) {
      $result.testName = testName;
    }
    if (httpVersion != null) {
      $result.httpVersion = httpVersion;
    }
    if (protocol != null) {
      $result.protocol = protocol;
    }
    if (codec != null) {
      $result.codec = codec;
    }
    if (compression != null) {
      $result.compression = compression;
    }
    if (host != null) {
      $result.host = host;
    }
    if (port != null) {
      $result.port = port;
    }
    if (serverTlsCert != null) {
      $result.serverTlsCert = serverTlsCert;
    }
    if (clientTlsCreds != null) {
      $result.clientTlsCreds = clientTlsCreds;
    }
    if (messageReceiveLimit != null) {
      $result.messageReceiveLimit = messageReceiveLimit;
    }
    if (service != null) {
      $result.service = service;
    }
    if (method != null) {
      $result.method = method;
    }
    if (streamType != null) {
      $result.streamType = streamType;
    }
    if (useGetHttpMethod != null) {
      $result.useGetHttpMethod = useGetHttpMethod;
    }
    if (requestHeaders != null) {
      $result.requestHeaders.addAll(requestHeaders);
    }
    if (requestMessages != null) {
      $result.requestMessages.addAll(requestMessages);
    }
    if (timeoutMs != null) {
      $result.timeoutMs = timeoutMs;
    }
    if (requestDelayMs != null) {
      $result.requestDelayMs = requestDelayMs;
    }
    if (cancel != null) {
      $result.cancel = cancel;
    }
    if (rawRequest != null) {
      $result.rawRequest = rawRequest;
    }
    return $result;
  }
  ClientCompatRequest._() : super();
  factory ClientCompatRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ClientCompatRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClientCompatRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'connectrpc.conformance.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'testName')
    ..e<$1.HTTPVersion>(
        2, _omitFieldNames ? '' : 'httpVersion', $pb.PbFieldType.OE,
        defaultOrMaker: $1.HTTPVersion.HTTP_VERSION_UNSPECIFIED,
        valueOf: $1.HTTPVersion.valueOf,
        enumValues: $1.HTTPVersion.values)
    ..e<$1.Protocol>(3, _omitFieldNames ? '' : 'protocol', $pb.PbFieldType.OE,
        defaultOrMaker: $1.Protocol.PROTOCOL_UNSPECIFIED,
        valueOf: $1.Protocol.valueOf,
        enumValues: $1.Protocol.values)
    ..e<$1.Codec>(4, _omitFieldNames ? '' : 'codec', $pb.PbFieldType.OE,
        defaultOrMaker: $1.Codec.CODEC_UNSPECIFIED,
        valueOf: $1.Codec.valueOf,
        enumValues: $1.Codec.values)
    ..e<$1.Compression>(
        5, _omitFieldNames ? '' : 'compression', $pb.PbFieldType.OE,
        defaultOrMaker: $1.Compression.COMPRESSION_UNSPECIFIED,
        valueOf: $1.Compression.valueOf,
        enumValues: $1.Compression.values)
    ..aOS(6, _omitFieldNames ? '' : 'host')
    ..a<$core.int>(7, _omitFieldNames ? '' : 'port', $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(
        8, _omitFieldNames ? '' : 'serverTlsCert', $pb.PbFieldType.OY)
    ..aOM<$1.TLSCreds>(9, _omitFieldNames ? '' : 'clientTlsCreds',
        subBuilder: $1.TLSCreds.create)
    ..a<$core.int>(
        10, _omitFieldNames ? '' : 'messageReceiveLimit', $pb.PbFieldType.OU3)
    ..aOS(11, _omitFieldNames ? '' : 'service')
    ..aOS(12, _omitFieldNames ? '' : 'method')
    ..e<$1.StreamType>(
        13, _omitFieldNames ? '' : 'streamType', $pb.PbFieldType.OE,
        defaultOrMaker: $1.StreamType.STREAM_TYPE_UNSPECIFIED,
        valueOf: $1.StreamType.valueOf,
        enumValues: $1.StreamType.values)
    ..aOB(14, _omitFieldNames ? '' : 'useGetHttpMethod')
    ..pc<$2.Header>(
        15, _omitFieldNames ? '' : 'requestHeaders', $pb.PbFieldType.PM,
        subBuilder: $2.Header.create)
    ..pc<$0.Any>(
        16, _omitFieldNames ? '' : 'requestMessages', $pb.PbFieldType.PM,
        subBuilder: $0.Any.create)
    ..a<$core.int>(17, _omitFieldNames ? '' : 'timeoutMs', $pb.PbFieldType.OU3)
    ..a<$core.int>(
        18, _omitFieldNames ? '' : 'requestDelayMs', $pb.PbFieldType.OU3)
    ..aOM<ClientCompatRequest_Cancel>(19, _omitFieldNames ? '' : 'cancel',
        subBuilder: ClientCompatRequest_Cancel.create)
    ..aOM<$2.RawHTTPRequest>(20, _omitFieldNames ? '' : 'rawRequest',
        subBuilder: $2.RawHTTPRequest.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ClientCompatRequest clone() => ClientCompatRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ClientCompatRequest copyWith(void Function(ClientCompatRequest) updates) =>
      super.copyWith((message) => updates(message as ClientCompatRequest))
          as ClientCompatRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClientCompatRequest create() => ClientCompatRequest._();
  ClientCompatRequest createEmptyInstance() => create();
  static $pb.PbList<ClientCompatRequest> createRepeated() =>
      $pb.PbList<ClientCompatRequest>();
  @$core.pragma('dart2js:noInline')
  static ClientCompatRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClientCompatRequest>(create);
  static ClientCompatRequest? _defaultInstance;

  /// The name of the test that this request is performing.
  /// When writing test cases, this is a required field.
  @$pb.TagNumber(1)
  $core.String get testName => $_getSZ(0);
  @$pb.TagNumber(1)
  set testName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTestName() => $_has(0);
  @$pb.TagNumber(1)
  void clearTestName() => clearField(1);

  ///  Test suite YAML definitions should NOT set values for these next
  ///  nine fields (fields 2 - 10). They are automatically populated by the test
  ///  runner. If a test is specific to one of these values, it should instead be
  ///  indicated in the test suite itself (where it defines the required
  ///  features and relevant values for these fields).
  ///
  ///  The HTTP version to use for the test (i.e. HTTP/1.1, HTTP/2, HTTP/3).
  @$pb.TagNumber(2)
  $1.HTTPVersion get httpVersion => $_getN(1);
  @$pb.TagNumber(2)
  set httpVersion($1.HTTPVersion v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasHttpVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearHttpVersion() => clearField(2);

  /// The protocol to use for the test (i.e. Connect, gRPC, gRPC-web).
  @$pb.TagNumber(3)
  $1.Protocol get protocol => $_getN(2);
  @$pb.TagNumber(3)
  set protocol($1.Protocol v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasProtocol() => $_has(2);
  @$pb.TagNumber(3)
  void clearProtocol() => clearField(3);

  /// The codec to use for the test (i.e. JSON, proto/binary).
  @$pb.TagNumber(4)
  $1.Codec get codec => $_getN(3);
  @$pb.TagNumber(4)
  set codec($1.Codec v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCodec() => $_has(3);
  @$pb.TagNumber(4)
  void clearCodec() => clearField(4);

  /// The compression to use for the test (i.e. brotli, gzip, identity).
  @$pb.TagNumber(5)
  $1.Compression get compression => $_getN(4);
  @$pb.TagNumber(5)
  set compression($1.Compression v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasCompression() => $_has(4);
  @$pb.TagNumber(5)
  void clearCompression() => clearField(5);

  /// The server host that this request will be sent to.
  @$pb.TagNumber(6)
  $core.String get host => $_getSZ(5);
  @$pb.TagNumber(6)
  set host($core.String v) {
    $_setString(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasHost() => $_has(5);
  @$pb.TagNumber(6)
  void clearHost() => clearField(6);

  /// The server port that this request will be sent to.
  @$pb.TagNumber(7)
  $core.int get port => $_getIZ(6);
  @$pb.TagNumber(7)
  set port($core.int v) {
    $_setUnsignedInt32(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasPort() => $_has(6);
  @$pb.TagNumber(7)
  void clearPort() => clearField(7);

  /// If non-empty, the server is using TLS. The bytes are the
  /// server's PEM-encoded certificate, which the client should
  /// verify and trust.
  @$pb.TagNumber(8)
  $core.List<$core.int> get serverTlsCert => $_getN(7);
  @$pb.TagNumber(8)
  set serverTlsCert($core.List<$core.int> v) {
    $_setBytes(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasServerTlsCert() => $_has(7);
  @$pb.TagNumber(8)
  void clearServerTlsCert() => clearField(8);

  /// If present, the client certificate credentials to use to
  /// authenticate with the server. This will only be present
  /// when server_tls_cert is non-empty.
  @$pb.TagNumber(9)
  $1.TLSCreds get clientTlsCreds => $_getN(8);
  @$pb.TagNumber(9)
  set clientTlsCreds($1.TLSCreds v) {
    setField(9, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasClientTlsCreds() => $_has(8);
  @$pb.TagNumber(9)
  void clearClientTlsCreds() => clearField(9);
  @$pb.TagNumber(9)
  $1.TLSCreds ensureClientTlsCreds() => $_ensure(8);

  /// If non-zero, indicates the maximum size in bytes for a message.
  /// If the server sends anything larger, the client should reject it.
  @$pb.TagNumber(10)
  $core.int get messageReceiveLimit => $_getIZ(9);
  @$pb.TagNumber(10)
  set messageReceiveLimit($core.int v) {
    $_setUnsignedInt32(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasMessageReceiveLimit() => $_has(9);
  @$pb.TagNumber(10)
  void clearMessageReceiveLimit() => clearField(10);

  /// The fully-qualified name of the service this test will interact with.
  /// If specified, method must also be specified.
  /// If not specified, defaults to "connectrpc.conformance.v1.ConformanceService".
  @$pb.TagNumber(11)
  $core.String get service => $_getSZ(10);
  @$pb.TagNumber(11)
  set service($core.String v) {
    $_setString(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasService() => $_has(10);
  @$pb.TagNumber(11)
  void clearService() => clearField(11);

  /// The method on `service` that will be called.
  /// If specified, service must also be specified.
  /// If not specified, the test runner will auto-populate this field based on the stream_type.
  @$pb.TagNumber(12)
  $core.String get method => $_getSZ(11);
  @$pb.TagNumber(12)
  set method($core.String v) {
    $_setString(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasMethod() => $_has(11);
  @$pb.TagNumber(12)
  void clearMethod() => clearField(12);

  /// The stream type of `method` (i.e. unary, client stream, server stream, full-duplex bidi
  /// stream, or half-duplex bidi stream).
  /// When writing test cases, this is a required field.
  @$pb.TagNumber(13)
  $1.StreamType get streamType => $_getN(12);
  @$pb.TagNumber(13)
  set streamType($1.StreamType v) {
    setField(13, v);
  }

  @$pb.TagNumber(13)
  $core.bool hasStreamType() => $_has(12);
  @$pb.TagNumber(13)
  void clearStreamType() => clearField(13);

  /// If protocol indicates Connect and stream type indicates
  /// Unary, this instructs the client to use a GET HTTP method
  /// when making the request.
  @$pb.TagNumber(14)
  $core.bool get useGetHttpMethod => $_getBF(13);
  @$pb.TagNumber(14)
  set useGetHttpMethod($core.bool v) {
    $_setBool(13, v);
  }

  @$pb.TagNumber(14)
  $core.bool hasUseGetHttpMethod() => $_has(13);
  @$pb.TagNumber(14)
  void clearUseGetHttpMethod() => clearField(14);

  /// Any request headers that should be sent as part of the request.
  /// These include only custom header metadata. Headers that are
  /// part of the relevant protocol (such as "content-type", etc) should
  /// not be stated here.
  @$pb.TagNumber(15)
  $core.List<$2.Header> get requestHeaders => $_getList(14);

  /// The actual request messages that will sent to the server.
  /// The type URL for all entries should be equal to the request type of the
  /// method.
  /// There must be exactly one for unary and server stream methods but
  /// can be zero or more for client and bidi stream methods.
  /// For client and bidi stream methods, all entries will have the
  /// same type URL.
  @$pb.TagNumber(16)
  $core.List<$0.Any> get requestMessages => $_getList(15);

  /// The timeout, in milliseconds, for the request. This is equivalent to a
  /// deadline for the request. If unset, there will be no timeout.
  @$pb.TagNumber(17)
  $core.int get timeoutMs => $_getIZ(16);
  @$pb.TagNumber(17)
  set timeoutMs($core.int v) {
    $_setUnsignedInt32(16, v);
  }

  @$pb.TagNumber(17)
  $core.bool hasTimeoutMs() => $_has(16);
  @$pb.TagNumber(17)
  void clearTimeoutMs() => clearField(17);

  /// Wait this many milliseconds before sending a request message.
  /// For client or bidi stream methods, this delay should be
  /// applied before each request sent.
  @$pb.TagNumber(18)
  $core.int get requestDelayMs => $_getIZ(17);
  @$pb.TagNumber(18)
  set requestDelayMs($core.int v) {
    $_setUnsignedInt32(17, v);
  }

  @$pb.TagNumber(18)
  $core.bool hasRequestDelayMs() => $_has(17);
  @$pb.TagNumber(18)
  void clearRequestDelayMs() => clearField(18);

  /// If present, the client should cancel the RPC instead of
  /// allowing to complete normally.
  @$pb.TagNumber(19)
  ClientCompatRequest_Cancel get cancel => $_getN(18);
  @$pb.TagNumber(19)
  set cancel(ClientCompatRequest_Cancel v) {
    setField(19, v);
  }

  @$pb.TagNumber(19)
  $core.bool hasCancel() => $_has(18);
  @$pb.TagNumber(19)
  void clearCancel() => clearField(19);
  @$pb.TagNumber(19)
  ClientCompatRequest_Cancel ensureCancel() => $_ensure(18);

  ///  The following field is only used by the reference client. If
  ///  you are implementing a client under test, you may ignore it
  ///  or respond with an error if the client receives a request where
  ///  it is set.
  ///
  ///  When this field is present, it defines the actual HTTP request
  ///  that will be sent. The above group of fields must still be
  ///  provided and valid so that the reference client knows how it
  ///  should try to interpret the server's response.
  @$pb.TagNumber(20)
  $2.RawHTTPRequest get rawRequest => $_getN(19);
  @$pb.TagNumber(20)
  set rawRequest($2.RawHTTPRequest v) {
    setField(20, v);
  }

  @$pb.TagNumber(20)
  $core.bool hasRawRequest() => $_has(19);
  @$pb.TagNumber(20)
  void clearRawRequest() => clearField(20);
  @$pb.TagNumber(20)
  $2.RawHTTPRequest ensureRawRequest() => $_ensure(19);
}

enum ClientCompatResponse_Result { response, error, notSet }

/// The outcome of one ClientCompatRequest.
class ClientCompatResponse extends $pb.GeneratedMessage {
  factory ClientCompatResponse({
    $core.String? testName,
    ClientResponseResult? response,
    ClientErrorResult? error,
  }) {
    final $result = create();
    if (testName != null) {
      $result.testName = testName;
    }
    if (response != null) {
      $result.response = response;
    }
    if (error != null) {
      $result.error = error;
    }
    return $result;
  }
  ClientCompatResponse._() : super();
  factory ClientCompatResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ClientCompatResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, ClientCompatResponse_Result>
      _ClientCompatResponse_ResultByTag = {
    2: ClientCompatResponse_Result.response,
    3: ClientCompatResponse_Result.error,
    0: ClientCompatResponse_Result.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClientCompatResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'connectrpc.conformance.v1'),
      createEmptyInstance: create)
    ..oo(0, [2, 3])
    ..aOS(1, _omitFieldNames ? '' : 'testName')
    ..aOM<ClientResponseResult>(2, _omitFieldNames ? '' : 'response',
        subBuilder: ClientResponseResult.create)
    ..aOM<ClientErrorResult>(3, _omitFieldNames ? '' : 'error',
        subBuilder: ClientErrorResult.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ClientCompatResponse clone() =>
      ClientCompatResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ClientCompatResponse copyWith(void Function(ClientCompatResponse) updates) =>
      super.copyWith((message) => updates(message as ClientCompatResponse))
          as ClientCompatResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClientCompatResponse create() => ClientCompatResponse._();
  ClientCompatResponse createEmptyInstance() => create();
  static $pb.PbList<ClientCompatResponse> createRepeated() =>
      $pb.PbList<ClientCompatResponse>();
  @$core.pragma('dart2js:noInline')
  static ClientCompatResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClientCompatResponse>(create);
  static ClientCompatResponse? _defaultInstance;

  ClientCompatResponse_Result whichResult() =>
      _ClientCompatResponse_ResultByTag[$_whichOneof(0)]!;
  void clearResult() => clearField($_whichOneof(0));

  /// The test name that this response applies to.
  @$pb.TagNumber(1)
  $core.String get testName => $_getSZ(0);
  @$pb.TagNumber(1)
  set testName($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasTestName() => $_has(0);
  @$pb.TagNumber(1)
  void clearTestName() => clearField(1);

  @$pb.TagNumber(2)
  ClientResponseResult get response => $_getN(1);
  @$pb.TagNumber(2)
  set response(ClientResponseResult v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasResponse() => $_has(1);
  @$pb.TagNumber(2)
  void clearResponse() => clearField(2);
  @$pb.TagNumber(2)
  ClientResponseResult ensureResponse() => $_ensure(1);

  @$pb.TagNumber(3)
  ClientErrorResult get error => $_getN(2);
  @$pb.TagNumber(3)
  set error(ClientErrorResult v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => clearField(3);
  @$pb.TagNumber(3)
  ClientErrorResult ensureError() => $_ensure(2);
}

/// The result of a ClientCompatRequest, which may or may not be successful.
/// The client will build this message and return it back to the test runner.
class ClientResponseResult extends $pb.GeneratedMessage {
  factory ClientResponseResult({
    $core.Iterable<$2.Header>? responseHeaders,
    $core.Iterable<$2.ConformancePayload>? payloads,
    $2.Error? error,
    $core.Iterable<$2.Header>? responseTrailers,
    $core.int? numUnsentRequests,
    $core.int? httpStatusCode,
    $core.Iterable<$core.String>? feedback,
  }) {
    final $result = create();
    if (responseHeaders != null) {
      $result.responseHeaders.addAll(responseHeaders);
    }
    if (payloads != null) {
      $result.payloads.addAll(payloads);
    }
    if (error != null) {
      $result.error = error;
    }
    if (responseTrailers != null) {
      $result.responseTrailers.addAll(responseTrailers);
    }
    if (numUnsentRequests != null) {
      $result.numUnsentRequests = numUnsentRequests;
    }
    if (httpStatusCode != null) {
      $result.httpStatusCode = httpStatusCode;
    }
    if (feedback != null) {
      $result.feedback.addAll(feedback);
    }
    return $result;
  }
  ClientResponseResult._() : super();
  factory ClientResponseResult.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ClientResponseResult.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClientResponseResult',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'connectrpc.conformance.v1'),
      createEmptyInstance: create)
    ..pc<$2.Header>(
        1, _omitFieldNames ? '' : 'responseHeaders', $pb.PbFieldType.PM,
        subBuilder: $2.Header.create)
    ..pc<$2.ConformancePayload>(
        2, _omitFieldNames ? '' : 'payloads', $pb.PbFieldType.PM,
        subBuilder: $2.ConformancePayload.create)
    ..aOM<$2.Error>(3, _omitFieldNames ? '' : 'error',
        subBuilder: $2.Error.create)
    ..pc<$2.Header>(
        4, _omitFieldNames ? '' : 'responseTrailers', $pb.PbFieldType.PM,
        subBuilder: $2.Header.create)
    ..a<$core.int>(
        5, _omitFieldNames ? '' : 'numUnsentRequests', $pb.PbFieldType.O3)
    ..a<$core.int>(
        6, _omitFieldNames ? '' : 'httpStatusCode', $pb.PbFieldType.O3)
    ..pPS(7, _omitFieldNames ? '' : 'feedback')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ClientResponseResult clone() =>
      ClientResponseResult()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ClientResponseResult copyWith(void Function(ClientResponseResult) updates) =>
      super.copyWith((message) => updates(message as ClientResponseResult))
          as ClientResponseResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClientResponseResult create() => ClientResponseResult._();
  ClientResponseResult createEmptyInstance() => create();
  static $pb.PbList<ClientResponseResult> createRepeated() =>
      $pb.PbList<ClientResponseResult>();
  @$core.pragma('dart2js:noInline')
  static ClientResponseResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClientResponseResult>(create);
  static ClientResponseResult? _defaultInstance;

  /// All response headers read from the response.
  @$pb.TagNumber(1)
  $core.List<$2.Header> get responseHeaders => $_getList(0);

  /// Servers should echo back payloads that they received as part of the request.
  /// This field should contain all the payloads the server echoed back. Note that
  /// There will be zero-to-one for unary and client stream methods and
  /// zero-to-many for server and bidi stream methods.
  @$pb.TagNumber(2)
  $core.List<$2.ConformancePayload> get payloads => $_getList(1);

  /// The error received from the actual RPC invocation. Note this is not representative
  /// of a runtime error and should always be the proto equivalent of a Connect
  /// or gRPC error.
  @$pb.TagNumber(3)
  $2.Error get error => $_getN(2);
  @$pb.TagNumber(3)
  set error($2.Error v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => clearField(3);
  @$pb.TagNumber(3)
  $2.Error ensureError() => $_ensure(2);

  /// All response headers read from the response.
  @$pb.TagNumber(4)
  $core.List<$2.Header> get responseTrailers => $_getList(3);

  /// The number of messages that were present in the request but that could not be
  /// sent because an error occurred before finishing the upload.
  @$pb.TagNumber(5)
  $core.int get numUnsentRequests => $_getIZ(4);
  @$pb.TagNumber(5)
  set numUnsentRequests($core.int v) {
    $_setSignedInt32(4, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasNumUnsentRequests() => $_has(4);
  @$pb.TagNumber(5)
  void clearNumUnsentRequests() => clearField(5);

  /// The following field is only set by the reference client. It communicates
  /// the underlying HTTP status code of the server's response.
  /// If you are implementing a client-under-test, you should ignore this field
  /// and leave it unset.
  @$pb.TagNumber(6)
  $core.int get httpStatusCode => $_getIZ(5);
  @$pb.TagNumber(6)
  set httpStatusCode($core.int v) {
    $_setSignedInt32(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasHttpStatusCode() => $_has(5);
  @$pb.TagNumber(6)
  void clearHttpStatusCode() => clearField(6);

  /// This field is used only by the reference client, and it can be used
  /// to provide additional feedback about problems observed in the server
  /// response or in client processing of the response. If non-empty, the test
  /// case is considered failed even if the result above matches all expectations.
  /// If you are implementing a client-under-test, you should ignore this field
  /// and leave it unset.
  @$pb.TagNumber(7)
  $core.List<$core.String> get feedback => $_getList(6);
}

/// The client is not able to fulfill the ClientCompatRequest. This may be due
/// to a runtime error or an unexpected internal error such as the requested protocol
/// not being supported. This is completely independent of the actual RPC invocation.
class ClientErrorResult extends $pb.GeneratedMessage {
  factory ClientErrorResult({
    $core.String? message,
  }) {
    final $result = create();
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  ClientErrorResult._() : super();
  factory ClientErrorResult.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ClientErrorResult.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ClientErrorResult',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'connectrpc.conformance.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ClientErrorResult clone() => ClientErrorResult()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ClientErrorResult copyWith(void Function(ClientErrorResult) updates) =>
      super.copyWith((message) => updates(message as ClientErrorResult))
          as ClientErrorResult;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClientErrorResult create() => ClientErrorResult._();
  ClientErrorResult createEmptyInstance() => create();
  static $pb.PbList<ClientErrorResult> createRepeated() =>
      $pb.PbList<ClientErrorResult>();
  @$core.pragma('dart2js:noInline')
  static ClientErrorResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ClientErrorResult>(create);
  static ClientErrorResult? _defaultInstance;

  /// A message describing the error that occurred. This string will be shown to
  /// users running conformance tests so it should include any relevant details
  /// that may help troubleshoot or remedy the error.
  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);
}

/// Details about various values as observed on the wire. This message is used
/// only by the reference client when reporting results and should not be populated
/// by clients under test.
class WireDetails extends $pb.GeneratedMessage {
  factory WireDetails({
    $core.int? actualStatusCode,
    $4.Struct? connectErrorRaw,
    $core.Iterable<$2.Header>? actualHttpTrailers,
    $core.String? actualGrpcwebTrailers,
  }) {
    final $result = create();
    if (actualStatusCode != null) {
      $result.actualStatusCode = actualStatusCode;
    }
    if (connectErrorRaw != null) {
      $result.connectErrorRaw = connectErrorRaw;
    }
    if (actualHttpTrailers != null) {
      $result.actualHttpTrailers.addAll(actualHttpTrailers);
    }
    if (actualGrpcwebTrailers != null) {
      $result.actualGrpcwebTrailers = actualGrpcwebTrailers;
    }
    return $result;
  }
  WireDetails._() : super();
  factory WireDetails.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory WireDetails.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WireDetails',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'connectrpc.conformance.v1'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1, _omitFieldNames ? '' : 'actualStatusCode', $pb.PbFieldType.O3)
    ..aOM<$4.Struct>(2, _omitFieldNames ? '' : 'connectErrorRaw',
        subBuilder: $4.Struct.create)
    ..pc<$2.Header>(
        3, _omitFieldNames ? '' : 'actualHttpTrailers', $pb.PbFieldType.PM,
        subBuilder: $2.Header.create)
    ..aOS(4, _omitFieldNames ? '' : 'actualGrpcwebTrailers')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  WireDetails clone() => WireDetails()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  WireDetails copyWith(void Function(WireDetails) updates) =>
      super.copyWith((message) => updates(message as WireDetails))
          as WireDetails;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WireDetails create() => WireDetails._();
  WireDetails createEmptyInstance() => create();
  static $pb.PbList<WireDetails> createRepeated() => $pb.PbList<WireDetails>();
  @$core.pragma('dart2js:noInline')
  static WireDetails getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WireDetails>(create);
  static WireDetails? _defaultInstance;

  /// The HTTP status code of the response.
  @$pb.TagNumber(1)
  $core.int get actualStatusCode => $_getIZ(0);
  @$pb.TagNumber(1)
  set actualStatusCode($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasActualStatusCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearActualStatusCode() => clearField(1);

  /// When processing an error from a Connect server, this should contain
  /// the actual JSON received on the wire.
  @$pb.TagNumber(2)
  $4.Struct get connectErrorRaw => $_getN(1);
  @$pb.TagNumber(2)
  set connectErrorRaw($4.Struct v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasConnectErrorRaw() => $_has(1);
  @$pb.TagNumber(2)
  void clearConnectErrorRaw() => clearField(2);
  @$pb.TagNumber(2)
  $4.Struct ensureConnectErrorRaw() => $_ensure(1);

  /// Any HTTP trailers observed after the response body. These do NOT
  /// include trailers that conveyed via the body, as done in the gRPC-Web
  /// and Connect streaming protocols.
  @$pb.TagNumber(3)
  $core.List<$2.Header> get actualHttpTrailers => $_getList(2);

  /// Any trailers that were transmitted in the final message of the
  /// response body for a gRPC-Web response. This could differ from the
  /// ClientResponseResult.response_trailers field since the RPC client
  /// library might canonicalize keys and it might choose to remove
  /// "grpc-status" et al from the set of metadata. This field will
  /// capture all of the entries and their exact on-the-wire spelling
  /// and formatting.
  @$pb.TagNumber(4)
  $core.String get actualGrpcwebTrailers => $_getSZ(3);
  @$pb.TagNumber(4)
  set actualGrpcwebTrailers($core.String v) {
    $_setString(3, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasActualGrpcwebTrailers() => $_has(3);
  @$pb.TagNumber(4)
  void clearActualGrpcwebTrailers() => clearField(4);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
