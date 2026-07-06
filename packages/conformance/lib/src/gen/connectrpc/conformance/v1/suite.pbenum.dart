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
// Generated from connectrpc/conformance/v1/suite.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class TestSuite_TestMode extends $pb.ProtobufEnum {
  /// Used when the test suite does not apply to a particular mode. Such tests
  /// are run, regardless of the current test mode, to verify both clients and
  /// servers under test.
  static const TestSuite_TestMode TEST_MODE_UNSPECIFIED =
      TestSuite_TestMode._(0, _omitEnumNames ? '' : 'TEST_MODE_UNSPECIFIED');

  /// Indicates tests that are intended to be used only for a client-under-test.
  /// These cases can induce very particular and/or aberrant responses from the
  /// reference server, to verify how the client reacts to such responses.
  static const TestSuite_TestMode TEST_MODE_CLIENT =
      TestSuite_TestMode._(1, _omitEnumNames ? '' : 'TEST_MODE_CLIENT');

  /// Indicates tests that are intended to be used only for a server-under-test.
  /// These cases can induce very particular and/or aberrant requests from the
  /// reference client, to verify how the server reacts to such requests.
  static const TestSuite_TestMode TEST_MODE_SERVER =
      TestSuite_TestMode._(2, _omitEnumNames ? '' : 'TEST_MODE_SERVER');

  static const $core.List<TestSuite_TestMode> values = <TestSuite_TestMode>[
    TEST_MODE_UNSPECIFIED,
    TEST_MODE_CLIENT,
    TEST_MODE_SERVER,
  ];

  static final $core.List<TestSuite_TestMode?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static TestSuite_TestMode? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const TestSuite_TestMode._(super.value, super.name);
}

class TestSuite_ConnectVersionMode extends $pb.ProtobufEnum {
  /// Used when the suite is agnostic to the server's validation
  /// behavior.
  static const TestSuite_ConnectVersionMode CONNECT_VERSION_MODE_UNSPECIFIED =
      TestSuite_ConnectVersionMode._(
          0, _omitEnumNames ? '' : 'CONNECT_VERSION_MODE_UNSPECIFIED');

  /// Used when the suite relies on the server validating the presence
  /// and correctness of the Connect version header or query param.
  static const TestSuite_ConnectVersionMode CONNECT_VERSION_MODE_REQUIRE =
      TestSuite_ConnectVersionMode._(
          1, _omitEnumNames ? '' : 'CONNECT_VERSION_MODE_REQUIRE');

  /// Used when the suite relies on the server ignore any Connect
  /// header or query param.
  static const TestSuite_ConnectVersionMode CONNECT_VERSION_MODE_IGNORE =
      TestSuite_ConnectVersionMode._(
          2, _omitEnumNames ? '' : 'CONNECT_VERSION_MODE_IGNORE');

  static const $core.List<TestSuite_ConnectVersionMode> values =
      <TestSuite_ConnectVersionMode>[
    CONNECT_VERSION_MODE_UNSPECIFIED,
    CONNECT_VERSION_MODE_REQUIRE,
    CONNECT_VERSION_MODE_IGNORE,
  ];

  static final $core.List<TestSuite_ConnectVersionMode?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static TestSuite_ConnectVersionMode? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const TestSuite_ConnectVersionMode._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
