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
// Generated from nested.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports
// ignore_for_file: unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use outerFooDescriptor instead')
const OuterFoo$json = {
  '1': 'OuterFoo',
  '3': [OuterFoo_Middle$json],
};

@$core.Deprecated('Use outerFooDescriptor instead')
const OuterFoo_Middle$json = {
  '1': 'Middle',
  '3': [OuterFoo_Middle_Inner$json],
};

@$core.Deprecated('Use outerFooDescriptor instead')
const OuterFoo_Middle_Inner$json = {
  '1': 'Inner',
};

/// Descriptor for `OuterFoo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List outerFooDescriptor =
    $convert.base64Decode('CghPdXRlckZvbxoRCgZNaWRkbGUaBwoFSW5uZXI=');

@$core.Deprecated('Use outerBarDescriptor instead')
const OuterBar$json = {
  '1': 'OuterBar',
  '3': [OuterBar_Middle$json],
};

@$core.Deprecated('Use outerBarDescriptor instead')
const OuterBar_Middle$json = {
  '1': 'Middle',
  '3': [OuterBar_Middle_Inner$json],
};

@$core.Deprecated('Use outerBarDescriptor instead')
const OuterBar_Middle_Inner$json = {
  '1': 'Inner',
};

/// Descriptor for `OuterBar`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List outerBarDescriptor =
    $convert.base64Decode('CghPdXRlckJhchoRCgZNaWRkbGUaBwoFSW5uZXI=');

const $core.Map<$core.String, $core.dynamic> NestedServiceBase$json = {
  '1': 'NestedService',
  '2': [
    {
      '1': 'Foo',
      '2': '.nested.OuterFoo.Middle',
      '3': '.nested.OuterFoo.Middle.Inner'
    },
    {
      '1': 'Bar',
      '2': '.nested.OuterBar.Middle',
      '3': '.nested.OuterBar.Middle.Inner'
    },
  ],
};

@$core.Deprecated('Use nestedServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    NestedServiceBase$messageJson = {
  '.nested.OuterFoo.Middle': OuterFoo_Middle$json,
  '.nested.OuterFoo.Middle.Inner': OuterFoo_Middle_Inner$json,
  '.nested.OuterBar.Middle': OuterBar_Middle$json,
  '.nested.OuterBar.Middle.Inner': OuterBar_Middle_Inner$json,
};

/// Descriptor for `NestedService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List nestedServiceDescriptor = $convert.base64Decode(
    'Cg1OZXN0ZWRTZXJ2aWNlEj0KA0ZvbxIXLm5lc3RlZC5PdXRlckZvby5NaWRkbGUaHS5uZXN0ZW'
    'QuT3V0ZXJGb28uTWlkZGxlLklubmVyEj0KA0JhchIXLm5lc3RlZC5PdXRlckJhci5NaWRkbGUa'
    'HS5uZXN0ZWQuT3V0ZXJCYXIuTWlkZGxlLklubmVy');
