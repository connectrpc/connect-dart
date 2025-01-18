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

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use testSuiteDescriptor instead')
const TestSuite$json = {
  '1': 'TestSuite',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {
      '1': 'mode',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.connectrpc.conformance.v1.TestSuite.TestMode',
      '10': 'mode'
    },
    {
      '1': 'test_cases',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.connectrpc.conformance.v1.TestCase',
      '10': 'testCases'
    },
    {
      '1': 'relevant_protocols',
      '3': 4,
      '4': 3,
      '5': 14,
      '6': '.connectrpc.conformance.v1.Protocol',
      '10': 'relevantProtocols'
    },
    {
      '1': 'relevant_http_versions',
      '3': 5,
      '4': 3,
      '5': 14,
      '6': '.connectrpc.conformance.v1.HTTPVersion',
      '10': 'relevantHttpVersions'
    },
    {
      '1': 'relevant_codecs',
      '3': 6,
      '4': 3,
      '5': 14,
      '6': '.connectrpc.conformance.v1.Codec',
      '10': 'relevantCodecs'
    },
    {
      '1': 'relevant_compressions',
      '3': 7,
      '4': 3,
      '5': 14,
      '6': '.connectrpc.conformance.v1.Compression',
      '10': 'relevantCompressions'
    },
    {
      '1': 'connect_version_mode',
      '3': 8,
      '4': 1,
      '5': 14,
      '6': '.connectrpc.conformance.v1.TestSuite.ConnectVersionMode',
      '10': 'connectVersionMode'
    },
    {'1': 'relies_on_tls', '3': 9, '4': 1, '5': 8, '10': 'reliesOnTls'},
    {
      '1': 'relies_on_tls_client_certs',
      '3': 10,
      '4': 1,
      '5': 8,
      '10': 'reliesOnTlsClientCerts'
    },
    {
      '1': 'relies_on_connect_get',
      '3': 11,
      '4': 1,
      '5': 8,
      '10': 'reliesOnConnectGet'
    },
    {
      '1': 'relies_on_message_receive_limit',
      '3': 12,
      '4': 1,
      '5': 8,
      '10': 'reliesOnMessageReceiveLimit'
    },
  ],
  '4': [TestSuite_TestMode$json, TestSuite_ConnectVersionMode$json],
};

@$core.Deprecated('Use testSuiteDescriptor instead')
const TestSuite_TestMode$json = {
  '1': 'TestMode',
  '2': [
    {'1': 'TEST_MODE_UNSPECIFIED', '2': 0},
    {'1': 'TEST_MODE_CLIENT', '2': 1},
    {'1': 'TEST_MODE_SERVER', '2': 2},
  ],
};

@$core.Deprecated('Use testSuiteDescriptor instead')
const TestSuite_ConnectVersionMode$json = {
  '1': 'ConnectVersionMode',
  '2': [
    {'1': 'CONNECT_VERSION_MODE_UNSPECIFIED', '2': 0},
    {'1': 'CONNECT_VERSION_MODE_REQUIRE', '2': 1},
    {'1': 'CONNECT_VERSION_MODE_IGNORE', '2': 2},
  ],
};

/// Descriptor for `TestSuite`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List testSuiteDescriptor = $convert.base64Decode(
    'CglUZXN0U3VpdGUSEgoEbmFtZRgBIAEoCVIEbmFtZRJBCgRtb2RlGAIgASgOMi0uY29ubmVjdH'
    'JwYy5jb25mb3JtYW5jZS52MS5UZXN0U3VpdGUuVGVzdE1vZGVSBG1vZGUSQgoKdGVzdF9jYXNl'
    'cxgDIAMoCzIjLmNvbm5lY3RycGMuY29uZm9ybWFuY2UudjEuVGVzdENhc2VSCXRlc3RDYXNlcx'
    'JSChJyZWxldmFudF9wcm90b2NvbHMYBCADKA4yIy5jb25uZWN0cnBjLmNvbmZvcm1hbmNlLnYx'
    'LlByb3RvY29sUhFyZWxldmFudFByb3RvY29scxJcChZyZWxldmFudF9odHRwX3ZlcnNpb25zGA'
    'UgAygOMiYuY29ubmVjdHJwYy5jb25mb3JtYW5jZS52MS5IVFRQVmVyc2lvblIUcmVsZXZhbnRI'
    'dHRwVmVyc2lvbnMSSQoPcmVsZXZhbnRfY29kZWNzGAYgAygOMiAuY29ubmVjdHJwYy5jb25mb3'
    'JtYW5jZS52MS5Db2RlY1IOcmVsZXZhbnRDb2RlY3MSWwoVcmVsZXZhbnRfY29tcHJlc3Npb25z'
    'GAcgAygOMiYuY29ubmVjdHJwYy5jb25mb3JtYW5jZS52MS5Db21wcmVzc2lvblIUcmVsZXZhbn'
    'RDb21wcmVzc2lvbnMSaQoUY29ubmVjdF92ZXJzaW9uX21vZGUYCCABKA4yNy5jb25uZWN0cnBj'
    'LmNvbmZvcm1hbmNlLnYxLlRlc3RTdWl0ZS5Db25uZWN0VmVyc2lvbk1vZGVSEmNvbm5lY3RWZX'
    'JzaW9uTW9kZRIiCg1yZWxpZXNfb25fdGxzGAkgASgIUgtyZWxpZXNPblRscxI6ChpyZWxpZXNf'
    'b25fdGxzX2NsaWVudF9jZXJ0cxgKIAEoCFIWcmVsaWVzT25UbHNDbGllbnRDZXJ0cxIxChVyZW'
    'xpZXNfb25fY29ubmVjdF9nZXQYCyABKAhSEnJlbGllc09uQ29ubmVjdEdldBJECh9yZWxpZXNf'
    'b25fbWVzc2FnZV9yZWNlaXZlX2xpbWl0GAwgASgIUhtyZWxpZXNPbk1lc3NhZ2VSZWNlaXZlTG'
    'ltaXQiUQoIVGVzdE1vZGUSGQoVVEVTVF9NT0RFX1VOU1BFQ0lGSUVEEAASFAoQVEVTVF9NT0RF'
    'X0NMSUVOVBABEhQKEFRFU1RfTU9ERV9TRVJWRVIQAiJ9ChJDb25uZWN0VmVyc2lvbk1vZGUSJA'
    'ogQ09OTkVDVF9WRVJTSU9OX01PREVfVU5TUEVDSUZJRUQQABIgChxDT05ORUNUX1ZFUlNJT05f'
    'TU9ERV9SRVFVSVJFEAESHwobQ09OTkVDVF9WRVJTSU9OX01PREVfSUdOT1JFEAI=');

@$core.Deprecated('Use testCaseDescriptor instead')
const TestCase$json = {
  '1': 'TestCase',
  '2': [
    {
      '1': 'request',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.connectrpc.conformance.v1.ClientCompatRequest',
      '10': 'request'
    },
    {
      '1': 'expand_requests',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.connectrpc.conformance.v1.TestCase.ExpandedSize',
      '10': 'expandRequests'
    },
    {
      '1': 'expected_response',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.connectrpc.conformance.v1.ClientResponseResult',
      '10': 'expectedResponse'
    },
    {
      '1': 'other_allowed_error_codes',
      '3': 4,
      '4': 3,
      '5': 14,
      '6': '.connectrpc.conformance.v1.Code',
      '10': 'otherAllowedErrorCodes'
    },
  ],
  '3': [TestCase_ExpandedSize$json],
};

@$core.Deprecated('Use testCaseDescriptor instead')
const TestCase_ExpandedSize$json = {
  '1': 'ExpandedSize',
  '2': [
    {
      '1': 'size_relative_to_limit',
      '3': 1,
      '4': 1,
      '5': 5,
      '9': 0,
      '10': 'sizeRelativeToLimit',
      '17': true
    },
  ],
  '8': [
    {'1': '_size_relative_to_limit'},
  ],
};

/// Descriptor for `TestCase`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List testCaseDescriptor = $convert.base64Decode(
    'CghUZXN0Q2FzZRJICgdyZXF1ZXN0GAEgASgLMi4uY29ubmVjdHJwYy5jb25mb3JtYW5jZS52MS'
    '5DbGllbnRDb21wYXRSZXF1ZXN0UgdyZXF1ZXN0ElkKD2V4cGFuZF9yZXF1ZXN0cxgCIAMoCzIw'
    'LmNvbm5lY3RycGMuY29uZm9ybWFuY2UudjEuVGVzdENhc2UuRXhwYW5kZWRTaXplUg5leHBhbm'
    'RSZXF1ZXN0cxJcChFleHBlY3RlZF9yZXNwb25zZRgDIAEoCzIvLmNvbm5lY3RycGMuY29uZm9y'
    'bWFuY2UudjEuQ2xpZW50UmVzcG9uc2VSZXN1bHRSEGV4cGVjdGVkUmVzcG9uc2USWgoZb3RoZX'
    'JfYWxsb3dlZF9lcnJvcl9jb2RlcxgEIAMoDjIfLmNvbm5lY3RycGMuY29uZm9ybWFuY2UudjEu'
    'Q29kZVIWb3RoZXJBbGxvd2VkRXJyb3JDb2RlcxpjCgxFeHBhbmRlZFNpemUSOAoWc2l6ZV9yZW'
    'xhdGl2ZV90b19saW1pdBgBIAEoBUgAUhNzaXplUmVsYXRpdmVUb0xpbWl0iAEBQhkKF19zaXpl'
    'X3JlbGF0aXZlX3RvX2xpbWl0');
