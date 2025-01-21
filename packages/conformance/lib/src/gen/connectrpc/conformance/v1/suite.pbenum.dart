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

class TestSuite_TestMode extends $pb.ProtobufEnum {
  static const TestSuite_TestMode TEST_MODE_UNSPECIFIED =
      TestSuite_TestMode._(0, _omitEnumNames ? '' : 'TEST_MODE_UNSPECIFIED');
  static const TestSuite_TestMode TEST_MODE_CLIENT =
      TestSuite_TestMode._(1, _omitEnumNames ? '' : 'TEST_MODE_CLIENT');
  static const TestSuite_TestMode TEST_MODE_SERVER =
      TestSuite_TestMode._(2, _omitEnumNames ? '' : 'TEST_MODE_SERVER');

  static const $core.List<TestSuite_TestMode> values = <TestSuite_TestMode>[
    TEST_MODE_UNSPECIFIED,
    TEST_MODE_CLIENT,
    TEST_MODE_SERVER,
  ];

  static final $core.Map<$core.int, TestSuite_TestMode> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static TestSuite_TestMode? valueOf($core.int value) => _byValue[value];

  const TestSuite_TestMode._($core.int v, $core.String n) : super(v, n);
}

class TestSuite_ConnectVersionMode extends $pb.ProtobufEnum {
  static const TestSuite_ConnectVersionMode CONNECT_VERSION_MODE_UNSPECIFIED =
      TestSuite_ConnectVersionMode._(
          0, _omitEnumNames ? '' : 'CONNECT_VERSION_MODE_UNSPECIFIED');
  static const TestSuite_ConnectVersionMode CONNECT_VERSION_MODE_REQUIRE =
      TestSuite_ConnectVersionMode._(
          1, _omitEnumNames ? '' : 'CONNECT_VERSION_MODE_REQUIRE');
  static const TestSuite_ConnectVersionMode CONNECT_VERSION_MODE_IGNORE =
      TestSuite_ConnectVersionMode._(
          2, _omitEnumNames ? '' : 'CONNECT_VERSION_MODE_IGNORE');

  static const $core.List<TestSuite_ConnectVersionMode> values =
      <TestSuite_ConnectVersionMode>[
    CONNECT_VERSION_MODE_UNSPECIFIED,
    CONNECT_VERSION_MODE_REQUIRE,
    CONNECT_VERSION_MODE_IGNORE,
  ];

  static final $core.Map<$core.int, TestSuite_ConnectVersionMode> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static TestSuite_ConnectVersionMode? valueOf($core.int value) =>
      _byValue[value];

  const TestSuite_ConnectVersionMode._($core.int v, $core.String n)
      : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
