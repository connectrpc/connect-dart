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
//  source: connectrpc/conformance/v1/server_compat.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'config.pb.dart' as $1;
import 'config.pbenum.dart' as $1;

///  Describes one configuration for an RPC server. The server is
///  expected to expose the connectrpc.conformance.v1.ConformanceService
///  RPC service. The configuration does not include a port. The
///  process should pick an available port, which is typically
///  done by using port zero (0) when creating a network listener
///  so that the OS selects an available ephemeral port.
///
///  These properties are read from stdin. Once the server is
///  listening, details about the server, in the form of a
///  ServerCompatResponse, are written to stdout.
///
///  Each test process is expected to start only one RPC server.
///  When testing multiple configurations, multiple test processes
///  will be started, each with different properties.
class ServerCompatRequest extends $pb.GeneratedMessage {
  factory ServerCompatRequest({
    $1.Protocol? protocol,
    $1.HTTPVersion? httpVersion,
    $core.bool? useTls,
    $core.List<$core.int>? clientTlsCert,
    $core.int? messageReceiveLimit,
    $1.TLSCreds? serverCreds,
  }) {
    final $result = create();
    if (protocol != null) {
      $result.protocol = protocol;
    }
    if (httpVersion != null) {
      $result.httpVersion = httpVersion;
    }
    if (useTls != null) {
      $result.useTls = useTls;
    }
    if (clientTlsCert != null) {
      $result.clientTlsCert = clientTlsCert;
    }
    if (messageReceiveLimit != null) {
      $result.messageReceiveLimit = messageReceiveLimit;
    }
    if (serverCreds != null) {
      $result.serverCreds = serverCreds;
    }
    return $result;
  }
  ServerCompatRequest._() : super();
  factory ServerCompatRequest.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ServerCompatRequest.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ServerCompatRequest',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'connectrpc.conformance.v1'),
      createEmptyInstance: create)
    ..e<$1.Protocol>(1, _omitFieldNames ? '' : 'protocol', $pb.PbFieldType.OE,
        defaultOrMaker: $1.Protocol.PROTOCOL_UNSPECIFIED,
        valueOf: $1.Protocol.valueOf,
        enumValues: $1.Protocol.values)
    ..e<$1.HTTPVersion>(
        2, _omitFieldNames ? '' : 'httpVersion', $pb.PbFieldType.OE,
        defaultOrMaker: $1.HTTPVersion.HTTP_VERSION_UNSPECIFIED,
        valueOf: $1.HTTPVersion.valueOf,
        enumValues: $1.HTTPVersion.values)
    ..aOB(4, _omitFieldNames ? '' : 'useTls')
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'clientTlsCert', $pb.PbFieldType.OY)
    ..a<$core.int>(
        6, _omitFieldNames ? '' : 'messageReceiveLimit', $pb.PbFieldType.OU3)
    ..aOM<$1.TLSCreds>(7, _omitFieldNames ? '' : 'serverCreds',
        subBuilder: $1.TLSCreds.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ServerCompatRequest clone() => ServerCompatRequest()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ServerCompatRequest copyWith(void Function(ServerCompatRequest) updates) =>
      super.copyWith((message) => updates(message as ServerCompatRequest))
          as ServerCompatRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ServerCompatRequest create() => ServerCompatRequest._();
  ServerCompatRequest createEmptyInstance() => create();
  static $pb.PbList<ServerCompatRequest> createRepeated() =>
      $pb.PbList<ServerCompatRequest>();
  @$core.pragma('dart2js:noInline')
  static ServerCompatRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ServerCompatRequest>(create);
  static ServerCompatRequest? _defaultInstance;

  /// Signals to the server that it must support at least this protocol. Note
  /// that it is fine to support others.
  /// For example if `PROTOCOL_CONNECT` is specified, the server _must_ support
  /// at least Connect, but _may_ also support gRPC or gRPC-web.
  @$pb.TagNumber(1)
  $1.Protocol get protocol => $_getN(0);
  @$pb.TagNumber(1)
  set protocol($1.Protocol v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasProtocol() => $_has(0);
  @$pb.TagNumber(1)
  void clearProtocol() => clearField(1);

  /// Signals to the server the minimum HTTP version to support. As with
  /// `protocol`, it is fine to support other versions. For example, if
  /// `HTTP_VERSION_2` is specified, the server _must_ support HTTP/2, but _may_ also
  /// support HTTP/1.1 or HTTP/3.
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

  /// If true, generate a certificate that clients will be configured to trust
  /// when connecting and return it in the `pem_cert` field of the `ServerCompatResponse`.
  /// The certificate can be any TLS certificate where the subject matches the
  /// value sent back in the `host` field of the `ServerCompatResponse`.
  /// Self-signed certificates (and `localhost` as the subject) are allowed.
  /// If false, the server should not use TLS and instead use
  /// a plain-text/unencrypted socket.
  @$pb.TagNumber(4)
  $core.bool get useTls => $_getBF(2);
  @$pb.TagNumber(4)
  set useTls($core.bool v) {
    $_setBool(2, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasUseTls() => $_has(2);
  @$pb.TagNumber(4)
  void clearUseTls() => clearField(4);

  ///  If non-empty, the clients will use certificates to authenticate
  ///  themselves. This value is a PEM-encoded cert that should be
  ///  trusted by the server. When non-empty, the server should require
  ///  that clients provide certificates and they should validate that
  ///  the certificate presented is valid.
  ///
  ///  This will always be empty if use_tls is false.
  @$pb.TagNumber(5)
  $core.List<$core.int> get clientTlsCert => $_getN(3);
  @$pb.TagNumber(5)
  set clientTlsCert($core.List<$core.int> v) {
    $_setBytes(3, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasClientTlsCert() => $_has(3);
  @$pb.TagNumber(5)
  void clearClientTlsCert() => clearField(5);

  /// If non-zero, indicates the maximum size in bytes for a message.
  /// If the client sends anything larger, the server should reject it.
  @$pb.TagNumber(6)
  $core.int get messageReceiveLimit => $_getIZ(4);
  @$pb.TagNumber(6)
  set messageReceiveLimit($core.int v) {
    $_setUnsignedInt32(4, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasMessageReceiveLimit() => $_has(4);
  @$pb.TagNumber(6)
  void clearMessageReceiveLimit() => clearField(6);

  ///  If use_tls is true, this provides details for a self-signed TLS
  ///  cert that the server may use.
  ///
  ///  The provided certificate is only good for loopback communication:
  ///  it uses "localhost" and "127.0.0.1" as the IP and DNS names in
  ///  the certificate's subject. If the server needs a different subject
  ///  or the client is in an environment where configuring trust of a
  ///  self-signed certificate is difficult or infeasible.
  ///
  ///  If the server implementation chooses to use these credentials,
  ///  it must echo back the certificate in the ServerCompatResponse and
  ///  should also leave the host field empty or explicitly set to
  ///  "127.0.0.1".
  ///
  ///  If it chooses to use a different certificate and key, it must send
  ///  back the corresponding certificate in the ServerCompatResponse.
  @$pb.TagNumber(7)
  $1.TLSCreds get serverCreds => $_getN(5);
  @$pb.TagNumber(7)
  set serverCreds($1.TLSCreds v) {
    setField(7, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasServerCreds() => $_has(5);
  @$pb.TagNumber(7)
  void clearServerCreds() => clearField(7);
  @$pb.TagNumber(7)
  $1.TLSCreds ensureServerCreds() => $_ensure(5);
}

/// The outcome of one ServerCompatRequest.
class ServerCompatResponse extends $pb.GeneratedMessage {
  factory ServerCompatResponse({
    $core.String? host,
    $core.int? port,
    $core.List<$core.int>? pemCert,
  }) {
    final $result = create();
    if (host != null) {
      $result.host = host;
    }
    if (port != null) {
      $result.port = port;
    }
    if (pemCert != null) {
      $result.pemCert = pemCert;
    }
    return $result;
  }
  ServerCompatResponse._() : super();
  factory ServerCompatResponse.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ServerCompatResponse.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ServerCompatResponse',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'connectrpc.conformance.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'host')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'port', $pb.PbFieldType.OU3)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'pemCert', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ServerCompatResponse clone() =>
      ServerCompatResponse()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ServerCompatResponse copyWith(void Function(ServerCompatResponse) updates) =>
      super.copyWith((message) => updates(message as ServerCompatResponse))
          as ServerCompatResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ServerCompatResponse create() => ServerCompatResponse._();
  ServerCompatResponse createEmptyInstance() => create();
  static $pb.PbList<ServerCompatResponse> createRepeated() =>
      $pb.PbList<ServerCompatResponse>();
  @$core.pragma('dart2js:noInline')
  static ServerCompatResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ServerCompatResponse>(create);
  static ServerCompatResponse? _defaultInstance;

  /// The host where the server is running. This should usually be `127.0.0.1`,
  /// unless your program actually starts a remote server to which the client
  /// should connect.
  @$pb.TagNumber(1)
  $core.String get host => $_getSZ(0);
  @$pb.TagNumber(1)
  set host($core.String v) {
    $_setString(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasHost() => $_has(0);
  @$pb.TagNumber(1)
  void clearHost() => clearField(1);

  /// The port where the server is listening.
  @$pb.TagNumber(2)
  $core.int get port => $_getIZ(1);
  @$pb.TagNumber(2)
  set port($core.int v) {
    $_setUnsignedInt32(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasPort() => $_has(1);
  @$pb.TagNumber(2)
  void clearPort() => clearField(2);

  /// The TLS certificate, in PEM format, if `use_tls` was set
  /// to `true`. Clients will verify this certificate when connecting via TLS.
  /// If `use_tls` was set to `false`, this should always be empty.
  @$pb.TagNumber(3)
  $core.List<$core.int> get pemCert => $_getN(2);
  @$pb.TagNumber(3)
  set pemCert($core.List<$core.int> v) {
    $_setBytes(2, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasPemCert() => $_has(2);
  @$pb.TagNumber(3)
  void clearPemCert() => clearField(3);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
