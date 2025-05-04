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
//  source: connectrpc/eliza/v1/eliza.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use sayRequestDescriptor instead')
const SayRequest$json = {
  '1': 'SayRequest',
  '2': [
    {'1': 'sentence', '3': 1, '4': 1, '5': 9, '10': 'sentence'},
  ],
};

/// Descriptor for `SayRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sayRequestDescriptor = $convert.base64Decode(
    'CgpTYXlSZXF1ZXN0EhoKCHNlbnRlbmNlGAEgASgJUghzZW50ZW5jZQ==');

@$core.Deprecated('Use sayResponseDescriptor instead')
const SayResponse$json = {
  '1': 'SayResponse',
  '2': [
    {'1': 'sentence', '3': 1, '4': 1, '5': 9, '10': 'sentence'},
  ],
};

/// Descriptor for `SayResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sayResponseDescriptor = $convert.base64Decode(
    'CgtTYXlSZXNwb25zZRIaCghzZW50ZW5jZRgBIAEoCVIIc2VudGVuY2U=');

@$core.Deprecated('Use converseRequestDescriptor instead')
const ConverseRequest$json = {
  '1': 'ConverseRequest',
  '2': [
    {'1': 'sentence', '3': 1, '4': 1, '5': 9, '10': 'sentence'},
  ],
};

/// Descriptor for `ConverseRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List converseRequestDescriptor = $convert.base64Decode(
    'Cg9Db252ZXJzZVJlcXVlc3QSGgoIc2VudGVuY2UYASABKAlSCHNlbnRlbmNl');

@$core.Deprecated('Use converseResponseDescriptor instead')
const ConverseResponse$json = {
  '1': 'ConverseResponse',
  '2': [
    {'1': 'sentence', '3': 1, '4': 1, '5': 9, '10': 'sentence'},
  ],
};

/// Descriptor for `ConverseResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List converseResponseDescriptor = $convert.base64Decode(
    'ChBDb252ZXJzZVJlc3BvbnNlEhoKCHNlbnRlbmNlGAEgASgJUghzZW50ZW5jZQ==');

@$core.Deprecated('Use introduceRequestDescriptor instead')
const IntroduceRequest$json = {
  '1': 'IntroduceRequest',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `IntroduceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List introduceRequestDescriptor = $convert.base64Decode(
    'ChBJbnRyb2R1Y2VSZXF1ZXN0EhIKBG5hbWUYASABKAlSBG5hbWU=');

@$core.Deprecated('Use introduceResponseDescriptor instead')
const IntroduceResponse$json = {
  '1': 'IntroduceResponse',
  '2': [
    {'1': 'sentence', '3': 1, '4': 1, '5': 9, '10': 'sentence'},
  ],
};

/// Descriptor for `IntroduceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List introduceResponseDescriptor = $convert.base64Decode(
    'ChFJbnRyb2R1Y2VSZXNwb25zZRIaCghzZW50ZW5jZRgBIAEoCVIIc2VudGVuY2U=');

const $core.Map<$core.String, $core.dynamic> ElizaServiceBase$json = {
  '1': 'ElizaService',
  '2': [
    {
      '1': 'Say',
      '2': '.connectrpc.eliza.v1.SayRequest',
      '3': '.connectrpc.eliza.v1.SayResponse',
      '4': {'34': 1},
    },
    {'1': 'Converse', '2': '.connectrpc.eliza.v1.ConverseRequest', '3': '.connectrpc.eliza.v1.ConverseResponse', '4': {}, '5': true, '6': true},
    {'1': 'Introduce', '2': '.connectrpc.eliza.v1.IntroduceRequest', '3': '.connectrpc.eliza.v1.IntroduceResponse', '4': {}, '6': true},
  ],
};

@$core.Deprecated('Use elizaServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> ElizaServiceBase$messageJson = {
  '.connectrpc.eliza.v1.SayRequest': SayRequest$json,
  '.connectrpc.eliza.v1.SayResponse': SayResponse$json,
  '.connectrpc.eliza.v1.ConverseRequest': ConverseRequest$json,
  '.connectrpc.eliza.v1.ConverseResponse': ConverseResponse$json,
  '.connectrpc.eliza.v1.IntroduceRequest': IntroduceRequest$json,
  '.connectrpc.eliza.v1.IntroduceResponse': IntroduceResponse$json,
};

/// Descriptor for `ElizaService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List elizaServiceDescriptor = $convert.base64Decode(
    'CgxFbGl6YVNlcnZpY2USTQoDU2F5Eh8uY29ubmVjdHJwYy5lbGl6YS52MS5TYXlSZXF1ZXN0Gi'
    'AuY29ubmVjdHJwYy5lbGl6YS52MS5TYXlSZXNwb25zZSIDkAIBEl0KCENvbnZlcnNlEiQuY29u'
    'bmVjdHJwYy5lbGl6YS52MS5Db252ZXJzZVJlcXVlc3QaJS5jb25uZWN0cnBjLmVsaXphLnYxLk'
    'NvbnZlcnNlUmVzcG9uc2UiACgBMAESXgoJSW50cm9kdWNlEiUuY29ubmVjdHJwYy5lbGl6YS52'
    'MS5JbnRyb2R1Y2VSZXF1ZXN0GiYuY29ubmVjdHJwYy5lbGl6YS52MS5JbnRyb2R1Y2VSZXNwb2'
    '5zZSIAMAE=');

