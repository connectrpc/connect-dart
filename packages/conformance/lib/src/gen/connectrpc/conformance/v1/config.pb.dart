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
//  source: connectrpc/conformance/v1/config.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'config.pbenum.dart';

export 'config.pbenum.dart';

/// Config defines the configuration for running conformance tests.
/// This enumerates all of the "flavors" of the test suite to run.
class Config extends $pb.GeneratedMessage {
  factory Config({
    Features? features,
    $core.Iterable<ConfigCase>? includeCases,
    $core.Iterable<ConfigCase>? excludeCases,
  }) {
    final $result = create();
    if (features != null) {
      $result.features = features;
    }
    if (includeCases != null) {
      $result.includeCases.addAll(includeCases);
    }
    if (excludeCases != null) {
      $result.excludeCases.addAll(excludeCases);
    }
    return $result;
  }
  Config._() : super();
  factory Config.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Config.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Config',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'connectrpc.conformance.v1'),
      createEmptyInstance: create)
    ..aOM<Features>(1, _omitFieldNames ? '' : 'features',
        subBuilder: Features.create)
    ..pc<ConfigCase>(
        2, _omitFieldNames ? '' : 'includeCases', $pb.PbFieldType.PM,
        subBuilder: ConfigCase.create)
    ..pc<ConfigCase>(
        3, _omitFieldNames ? '' : 'excludeCases', $pb.PbFieldType.PM,
        subBuilder: ConfigCase.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Config clone() => Config()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Config copyWith(void Function(Config) updates) =>
      super.copyWith((message) => updates(message as Config)) as Config;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Config create() => Config._();
  Config createEmptyInstance() => create();
  static $pb.PbList<Config> createRepeated() => $pb.PbList<Config>();
  @$core.pragma('dart2js:noInline')
  static Config getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Config>(create);
  static Config? _defaultInstance;

  /// The features supported by the client or server under test.
  /// This is used to filter the set of test cases that are run.
  /// If absent, an empty message is used. See Features for more
  /// on how empty/absent fields are interpreted.
  @$pb.TagNumber(1)
  Features get features => $_getN(0);
  @$pb.TagNumber(1)
  set features(Features v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasFeatures() => $_has(0);
  @$pb.TagNumber(1)
  void clearFeatures() => clearField(1);
  @$pb.TagNumber(1)
  Features ensureFeatures() => $_ensure(0);

  /// This can indicate additional permutations that are supported
  /// that might otherwise be excluded based on the above features.
  @$pb.TagNumber(2)
  $core.List<ConfigCase> get includeCases => $_getList(1);

  /// This can indicates permutations that are not supported even
  /// though their support might be implied by the above features.
  @$pb.TagNumber(3)
  $core.List<ConfigCase> get excludeCases => $_getList(2);
}

/// Features define the feature set that a client or server supports. They are
/// used to determine the server configurations and test cases that
/// will be run. They are defined in YAML files and are specified as part of the
/// --conf flag to the test runner.
class Features extends $pb.GeneratedMessage {
  factory Features({
    $core.Iterable<HTTPVersion>? versions,
    $core.Iterable<Protocol>? protocols,
    $core.Iterable<Codec>? codecs,
    $core.Iterable<Compression>? compressions,
    $core.Iterable<StreamType>? streamTypes,
    $core.bool? supportsH2c,
    $core.bool? supportsTls,
    $core.bool? supportsTlsClientCerts,
    $core.bool? supportsTrailers,
    $core.bool? supportsHalfDuplexBidiOverHttp1,
    $core.bool? supportsConnectGet,
    $core.bool? supportsMessageReceiveLimit,
  }) {
    final $result = create();
    if (versions != null) {
      $result.versions.addAll(versions);
    }
    if (protocols != null) {
      $result.protocols.addAll(protocols);
    }
    if (codecs != null) {
      $result.codecs.addAll(codecs);
    }
    if (compressions != null) {
      $result.compressions.addAll(compressions);
    }
    if (streamTypes != null) {
      $result.streamTypes.addAll(streamTypes);
    }
    if (supportsH2c != null) {
      $result.supportsH2c = supportsH2c;
    }
    if (supportsTls != null) {
      $result.supportsTls = supportsTls;
    }
    if (supportsTlsClientCerts != null) {
      $result.supportsTlsClientCerts = supportsTlsClientCerts;
    }
    if (supportsTrailers != null) {
      $result.supportsTrailers = supportsTrailers;
    }
    if (supportsHalfDuplexBidiOverHttp1 != null) {
      $result.supportsHalfDuplexBidiOverHttp1 = supportsHalfDuplexBidiOverHttp1;
    }
    if (supportsConnectGet != null) {
      $result.supportsConnectGet = supportsConnectGet;
    }
    if (supportsMessageReceiveLimit != null) {
      $result.supportsMessageReceiveLimit = supportsMessageReceiveLimit;
    }
    return $result;
  }
  Features._() : super();
  factory Features.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Features.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Features',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'connectrpc.conformance.v1'),
      createEmptyInstance: create)
    ..pc<HTTPVersion>(1, _omitFieldNames ? '' : 'versions', $pb.PbFieldType.KE,
        valueOf: HTTPVersion.valueOf,
        enumValues: HTTPVersion.values,
        defaultEnumValue: HTTPVersion.HTTP_VERSION_UNSPECIFIED)
    ..pc<Protocol>(2, _omitFieldNames ? '' : 'protocols', $pb.PbFieldType.KE,
        valueOf: Protocol.valueOf,
        enumValues: Protocol.values,
        defaultEnumValue: Protocol.PROTOCOL_UNSPECIFIED)
    ..pc<Codec>(3, _omitFieldNames ? '' : 'codecs', $pb.PbFieldType.KE,
        valueOf: Codec.valueOf,
        enumValues: Codec.values,
        defaultEnumValue: Codec.CODEC_UNSPECIFIED)
    ..pc<Compression>(
        4, _omitFieldNames ? '' : 'compressions', $pb.PbFieldType.KE,
        valueOf: Compression.valueOf,
        enumValues: Compression.values,
        defaultEnumValue: Compression.COMPRESSION_UNSPECIFIED)
    ..pc<StreamType>(
        5, _omitFieldNames ? '' : 'streamTypes', $pb.PbFieldType.KE,
        valueOf: StreamType.valueOf,
        enumValues: StreamType.values,
        defaultEnumValue: StreamType.STREAM_TYPE_UNSPECIFIED)
    ..aOB(6, _omitFieldNames ? '' : 'supportsH2c')
    ..aOB(7, _omitFieldNames ? '' : 'supportsTls')
    ..aOB(8, _omitFieldNames ? '' : 'supportsTlsClientCerts')
    ..aOB(9, _omitFieldNames ? '' : 'supportsTrailers')
    ..aOB(10, _omitFieldNames ? '' : 'supportsHalfDuplexBidiOverHttp1')
    ..aOB(11, _omitFieldNames ? '' : 'supportsConnectGet')
    ..aOB(12, _omitFieldNames ? '' : 'supportsMessageReceiveLimit')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Features clone() => Features()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Features copyWith(void Function(Features) updates) =>
      super.copyWith((message) => updates(message as Features)) as Features;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Features create() => Features._();
  Features createEmptyInstance() => create();
  static $pb.PbList<Features> createRepeated() => $pb.PbList<Features>();
  @$core.pragma('dart2js:noInline')
  static Features getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Features>(create);
  static Features? _defaultInstance;

  /// Supported HTTP versions.
  /// If empty, HTTP 1.1 and HTTP/2 are assumed.
  @$pb.TagNumber(1)
  $core.List<HTTPVersion> get versions => $_getList(0);

  /// Supported protocols.
  /// If empty, all three are assumed: Connect, gRPC, and gRPC-Web.
  @$pb.TagNumber(2)
  $core.List<Protocol> get protocols => $_getList(1);

  /// Supported codecs.
  /// If empty, "proto" and "json" are assumed.
  @$pb.TagNumber(3)
  $core.List<Codec> get codecs => $_getList(2);

  /// Supported compression algorithms.
  /// If empty, "identity" and "gzip" are assumed.
  @$pb.TagNumber(4)
  $core.List<Compression> get compressions => $_getList(3);

  /// Supported stream types.
  /// If empty, all stream types are assumed. This is usually for
  /// clients, since some client environments may not be able to
  /// support certain kinds of streaming operations, especially
  /// bidirectional streams.
  @$pb.TagNumber(5)
  $core.List<StreamType> get streamTypes => $_getList(4);

  /// Whether H2C (unencrypted, non-TLS HTTP/2 over cleartext) is supported.
  /// If absent, true is assumed.
  @$pb.TagNumber(6)
  $core.bool get supportsH2c => $_getBF(5);
  @$pb.TagNumber(6)
  set supportsH2c($core.bool v) {
    $_setBool(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasSupportsH2c() => $_has(5);
  @$pb.TagNumber(6)
  void clearSupportsH2c() => clearField(6);

  /// Whether TLS is supported.
  /// If absent, true is assumed.
  @$pb.TagNumber(7)
  $core.bool get supportsTls => $_getBF(6);
  @$pb.TagNumber(7)
  set supportsTls($core.bool v) {
    $_setBool(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasSupportsTls() => $_has(6);
  @$pb.TagNumber(7)
  void clearSupportsTls() => clearField(7);

  /// Whether the client supports TLS certificates.
  /// If absent, false is assumed. This should not be set if
  /// supports_tls is false.
  @$pb.TagNumber(8)
  $core.bool get supportsTlsClientCerts => $_getBF(7);
  @$pb.TagNumber(8)
  set supportsTlsClientCerts($core.bool v) {
    $_setBool(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasSupportsTlsClientCerts() => $_has(7);
  @$pb.TagNumber(8)
  void clearSupportsTlsClientCerts() => clearField(8);

  /// Whether trailers are supported.
  /// If absent, true is assumed. If false, implies that gRPC protocol is not allowed.
  @$pb.TagNumber(9)
  $core.bool get supportsTrailers => $_getBF(8);
  @$pb.TagNumber(9)
  set supportsTrailers($core.bool v) {
    $_setBool(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasSupportsTrailers() => $_has(8);
  @$pb.TagNumber(9)
  void clearSupportsTrailers() => clearField(9);

  /// Whether half duplex bidi streams are supported over HTTP/1.1.
  /// If absent, false is assumed.
  @$pb.TagNumber(10)
  $core.bool get supportsHalfDuplexBidiOverHttp1 => $_getBF(9);
  @$pb.TagNumber(10)
  set supportsHalfDuplexBidiOverHttp1($core.bool v) {
    $_setBool(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasSupportsHalfDuplexBidiOverHttp1() => $_has(9);
  @$pb.TagNumber(10)
  void clearSupportsHalfDuplexBidiOverHttp1() => clearField(10);

  /// Whether Connect via GET is supported.
  /// If absent, true is assumed.
  @$pb.TagNumber(11)
  $core.bool get supportsConnectGet => $_getBF(10);
  @$pb.TagNumber(11)
  set supportsConnectGet($core.bool v) {
    $_setBool(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasSupportsConnectGet() => $_has(10);
  @$pb.TagNumber(11)
  void clearSupportsConnectGet() => clearField(11);

  /// Whether a message receive limit is supported.
  /// If absent, true is assumed.
  @$pb.TagNumber(12)
  $core.bool get supportsMessageReceiveLimit => $_getBF(11);
  @$pb.TagNumber(12)
  set supportsMessageReceiveLimit($core.bool v) {
    $_setBool(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasSupportsMessageReceiveLimit() => $_has(11);
  @$pb.TagNumber(12)
  void clearSupportsMessageReceiveLimit() => clearField(12);
}

/// ConfigCase represents a single resolved configuration case. When tests are
/// run, the Config and the supported features therein are used to compute all
/// of the cases relevant to the implementation under test. These configuration
/// cases are then used to select which test cases are applicable.
class ConfigCase extends $pb.GeneratedMessage {
  factory ConfigCase({
    HTTPVersion? version,
    Protocol? protocol,
    Codec? codec,
    Compression? compression,
    StreamType? streamType,
    $core.bool? useTls,
    $core.bool? useTlsClientCerts,
    $core.bool? useMessageReceiveLimit,
  }) {
    final $result = create();
    if (version != null) {
      $result.version = version;
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
    if (streamType != null) {
      $result.streamType = streamType;
    }
    if (useTls != null) {
      $result.useTls = useTls;
    }
    if (useTlsClientCerts != null) {
      $result.useTlsClientCerts = useTlsClientCerts;
    }
    if (useMessageReceiveLimit != null) {
      $result.useMessageReceiveLimit = useMessageReceiveLimit;
    }
    return $result;
  }
  ConfigCase._() : super();
  factory ConfigCase.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory ConfigCase.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConfigCase',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'connectrpc.conformance.v1'),
      createEmptyInstance: create)
    ..e<HTTPVersion>(1, _omitFieldNames ? '' : 'version', $pb.PbFieldType.OE,
        defaultOrMaker: HTTPVersion.HTTP_VERSION_UNSPECIFIED,
        valueOf: HTTPVersion.valueOf,
        enumValues: HTTPVersion.values)
    ..e<Protocol>(2, _omitFieldNames ? '' : 'protocol', $pb.PbFieldType.OE,
        defaultOrMaker: Protocol.PROTOCOL_UNSPECIFIED,
        valueOf: Protocol.valueOf,
        enumValues: Protocol.values)
    ..e<Codec>(3, _omitFieldNames ? '' : 'codec', $pb.PbFieldType.OE,
        defaultOrMaker: Codec.CODEC_UNSPECIFIED,
        valueOf: Codec.valueOf,
        enumValues: Codec.values)
    ..e<Compression>(
        4, _omitFieldNames ? '' : 'compression', $pb.PbFieldType.OE,
        defaultOrMaker: Compression.COMPRESSION_UNSPECIFIED,
        valueOf: Compression.valueOf,
        enumValues: Compression.values)
    ..e<StreamType>(5, _omitFieldNames ? '' : 'streamType', $pb.PbFieldType.OE,
        defaultOrMaker: StreamType.STREAM_TYPE_UNSPECIFIED,
        valueOf: StreamType.valueOf,
        enumValues: StreamType.values)
    ..aOB(6, _omitFieldNames ? '' : 'useTls')
    ..aOB(7, _omitFieldNames ? '' : 'useTlsClientCerts')
    ..aOB(8, _omitFieldNames ? '' : 'useMessageReceiveLimit')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  ConfigCase clone() => ConfigCase()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  ConfigCase copyWith(void Function(ConfigCase) updates) =>
      super.copyWith((message) => updates(message as ConfigCase)) as ConfigCase;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConfigCase create() => ConfigCase._();
  ConfigCase createEmptyInstance() => create();
  static $pb.PbList<ConfigCase> createRepeated() => $pb.PbList<ConfigCase>();
  @$core.pragma('dart2js:noInline')
  static ConfigCase getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConfigCase>(create);
  static ConfigCase? _defaultInstance;

  /// If unspecified, indicates cases for all versions.
  @$pb.TagNumber(1)
  HTTPVersion get version => $_getN(0);
  @$pb.TagNumber(1)
  set version(HTTPVersion v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => clearField(1);

  /// If unspecified, indicates cases for all protocols.
  @$pb.TagNumber(2)
  Protocol get protocol => $_getN(1);
  @$pb.TagNumber(2)
  set protocol(Protocol v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasProtocol() => $_has(1);
  @$pb.TagNumber(2)
  void clearProtocol() => clearField(2);

  /// If unspecified, indicates cases for all codecs.
  @$pb.TagNumber(3)
  Codec get codec => $_getN(2);
  @$pb.TagNumber(3)
  set codec(Codec v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasCodec() => $_has(2);
  @$pb.TagNumber(3)
  void clearCodec() => clearField(3);

  /// If unspecified, indicates cases for all compression algorithms.
  @$pb.TagNumber(4)
  Compression get compression => $_getN(3);
  @$pb.TagNumber(4)
  set compression(Compression v) {
    setField(4, v);
  }

  @$pb.TagNumber(4)
  $core.bool hasCompression() => $_has(3);
  @$pb.TagNumber(4)
  void clearCompression() => clearField(4);

  /// If unspecified, indicates cases for all stream types.
  @$pb.TagNumber(5)
  StreamType get streamType => $_getN(4);
  @$pb.TagNumber(5)
  set streamType(StreamType v) {
    setField(5, v);
  }

  @$pb.TagNumber(5)
  $core.bool hasStreamType() => $_has(4);
  @$pb.TagNumber(5)
  void clearStreamType() => clearField(5);

  /// If absent, indicates cases for plaintext (no TLS) but also for
  /// TLS if features indicate that TLS is supported.
  @$pb.TagNumber(6)
  $core.bool get useTls => $_getBF(5);
  @$pb.TagNumber(6)
  set useTls($core.bool v) {
    $_setBool(5, v);
  }

  @$pb.TagNumber(6)
  $core.bool hasUseTls() => $_has(5);
  @$pb.TagNumber(6)
  void clearUseTls() => clearField(6);

  /// If absent, indicates cases without client certs but also cases
  /// that use client certs if features indicate they are supported.
  @$pb.TagNumber(7)
  $core.bool get useTlsClientCerts => $_getBF(6);
  @$pb.TagNumber(7)
  set useTlsClientCerts($core.bool v) {
    $_setBool(6, v);
  }

  @$pb.TagNumber(7)
  $core.bool hasUseTlsClientCerts() => $_has(6);
  @$pb.TagNumber(7)
  void clearUseTlsClientCerts() => clearField(7);

  /// If absent, indicates cases that do not test message receive
  /// limits but also cases that do test message receive limits if
  /// features indicate they are supported.
  @$pb.TagNumber(8)
  $core.bool get useMessageReceiveLimit => $_getBF(7);
  @$pb.TagNumber(8)
  set useMessageReceiveLimit($core.bool v) {
    $_setBool(7, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasUseMessageReceiveLimit() => $_has(7);
  @$pb.TagNumber(8)
  void clearUseMessageReceiveLimit() => clearField(8);
}

/// TLSCreds represents credentials for TLS. It includes both a
/// certificate and corresponding private key. Both are encoded
/// in PEM format.
class TLSCreds extends $pb.GeneratedMessage {
  factory TLSCreds({
    $core.List<$core.int>? cert,
    $core.List<$core.int>? key,
  }) {
    final $result = create();
    if (cert != null) {
      $result.cert = cert;
    }
    if (key != null) {
      $result.key = key;
    }
    return $result;
  }
  TLSCreds._() : super();
  factory TLSCreds.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TLSCreds.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TLSCreds',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'connectrpc.conformance.v1'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'cert', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'key', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TLSCreds clone() => TLSCreds()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TLSCreds copyWith(void Function(TLSCreds) updates) =>
      super.copyWith((message) => updates(message as TLSCreds)) as TLSCreds;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TLSCreds create() => TLSCreds._();
  TLSCreds createEmptyInstance() => create();
  static $pb.PbList<TLSCreds> createRepeated() => $pb.PbList<TLSCreds>();
  @$core.pragma('dart2js:noInline')
  static TLSCreds getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TLSCreds>(create);
  static TLSCreds? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get cert => $_getN(0);
  @$pb.TagNumber(1)
  set cert($core.List<$core.int> v) {
    $_setBytes(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCert() => $_has(0);
  @$pb.TagNumber(1)
  void clearCert() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get key => $_getN(1);
  @$pb.TagNumber(2)
  set key($core.List<$core.int> v) {
    $_setBytes(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasKey() => $_has(1);
  @$pb.TagNumber(2)
  void clearKey() => clearField(2);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
