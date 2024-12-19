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
//  source: connectrpc/conformance/v1/suite.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'client_compat.pb.dart' as $5;
import 'config.pbenum.dart' as $1;
import 'suite.pbenum.dart';

export 'suite.pbenum.dart';

/// TestSuite represents a set of conformance test cases. This is also the schema
/// used for the structure of a YAML test file. Each YAML file represents a test
/// suite, which can contain numerous cases. Each test suite has various properties
/// that indicate the kinds of features that are tested. Test suites may be skipped
/// based on whether the client or server under test implements these features.
class TestSuite extends $pb.GeneratedMessage {
  factory TestSuite({
    $core.String? name,
    TestSuite_TestMode? mode,
    $core.Iterable<TestCase>? testCases,
    $core.Iterable<$1.Protocol>? relevantProtocols,
    $core.Iterable<$1.HTTPVersion>? relevantHttpVersions,
    $core.Iterable<$1.Codec>? relevantCodecs,
    $core.Iterable<$1.Compression>? relevantCompressions,
    TestSuite_ConnectVersionMode? connectVersionMode,
    $core.bool? reliesOnTls,
    $core.bool? reliesOnTlsClientCerts,
    $core.bool? reliesOnConnectGet,
    $core.bool? reliesOnMessageReceiveLimit,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (mode != null) {
      $result.mode = mode;
    }
    if (testCases != null) {
      $result.testCases.addAll(testCases);
    }
    if (relevantProtocols != null) {
      $result.relevantProtocols.addAll(relevantProtocols);
    }
    if (relevantHttpVersions != null) {
      $result.relevantHttpVersions.addAll(relevantHttpVersions);
    }
    if (relevantCodecs != null) {
      $result.relevantCodecs.addAll(relevantCodecs);
    }
    if (relevantCompressions != null) {
      $result.relevantCompressions.addAll(relevantCompressions);
    }
    if (connectVersionMode != null) {
      $result.connectVersionMode = connectVersionMode;
    }
    if (reliesOnTls != null) {
      $result.reliesOnTls = reliesOnTls;
    }
    if (reliesOnTlsClientCerts != null) {
      $result.reliesOnTlsClientCerts = reliesOnTlsClientCerts;
    }
    if (reliesOnConnectGet != null) {
      $result.reliesOnConnectGet = reliesOnConnectGet;
    }
    if (reliesOnMessageReceiveLimit != null) {
      $result.reliesOnMessageReceiveLimit = reliesOnMessageReceiveLimit;
    }
    return $result;
  }
  TestSuite._() : super();
  factory TestSuite.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TestSuite.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TestSuite',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'connectrpc.conformance.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..e<TestSuite_TestMode>(
        2, _omitFieldNames ? '' : 'mode', $pb.PbFieldType.OE,
        defaultOrMaker: TestSuite_TestMode.TEST_MODE_UNSPECIFIED,
        valueOf: TestSuite_TestMode.valueOf,
        enumValues: TestSuite_TestMode.values)
    ..pc<TestCase>(3, _omitFieldNames ? '' : 'testCases', $pb.PbFieldType.PM,
        subBuilder: TestCase.create)
    ..pc<$1.Protocol>(
        4, _omitFieldNames ? '' : 'relevantProtocols', $pb.PbFieldType.KE,
        valueOf: $1.Protocol.valueOf,
        enumValues: $1.Protocol.values,
        defaultEnumValue: $1.Protocol.PROTOCOL_UNSPECIFIED)
    ..pc<$1.HTTPVersion>(
        5, _omitFieldNames ? '' : 'relevantHttpVersions', $pb.PbFieldType.KE,
        valueOf: $1.HTTPVersion.valueOf,
        enumValues: $1.HTTPVersion.values,
        defaultEnumValue: $1.HTTPVersion.HTTP_VERSION_UNSPECIFIED)
    ..pc<$1.Codec>(
        6, _omitFieldNames ? '' : 'relevantCodecs', $pb.PbFieldType.KE,
        valueOf: $1.Codec.valueOf,
        enumValues: $1.Codec.values,
        defaultEnumValue: $1.Codec.CODEC_UNSPECIFIED)
    ..pc<$1.Compression>(
        7, _omitFieldNames ? '' : 'relevantCompressions', $pb.PbFieldType.KE,
        valueOf: $1.Compression.valueOf,
        enumValues: $1.Compression.values,
        defaultEnumValue: $1.Compression.COMPRESSION_UNSPECIFIED)
    ..e<TestSuite_ConnectVersionMode>(
        8, _omitFieldNames ? '' : 'connectVersionMode', $pb.PbFieldType.OE,
        defaultOrMaker:
            TestSuite_ConnectVersionMode.CONNECT_VERSION_MODE_UNSPECIFIED,
        valueOf: TestSuite_ConnectVersionMode.valueOf,
        enumValues: TestSuite_ConnectVersionMode.values)
    ..aOB(9, _omitFieldNames ? '' : 'reliesOnTls')
    ..aOB(10, _omitFieldNames ? '' : 'reliesOnTlsClientCerts')
    ..aOB(11, _omitFieldNames ? '' : 'reliesOnConnectGet')
    ..aOB(12, _omitFieldNames ? '' : 'reliesOnMessageReceiveLimit')
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TestSuite clone() => TestSuite()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TestSuite copyWith(void Function(TestSuite) updates) =>
      super.copyWith((message) => updates(message as TestSuite)) as TestSuite;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TestSuite create() => TestSuite._();
  TestSuite createEmptyInstance() => create();
  static $pb.PbList<TestSuite> createRepeated() => $pb.PbList<TestSuite>();
  @$core.pragma('dart2js:noInline')
  static TestSuite getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TestSuite>(create);
  static TestSuite? _defaultInstance;

  /// Test suite name. When writing test suites, this is a required field.
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

  /// The mode (client or server) that this test suite applies to. This is used
  /// in conjunction with the `--mode` flag passed to the conformance runner
  /// binary. If the mode on the suite is set to client, the tests will only be
  /// run if `--mode client` is set on the command to the test runner.
  /// Likewise if mode is server. If this is unset, the test case will be run in both modes.
  @$pb.TagNumber(2)
  TestSuite_TestMode get mode => $_getN(1);
  @$pb.TagNumber(2)
  set mode(TestSuite_TestMode v) {
    setField(2, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMode() => $_has(1);
  @$pb.TagNumber(2)
  void clearMode() => clearField(2);

  /// The actual test cases in the suite.
  @$pb.TagNumber(3)
  $core.List<TestCase> get testCases => $_getList(2);

  /// If non-empty, the protocols to which this suite applies. If empty,
  /// this suite applies to all protocols.
  @$pb.TagNumber(4)
  $core.List<$1.Protocol> get relevantProtocols => $_getList(3);

  /// If non-empty, the HTTP versions to which this suite applies. If empty,
  /// this suite applies to all HTTP versions.
  @$pb.TagNumber(5)
  $core.List<$1.HTTPVersion> get relevantHttpVersions => $_getList(4);

  /// If non-empty, the codecs to which this suite applies. If empty, this
  /// suite applies to all codecs.
  @$pb.TagNumber(6)
  $core.List<$1.Codec> get relevantCodecs => $_getList(5);

  /// If non-empty, the compression encodings to which this suite applies.
  /// If empty, this suite applies to all encodings.
  @$pb.TagNumber(7)
  $core.List<$1.Compression> get relevantCompressions => $_getList(6);

  /// Indicates the Connect version validation behavior that this suite
  /// relies on.
  @$pb.TagNumber(8)
  TestSuite_ConnectVersionMode get connectVersionMode => $_getN(7);
  @$pb.TagNumber(8)
  set connectVersionMode(TestSuite_ConnectVersionMode v) {
    setField(8, v);
  }

  @$pb.TagNumber(8)
  $core.bool hasConnectVersionMode() => $_has(7);
  @$pb.TagNumber(8)
  void clearConnectVersionMode() => clearField(8);

  /// If true, the cases in this suite rely on TLS and will only be run against
  /// TLS server configurations.
  @$pb.TagNumber(9)
  $core.bool get reliesOnTls => $_getBF(8);
  @$pb.TagNumber(9)
  set reliesOnTls($core.bool v) {
    $_setBool(8, v);
  }

  @$pb.TagNumber(9)
  $core.bool hasReliesOnTls() => $_has(8);
  @$pb.TagNumber(9)
  void clearReliesOnTls() => clearField(9);

  /// If true, the cases in this suite rely on the client using TLS
  /// certificates to authenticate with the server. (Should only be
  /// true if relies_on_tls is also true.)
  @$pb.TagNumber(10)
  $core.bool get reliesOnTlsClientCerts => $_getBF(9);
  @$pb.TagNumber(10)
  set reliesOnTlsClientCerts($core.bool v) {
    $_setBool(9, v);
  }

  @$pb.TagNumber(10)
  $core.bool hasReliesOnTlsClientCerts() => $_has(9);
  @$pb.TagNumber(10)
  void clearReliesOnTlsClientCerts() => clearField(10);

  /// If true, the cases in this suite rely on the Connect GET protocol.
  @$pb.TagNumber(11)
  $core.bool get reliesOnConnectGet => $_getBF(10);
  @$pb.TagNumber(11)
  set reliesOnConnectGet($core.bool v) {
    $_setBool(10, v);
  }

  @$pb.TagNumber(11)
  $core.bool hasReliesOnConnectGet() => $_has(10);
  @$pb.TagNumber(11)
  void clearReliesOnConnectGet() => clearField(11);

  /// If true, the cases in this suite rely on support for limiting the
  /// size of received messages. When true, mode should be set to indicate
  /// whether it is the client or the server that must support the limit.
  @$pb.TagNumber(12)
  $core.bool get reliesOnMessageReceiveLimit => $_getBF(11);
  @$pb.TagNumber(12)
  set reliesOnMessageReceiveLimit($core.bool v) {
    $_setBool(11, v);
  }

  @$pb.TagNumber(12)
  $core.bool hasReliesOnMessageReceiveLimit() => $_has(11);
  @$pb.TagNumber(12)
  void clearReliesOnMessageReceiveLimit() => clearField(12);
}

class TestCase_ExpandedSize extends $pb.GeneratedMessage {
  factory TestCase_ExpandedSize({
    $core.int? sizeRelativeToLimit,
  }) {
    final $result = create();
    if (sizeRelativeToLimit != null) {
      $result.sizeRelativeToLimit = sizeRelativeToLimit;
    }
    return $result;
  }
  TestCase_ExpandedSize._() : super();
  factory TestCase_ExpandedSize.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TestCase_ExpandedSize.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TestCase.ExpandedSize',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'connectrpc.conformance.v1'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1, _omitFieldNames ? '' : 'sizeRelativeToLimit', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TestCase_ExpandedSize clone() =>
      TestCase_ExpandedSize()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TestCase_ExpandedSize copyWith(
          void Function(TestCase_ExpandedSize) updates) =>
      super.copyWith((message) => updates(message as TestCase_ExpandedSize))
          as TestCase_ExpandedSize;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TestCase_ExpandedSize create() => TestCase_ExpandedSize._();
  TestCase_ExpandedSize createEmptyInstance() => create();
  static $pb.PbList<TestCase_ExpandedSize> createRepeated() =>
      $pb.PbList<TestCase_ExpandedSize>();
  @$core.pragma('dart2js:noInline')
  static TestCase_ExpandedSize getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TestCase_ExpandedSize>(create);
  static TestCase_ExpandedSize? _defaultInstance;

  /// The size, in bytes, relative to the limit. For example, to expand to a
  /// size that is exactly equal to the limit, this should be set to zero.
  /// Any value greater than zero indicates that the request size will be that
  /// many bytes over the limit.
  @$pb.TagNumber(1)
  $core.int get sizeRelativeToLimit => $_getIZ(0);
  @$pb.TagNumber(1)
  set sizeRelativeToLimit($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasSizeRelativeToLimit() => $_has(0);
  @$pb.TagNumber(1)
  void clearSizeRelativeToLimit() => clearField(1);
}

class TestCase extends $pb.GeneratedMessage {
  factory TestCase({
    $5.ClientCompatRequest? request,
    $core.Iterable<TestCase_ExpandedSize>? expandRequests,
    $5.ClientResponseResult? expectedResponse,
    $core.Iterable<$1.Code>? otherAllowedErrorCodes,
  }) {
    final $result = create();
    if (request != null) {
      $result.request = request;
    }
    if (expandRequests != null) {
      $result.expandRequests.addAll(expandRequests);
    }
    if (expectedResponse != null) {
      $result.expectedResponse = expectedResponse;
    }
    if (otherAllowedErrorCodes != null) {
      $result.otherAllowedErrorCodes.addAll(otherAllowedErrorCodes);
    }
    return $result;
  }
  TestCase._() : super();
  factory TestCase.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory TestCase.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TestCase',
      package: const $pb.PackageName(
          _omitMessageNames ? '' : 'connectrpc.conformance.v1'),
      createEmptyInstance: create)
    ..aOM<$5.ClientCompatRequest>(1, _omitFieldNames ? '' : 'request',
        subBuilder: $5.ClientCompatRequest.create)
    ..pc<TestCase_ExpandedSize>(
        2, _omitFieldNames ? '' : 'expandRequests', $pb.PbFieldType.PM,
        subBuilder: TestCase_ExpandedSize.create)
    ..aOM<$5.ClientResponseResult>(3, _omitFieldNames ? '' : 'expectedResponse',
        subBuilder: $5.ClientResponseResult.create)
    ..pc<$1.Code>(
        4, _omitFieldNames ? '' : 'otherAllowedErrorCodes', $pb.PbFieldType.KE,
        valueOf: $1.Code.valueOf,
        enumValues: $1.Code.values,
        defaultEnumValue: $1.Code.CODE_UNSPECIFIED)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  TestCase clone() => TestCase()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  TestCase copyWith(void Function(TestCase) updates) =>
      super.copyWith((message) => updates(message as TestCase)) as TestCase;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TestCase create() => TestCase._();
  TestCase createEmptyInstance() => create();
  static $pb.PbList<TestCase> createRepeated() => $pb.PbList<TestCase>();
  @$core.pragma('dart2js:noInline')
  static TestCase getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TestCase>(create);
  static TestCase? _defaultInstance;

  /// Defines the RPC that the client should invoke. The first eight fields
  /// are not fully specified. Instead the first field, test_name, must be
  /// present but is a prefix -- other characteristics that identify one
  /// permutation of the test case will be appended to this name. The next
  /// seven fields (http_version, protocol, codec, compression, host, port,
  /// and server_tls_cert) must not be present. They are all populated by
  /// the test harness based on the test environment (e.g. actual server and
  ///  port to use) and characteristics of a single permutation.
  @$pb.TagNumber(1)
  $5.ClientCompatRequest get request => $_getN(0);
  @$pb.TagNumber(1)
  set request($5.ClientCompatRequest v) {
    setField(1, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasRequest() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequest() => clearField(1);
  @$pb.TagNumber(1)
  $5.ClientCompatRequest ensureRequest() => $_ensure(0);

  /// To support extremely large messages, as well as very precisely-sized
  /// messages, without having to encode them fully or perfectly in YAML
  /// test cases, this value can be specified. When non-empty, this value
  /// should have no more entries than there are messages in the request
  /// stream. The first value is applied to the first request message, and
  /// so on. For each entry, if the size is present, it is used to expand
  /// the data field in the request (which is actually part of the response
  /// definition). The specified size is added to the current limit on
  /// message size that the server will accept. That sum is the size of the
  /// the serialized message that will be sent, and the data field will be
  /// padded as needed to reach that size.
  @$pb.TagNumber(2)
  $core.List<TestCase_ExpandedSize> get expandRequests => $_getList(1);

  ///  Defines the expected response to the above RPC. The expected response for
  ///  a test is auto-generated based on the request details. The conformance runner
  ///  will determine what the response should be according to the values specified
  ///  in the test suite and individual test cases.
  ///
  ///  This value can also be specified explicitly in the test case YAML. However,
  ///  this is typically only needed for exception test cases. If the expected
  ///  response is mostly re-stating the response definition that appears in the
  ///  requests, test cases should rely on the auto-generation if possible.
  ///  Otherwise, specifying an expected response can make the test YAML overly
  ///  verbose and harder to read, write, and maintain.
  ///
  ///  If the test induces behavior that prevents the server from sending or client
  ///  from receiving the full response definition, it will be necessary to define
  ///  the expected response explicitly. Timeouts, cancellations, and exceeding
  ///  message size limits are good examples of this.
  ///
  ///  Specifying an expected response explicitly in test definitions will override
  ///  the auto-generation of the test runner.
  @$pb.TagNumber(3)
  $5.ClientResponseResult get expectedResponse => $_getN(2);
  @$pb.TagNumber(3)
  set expectedResponse($5.ClientResponseResult v) {
    setField(3, v);
  }

  @$pb.TagNumber(3)
  $core.bool hasExpectedResponse() => $_has(2);
  @$pb.TagNumber(3)
  void clearExpectedResponse() => clearField(3);
  @$pb.TagNumber(3)
  $5.ClientResponseResult ensureExpectedResponse() => $_ensure(2);

  /// When expected_response indicates that an error is expected, in some cases, the
  /// actual error code returned may be flexible. In that case, this field provides
  /// other acceptable error codes, in addition to the one indicated in the
  /// expected_response. As long as the actual error's code matches any of these, the
  /// error is considered conformant, and the test case can pass.
  @$pb.TagNumber(4)
  $core.List<$1.Code> get otherAllowedErrorCodes => $_getList(3);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
