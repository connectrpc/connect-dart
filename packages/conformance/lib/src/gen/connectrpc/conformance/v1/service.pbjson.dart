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
//  source: connectrpc/conformance/v1/service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import '../../../google/protobuf/any.pbjson.dart' as $0;

@$core.Deprecated('Use unaryResponseDefinitionDescriptor instead')
const UnaryResponseDefinition$json = {
  '1': 'UnaryResponseDefinition',
  '2': [
    {
      '1': 'response_headers',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.connectrpc.conformance.v1.Header',
      '10': 'responseHeaders'
    },
    {
      '1': 'response_data',
      '3': 2,
      '4': 1,
      '5': 12,
      '9': 0,
      '10': 'responseData'
    },
    {
      '1': 'error',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.connectrpc.conformance.v1.Error',
      '9': 0,
      '10': 'error'
    },
    {
      '1': 'response_trailers',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.connectrpc.conformance.v1.Header',
      '10': 'responseTrailers'
    },
    {
      '1': 'response_delay_ms',
      '3': 6,
      '4': 1,
      '5': 13,
      '10': 'responseDelayMs'
    },
    {
      '1': 'raw_response',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.connectrpc.conformance.v1.RawHTTPResponse',
      '10': 'rawResponse'
    },
  ],
  '8': [
    {'1': 'response'},
  ],
};

/// Descriptor for `UnaryResponseDefinition`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unaryResponseDefinitionDescriptor = $convert.base64Decode(
    'ChdVbmFyeVJlc3BvbnNlRGVmaW5pdGlvbhJMChByZXNwb25zZV9oZWFkZXJzGAEgAygLMiEuY2'
    '9ubmVjdHJwYy5jb25mb3JtYW5jZS52MS5IZWFkZXJSD3Jlc3BvbnNlSGVhZGVycxIlCg1yZXNw'
    'b25zZV9kYXRhGAIgASgMSABSDHJlc3BvbnNlRGF0YRI4CgVlcnJvchgDIAEoCzIgLmNvbm5lY3'
    'RycGMuY29uZm9ybWFuY2UudjEuRXJyb3JIAFIFZXJyb3ISTgoRcmVzcG9uc2VfdHJhaWxlcnMY'
    'BCADKAsyIS5jb25uZWN0cnBjLmNvbmZvcm1hbmNlLnYxLkhlYWRlclIQcmVzcG9uc2VUcmFpbG'
    'VycxIqChFyZXNwb25zZV9kZWxheV9tcxgGIAEoDVIPcmVzcG9uc2VEZWxheU1zEk0KDHJhd19y'
    'ZXNwb25zZRgFIAEoCzIqLmNvbm5lY3RycGMuY29uZm9ybWFuY2UudjEuUmF3SFRUUFJlc3Bvbn'
    'NlUgtyYXdSZXNwb25zZUIKCghyZXNwb25zZQ==');

@$core.Deprecated('Use streamResponseDefinitionDescriptor instead')
const StreamResponseDefinition$json = {
  '1': 'StreamResponseDefinition',
  '2': [
    {
      '1': 'response_headers',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.connectrpc.conformance.v1.Header',
      '10': 'responseHeaders'
    },
    {'1': 'response_data', '3': 2, '4': 3, '5': 12, '10': 'responseData'},
    {
      '1': 'response_delay_ms',
      '3': 3,
      '4': 1,
      '5': 13,
      '10': 'responseDelayMs'
    },
    {
      '1': 'error',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.connectrpc.conformance.v1.Error',
      '10': 'error'
    },
    {
      '1': 'response_trailers',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.connectrpc.conformance.v1.Header',
      '10': 'responseTrailers'
    },
    {
      '1': 'raw_response',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.connectrpc.conformance.v1.RawHTTPResponse',
      '10': 'rawResponse'
    },
  ],
};

/// Descriptor for `StreamResponseDefinition`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamResponseDefinitionDescriptor = $convert.base64Decode(
    'ChhTdHJlYW1SZXNwb25zZURlZmluaXRpb24STAoQcmVzcG9uc2VfaGVhZGVycxgBIAMoCzIhLm'
    'Nvbm5lY3RycGMuY29uZm9ybWFuY2UudjEuSGVhZGVyUg9yZXNwb25zZUhlYWRlcnMSIwoNcmVz'
    'cG9uc2VfZGF0YRgCIAMoDFIMcmVzcG9uc2VEYXRhEioKEXJlc3BvbnNlX2RlbGF5X21zGAMgAS'
    'gNUg9yZXNwb25zZURlbGF5TXMSNgoFZXJyb3IYBCABKAsyIC5jb25uZWN0cnBjLmNvbmZvcm1h'
    'bmNlLnYxLkVycm9yUgVlcnJvchJOChFyZXNwb25zZV90cmFpbGVycxgFIAMoCzIhLmNvbm5lY3'
    'RycGMuY29uZm9ybWFuY2UudjEuSGVhZGVyUhByZXNwb25zZVRyYWlsZXJzEk0KDHJhd19yZXNw'
    'b25zZRgGIAEoCzIqLmNvbm5lY3RycGMuY29uZm9ybWFuY2UudjEuUmF3SFRUUFJlc3BvbnNlUg'
    'tyYXdSZXNwb25zZQ==');

@$core.Deprecated('Use unaryRequestDescriptor instead')
const UnaryRequest$json = {
  '1': 'UnaryRequest',
  '2': [
    {
      '1': 'response_definition',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.connectrpc.conformance.v1.UnaryResponseDefinition',
      '10': 'responseDefinition'
    },
    {'1': 'request_data', '3': 2, '4': 1, '5': 12, '10': 'requestData'},
  ],
};

/// Descriptor for `UnaryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unaryRequestDescriptor = $convert.base64Decode(
    'CgxVbmFyeVJlcXVlc3QSYwoTcmVzcG9uc2VfZGVmaW5pdGlvbhgBIAEoCzIyLmNvbm5lY3RycG'
    'MuY29uZm9ybWFuY2UudjEuVW5hcnlSZXNwb25zZURlZmluaXRpb25SEnJlc3BvbnNlRGVmaW5p'
    'dGlvbhIhCgxyZXF1ZXN0X2RhdGEYAiABKAxSC3JlcXVlc3REYXRh');

@$core.Deprecated('Use unaryResponseDescriptor instead')
const UnaryResponse$json = {
  '1': 'UnaryResponse',
  '2': [
    {
      '1': 'payload',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.connectrpc.conformance.v1.ConformancePayload',
      '10': 'payload'
    },
  ],
};

/// Descriptor for `UnaryResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unaryResponseDescriptor = $convert.base64Decode(
    'Cg1VbmFyeVJlc3BvbnNlEkcKB3BheWxvYWQYASABKAsyLS5jb25uZWN0cnBjLmNvbmZvcm1hbm'
    'NlLnYxLkNvbmZvcm1hbmNlUGF5bG9hZFIHcGF5bG9hZA==');

@$core.Deprecated('Use idempotentUnaryRequestDescriptor instead')
const IdempotentUnaryRequest$json = {
  '1': 'IdempotentUnaryRequest',
  '2': [
    {
      '1': 'response_definition',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.connectrpc.conformance.v1.UnaryResponseDefinition',
      '10': 'responseDefinition'
    },
    {'1': 'request_data', '3': 2, '4': 1, '5': 12, '10': 'requestData'},
  ],
};

/// Descriptor for `IdempotentUnaryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List idempotentUnaryRequestDescriptor = $convert.base64Decode(
    'ChZJZGVtcG90ZW50VW5hcnlSZXF1ZXN0EmMKE3Jlc3BvbnNlX2RlZmluaXRpb24YASABKAsyMi'
    '5jb25uZWN0cnBjLmNvbmZvcm1hbmNlLnYxLlVuYXJ5UmVzcG9uc2VEZWZpbml0aW9uUhJyZXNw'
    'b25zZURlZmluaXRpb24SIQoMcmVxdWVzdF9kYXRhGAIgASgMUgtyZXF1ZXN0RGF0YQ==');

@$core.Deprecated('Use idempotentUnaryResponseDescriptor instead')
const IdempotentUnaryResponse$json = {
  '1': 'IdempotentUnaryResponse',
  '2': [
    {
      '1': 'payload',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.connectrpc.conformance.v1.ConformancePayload',
      '10': 'payload'
    },
  ],
};

/// Descriptor for `IdempotentUnaryResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List idempotentUnaryResponseDescriptor =
    $convert.base64Decode(
        'ChdJZGVtcG90ZW50VW5hcnlSZXNwb25zZRJHCgdwYXlsb2FkGAEgASgLMi0uY29ubmVjdHJwYy'
        '5jb25mb3JtYW5jZS52MS5Db25mb3JtYW5jZVBheWxvYWRSB3BheWxvYWQ=');

@$core.Deprecated('Use serverStreamRequestDescriptor instead')
const ServerStreamRequest$json = {
  '1': 'ServerStreamRequest',
  '2': [
    {
      '1': 'response_definition',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.connectrpc.conformance.v1.StreamResponseDefinition',
      '10': 'responseDefinition'
    },
    {'1': 'request_data', '3': 2, '4': 1, '5': 12, '10': 'requestData'},
  ],
};

/// Descriptor for `ServerStreamRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serverStreamRequestDescriptor = $convert.base64Decode(
    'ChNTZXJ2ZXJTdHJlYW1SZXF1ZXN0EmQKE3Jlc3BvbnNlX2RlZmluaXRpb24YASABKAsyMy5jb2'
    '5uZWN0cnBjLmNvbmZvcm1hbmNlLnYxLlN0cmVhbVJlc3BvbnNlRGVmaW5pdGlvblIScmVzcG9u'
    'c2VEZWZpbml0aW9uEiEKDHJlcXVlc3RfZGF0YRgCIAEoDFILcmVxdWVzdERhdGE=');

@$core.Deprecated('Use serverStreamResponseDescriptor instead')
const ServerStreamResponse$json = {
  '1': 'ServerStreamResponse',
  '2': [
    {
      '1': 'payload',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.connectrpc.conformance.v1.ConformancePayload',
      '10': 'payload'
    },
  ],
};

/// Descriptor for `ServerStreamResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serverStreamResponseDescriptor = $convert.base64Decode(
    'ChRTZXJ2ZXJTdHJlYW1SZXNwb25zZRJHCgdwYXlsb2FkGAEgASgLMi0uY29ubmVjdHJwYy5jb2'
    '5mb3JtYW5jZS52MS5Db25mb3JtYW5jZVBheWxvYWRSB3BheWxvYWQ=');

@$core.Deprecated('Use clientStreamRequestDescriptor instead')
const ClientStreamRequest$json = {
  '1': 'ClientStreamRequest',
  '2': [
    {
      '1': 'response_definition',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.connectrpc.conformance.v1.UnaryResponseDefinition',
      '10': 'responseDefinition'
    },
    {'1': 'request_data', '3': 2, '4': 1, '5': 12, '10': 'requestData'},
  ],
};

/// Descriptor for `ClientStreamRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List clientStreamRequestDescriptor = $convert.base64Decode(
    'ChNDbGllbnRTdHJlYW1SZXF1ZXN0EmMKE3Jlc3BvbnNlX2RlZmluaXRpb24YASABKAsyMi5jb2'
    '5uZWN0cnBjLmNvbmZvcm1hbmNlLnYxLlVuYXJ5UmVzcG9uc2VEZWZpbml0aW9uUhJyZXNwb25z'
    'ZURlZmluaXRpb24SIQoMcmVxdWVzdF9kYXRhGAIgASgMUgtyZXF1ZXN0RGF0YQ==');

@$core.Deprecated('Use clientStreamResponseDescriptor instead')
const ClientStreamResponse$json = {
  '1': 'ClientStreamResponse',
  '2': [
    {
      '1': 'payload',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.connectrpc.conformance.v1.ConformancePayload',
      '10': 'payload'
    },
  ],
};

/// Descriptor for `ClientStreamResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List clientStreamResponseDescriptor = $convert.base64Decode(
    'ChRDbGllbnRTdHJlYW1SZXNwb25zZRJHCgdwYXlsb2FkGAEgASgLMi0uY29ubmVjdHJwYy5jb2'
    '5mb3JtYW5jZS52MS5Db25mb3JtYW5jZVBheWxvYWRSB3BheWxvYWQ=');

@$core.Deprecated('Use bidiStreamRequestDescriptor instead')
const BidiStreamRequest$json = {
  '1': 'BidiStreamRequest',
  '2': [
    {
      '1': 'response_definition',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.connectrpc.conformance.v1.StreamResponseDefinition',
      '10': 'responseDefinition'
    },
    {'1': 'full_duplex', '3': 2, '4': 1, '5': 8, '10': 'fullDuplex'},
    {'1': 'request_data', '3': 3, '4': 1, '5': 12, '10': 'requestData'},
  ],
};

/// Descriptor for `BidiStreamRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bidiStreamRequestDescriptor = $convert.base64Decode(
    'ChFCaWRpU3RyZWFtUmVxdWVzdBJkChNyZXNwb25zZV9kZWZpbml0aW9uGAEgASgLMjMuY29ubm'
    'VjdHJwYy5jb25mb3JtYW5jZS52MS5TdHJlYW1SZXNwb25zZURlZmluaXRpb25SEnJlc3BvbnNl'
    'RGVmaW5pdGlvbhIfCgtmdWxsX2R1cGxleBgCIAEoCFIKZnVsbER1cGxleBIhCgxyZXF1ZXN0X2'
    'RhdGEYAyABKAxSC3JlcXVlc3REYXRh');

@$core.Deprecated('Use bidiStreamResponseDescriptor instead')
const BidiStreamResponse$json = {
  '1': 'BidiStreamResponse',
  '2': [
    {
      '1': 'payload',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.connectrpc.conformance.v1.ConformancePayload',
      '10': 'payload'
    },
  ],
};

/// Descriptor for `BidiStreamResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bidiStreamResponseDescriptor = $convert.base64Decode(
    'ChJCaWRpU3RyZWFtUmVzcG9uc2USRwoHcGF5bG9hZBgBIAEoCzItLmNvbm5lY3RycGMuY29uZm'
    '9ybWFuY2UudjEuQ29uZm9ybWFuY2VQYXlsb2FkUgdwYXlsb2Fk');

@$core.Deprecated('Use unimplementedRequestDescriptor instead')
const UnimplementedRequest$json = {
  '1': 'UnimplementedRequest',
};

/// Descriptor for `UnimplementedRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unimplementedRequestDescriptor =
    $convert.base64Decode('ChRVbmltcGxlbWVudGVkUmVxdWVzdA==');

@$core.Deprecated('Use unimplementedResponseDescriptor instead')
const UnimplementedResponse$json = {
  '1': 'UnimplementedResponse',
};

/// Descriptor for `UnimplementedResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unimplementedResponseDescriptor =
    $convert.base64Decode('ChVVbmltcGxlbWVudGVkUmVzcG9uc2U=');

@$core.Deprecated('Use conformancePayloadDescriptor instead')
const ConformancePayload$json = {
  '1': 'ConformancePayload',
  '2': [
    {'1': 'data', '3': 1, '4': 1, '5': 12, '10': 'data'},
    {
      '1': 'request_info',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.connectrpc.conformance.v1.ConformancePayload.RequestInfo',
      '10': 'requestInfo'
    },
  ],
  '3': [
    ConformancePayload_RequestInfo$json,
    ConformancePayload_ConnectGetInfo$json
  ],
};

@$core.Deprecated('Use conformancePayloadDescriptor instead')
const ConformancePayload_RequestInfo$json = {
  '1': 'RequestInfo',
  '2': [
    {
      '1': 'request_headers',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.connectrpc.conformance.v1.Header',
      '10': 'requestHeaders'
    },
    {
      '1': 'timeout_ms',
      '3': 2,
      '4': 1,
      '5': 3,
      '9': 0,
      '10': 'timeoutMs',
      '17': true
    },
    {
      '1': 'requests',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.google.protobuf.Any',
      '10': 'requests'
    },
    {
      '1': 'connect_get_info',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.connectrpc.conformance.v1.ConformancePayload.ConnectGetInfo',
      '10': 'connectGetInfo'
    },
  ],
  '8': [
    {'1': '_timeout_ms'},
  ],
};

@$core.Deprecated('Use conformancePayloadDescriptor instead')
const ConformancePayload_ConnectGetInfo$json = {
  '1': 'ConnectGetInfo',
  '2': [
    {
      '1': 'query_params',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.connectrpc.conformance.v1.Header',
      '10': 'queryParams'
    },
  ],
};

/// Descriptor for `ConformancePayload`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List conformancePayloadDescriptor = $convert.base64Decode(
    'ChJDb25mb3JtYW5jZVBheWxvYWQSEgoEZGF0YRgBIAEoDFIEZGF0YRJcCgxyZXF1ZXN0X2luZm'
    '8YAiABKAsyOS5jb25uZWN0cnBjLmNvbmZvcm1hbmNlLnYxLkNvbmZvcm1hbmNlUGF5bG9hZC5S'
    'ZXF1ZXN0SW5mb1ILcmVxdWVzdEluZm8apgIKC1JlcXVlc3RJbmZvEkoKD3JlcXVlc3RfaGVhZG'
    'VycxgBIAMoCzIhLmNvbm5lY3RycGMuY29uZm9ybWFuY2UudjEuSGVhZGVyUg5yZXF1ZXN0SGVh'
    'ZGVycxIiCgp0aW1lb3V0X21zGAIgASgDSABSCXRpbWVvdXRNc4gBARIwCghyZXF1ZXN0cxgDIA'
    'MoCzIULmdvb2dsZS5wcm90b2J1Zi5BbnlSCHJlcXVlc3RzEmYKEGNvbm5lY3RfZ2V0X2luZm8Y'
    'BCABKAsyPC5jb25uZWN0cnBjLmNvbmZvcm1hbmNlLnYxLkNvbmZvcm1hbmNlUGF5bG9hZC5Db2'
    '5uZWN0R2V0SW5mb1IOY29ubmVjdEdldEluZm9CDQoLX3RpbWVvdXRfbXMaVgoOQ29ubmVjdEdl'
    'dEluZm8SRAoMcXVlcnlfcGFyYW1zGAEgAygLMiEuY29ubmVjdHJwYy5jb25mb3JtYW5jZS52MS'
    '5IZWFkZXJSC3F1ZXJ5UGFyYW1z');

@$core.Deprecated('Use errorDescriptor instead')
const Error$json = {
  '1': 'Error',
  '2': [
    {
      '1': 'code',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.connectrpc.conformance.v1.Code',
      '10': 'code'
    },
    {
      '1': 'message',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'message',
      '17': true
    },
    {
      '1': 'details',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.google.protobuf.Any',
      '10': 'details'
    },
  ],
  '8': [
    {'1': '_message'},
  ],
};

/// Descriptor for `Error`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List errorDescriptor = $convert.base64Decode(
    'CgVFcnJvchIzCgRjb2RlGAEgASgOMh8uY29ubmVjdHJwYy5jb25mb3JtYW5jZS52MS5Db2RlUg'
    'Rjb2RlEh0KB21lc3NhZ2UYAiABKAlIAFIHbWVzc2FnZYgBARIuCgdkZXRhaWxzGAMgAygLMhQu'
    'Z29vZ2xlLnByb3RvYnVmLkFueVIHZGV0YWlsc0IKCghfbWVzc2FnZQ==');

@$core.Deprecated('Use headerDescriptor instead')
const Header$json = {
  '1': 'Header',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'value', '3': 2, '4': 3, '5': 9, '10': 'value'},
  ],
};

/// Descriptor for `Header`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List headerDescriptor = $convert.base64Decode(
    'CgZIZWFkZXISEgoEbmFtZRgBIAEoCVIEbmFtZRIUCgV2YWx1ZRgCIAMoCVIFdmFsdWU=');

@$core.Deprecated('Use rawHTTPRequestDescriptor instead')
const RawHTTPRequest$json = {
  '1': 'RawHTTPRequest',
  '2': [
    {'1': 'verb', '3': 1, '4': 1, '5': 9, '10': 'verb'},
    {'1': 'uri', '3': 2, '4': 1, '5': 9, '10': 'uri'},
    {
      '1': 'headers',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.connectrpc.conformance.v1.Header',
      '10': 'headers'
    },
    {
      '1': 'raw_query_params',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.connectrpc.conformance.v1.Header',
      '10': 'rawQueryParams'
    },
    {
      '1': 'encoded_query_params',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.connectrpc.conformance.v1.RawHTTPRequest.EncodedQueryParam',
      '10': 'encodedQueryParams'
    },
    {
      '1': 'unary',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.connectrpc.conformance.v1.MessageContents',
      '9': 0,
      '10': 'unary'
    },
    {
      '1': 'stream',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.connectrpc.conformance.v1.StreamContents',
      '9': 0,
      '10': 'stream'
    },
  ],
  '3': [RawHTTPRequest_EncodedQueryParam$json],
  '8': [
    {'1': 'body'},
  ],
};

@$core.Deprecated('Use rawHTTPRequestDescriptor instead')
const RawHTTPRequest_EncodedQueryParam$json = {
  '1': 'EncodedQueryParam',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {
      '1': 'value',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.connectrpc.conformance.v1.MessageContents',
      '10': 'value'
    },
    {'1': 'base64_encode', '3': 3, '4': 1, '5': 8, '10': 'base64Encode'},
  ],
};

/// Descriptor for `RawHTTPRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rawHTTPRequestDescriptor = $convert.base64Decode(
    'Cg5SYXdIVFRQUmVxdWVzdBISCgR2ZXJiGAEgASgJUgR2ZXJiEhAKA3VyaRgCIAEoCVIDdXJpEj'
    'sKB2hlYWRlcnMYAyADKAsyIS5jb25uZWN0cnBjLmNvbmZvcm1hbmNlLnYxLkhlYWRlclIHaGVh'
    'ZGVycxJLChByYXdfcXVlcnlfcGFyYW1zGAQgAygLMiEuY29ubmVjdHJwYy5jb25mb3JtYW5jZS'
    '52MS5IZWFkZXJSDnJhd1F1ZXJ5UGFyYW1zEm0KFGVuY29kZWRfcXVlcnlfcGFyYW1zGAUgAygL'
    'MjsuY29ubmVjdHJwYy5jb25mb3JtYW5jZS52MS5SYXdIVFRQUmVxdWVzdC5FbmNvZGVkUXVlcn'
    'lQYXJhbVISZW5jb2RlZFF1ZXJ5UGFyYW1zEkIKBXVuYXJ5GAYgASgLMiouY29ubmVjdHJwYy5j'
    'b25mb3JtYW5jZS52MS5NZXNzYWdlQ29udGVudHNIAFIFdW5hcnkSQwoGc3RyZWFtGAcgASgLMi'
    'kuY29ubmVjdHJwYy5jb25mb3JtYW5jZS52MS5TdHJlYW1Db250ZW50c0gAUgZzdHJlYW0ajgEK'
    'EUVuY29kZWRRdWVyeVBhcmFtEhIKBG5hbWUYASABKAlSBG5hbWUSQAoFdmFsdWUYAiABKAsyKi'
    '5jb25uZWN0cnBjLmNvbmZvcm1hbmNlLnYxLk1lc3NhZ2VDb250ZW50c1IFdmFsdWUSIwoNYmFz'
    'ZTY0X2VuY29kZRgDIAEoCFIMYmFzZTY0RW5jb2RlQgYKBGJvZHk=');

@$core.Deprecated('Use messageContentsDescriptor instead')
const MessageContents$json = {
  '1': 'MessageContents',
  '2': [
    {'1': 'binary', '3': 1, '4': 1, '5': 12, '9': 0, '10': 'binary'},
    {'1': 'text', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'text'},
    {
      '1': 'binary_message',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Any',
      '9': 0,
      '10': 'binaryMessage'
    },
    {
      '1': 'compression',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.connectrpc.conformance.v1.Compression',
      '10': 'compression'
    },
  ],
  '8': [
    {'1': 'data'},
  ],
};

/// Descriptor for `MessageContents`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageContentsDescriptor = $convert.base64Decode(
    'Cg9NZXNzYWdlQ29udGVudHMSGAoGYmluYXJ5GAEgASgMSABSBmJpbmFyeRIUCgR0ZXh0GAIgAS'
    'gJSABSBHRleHQSPQoOYmluYXJ5X21lc3NhZ2UYAyABKAsyFC5nb29nbGUucHJvdG9idWYuQW55'
    'SABSDWJpbmFyeU1lc3NhZ2USSAoLY29tcHJlc3Npb24YBCABKA4yJi5jb25uZWN0cnBjLmNvbm'
    'Zvcm1hbmNlLnYxLkNvbXByZXNzaW9uUgtjb21wcmVzc2lvbkIGCgRkYXRh');

@$core.Deprecated('Use streamContentsDescriptor instead')
const StreamContents$json = {
  '1': 'StreamContents',
  '2': [
    {
      '1': 'items',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.connectrpc.conformance.v1.StreamContents.StreamItem',
      '10': 'items'
    },
  ],
  '3': [StreamContents_StreamItem$json],
};

@$core.Deprecated('Use streamContentsDescriptor instead')
const StreamContents_StreamItem$json = {
  '1': 'StreamItem',
  '2': [
    {'1': 'flags', '3': 1, '4': 1, '5': 13, '10': 'flags'},
    {
      '1': 'length',
      '3': 2,
      '4': 1,
      '5': 13,
      '9': 0,
      '10': 'length',
      '17': true
    },
    {
      '1': 'payload',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.connectrpc.conformance.v1.MessageContents',
      '10': 'payload'
    },
  ],
  '8': [
    {'1': '_length'},
  ],
};

/// Descriptor for `StreamContents`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamContentsDescriptor = $convert.base64Decode(
    'Cg5TdHJlYW1Db250ZW50cxJKCgVpdGVtcxgBIAMoCzI0LmNvbm5lY3RycGMuY29uZm9ybWFuY2'
    'UudjEuU3RyZWFtQ29udGVudHMuU3RyZWFtSXRlbVIFaXRlbXMakAEKClN0cmVhbUl0ZW0SFAoF'
    'ZmxhZ3MYASABKA1SBWZsYWdzEhsKBmxlbmd0aBgCIAEoDUgAUgZsZW5ndGiIAQESRAoHcGF5bG'
    '9hZBgDIAEoCzIqLmNvbm5lY3RycGMuY29uZm9ybWFuY2UudjEuTWVzc2FnZUNvbnRlbnRzUgdw'
    'YXlsb2FkQgkKB19sZW5ndGg=');

@$core.Deprecated('Use rawHTTPResponseDescriptor instead')
const RawHTTPResponse$json = {
  '1': 'RawHTTPResponse',
  '2': [
    {'1': 'status_code', '3': 1, '4': 1, '5': 13, '10': 'statusCode'},
    {
      '1': 'headers',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.connectrpc.conformance.v1.Header',
      '10': 'headers'
    },
    {
      '1': 'unary',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.connectrpc.conformance.v1.MessageContents',
      '9': 0,
      '10': 'unary'
    },
    {
      '1': 'stream',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.connectrpc.conformance.v1.StreamContents',
      '9': 0,
      '10': 'stream'
    },
    {
      '1': 'trailers',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.connectrpc.conformance.v1.Header',
      '10': 'trailers'
    },
  ],
  '8': [
    {'1': 'body'},
  ],
};

/// Descriptor for `RawHTTPResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rawHTTPResponseDescriptor = $convert.base64Decode(
    'Cg9SYXdIVFRQUmVzcG9uc2USHwoLc3RhdHVzX2NvZGUYASABKA1SCnN0YXR1c0NvZGUSOwoHaG'
    'VhZGVycxgCIAMoCzIhLmNvbm5lY3RycGMuY29uZm9ybWFuY2UudjEuSGVhZGVyUgdoZWFkZXJz'
    'EkIKBXVuYXJ5GAMgASgLMiouY29ubmVjdHJwYy5jb25mb3JtYW5jZS52MS5NZXNzYWdlQ29udG'
    'VudHNIAFIFdW5hcnkSQwoGc3RyZWFtGAQgASgLMikuY29ubmVjdHJwYy5jb25mb3JtYW5jZS52'
    'MS5TdHJlYW1Db250ZW50c0gAUgZzdHJlYW0SPQoIdHJhaWxlcnMYBSADKAsyIS5jb25uZWN0cn'
    'BjLmNvbmZvcm1hbmNlLnYxLkhlYWRlclIIdHJhaWxlcnNCBgoEYm9keQ==');

const $core.Map<$core.String, $core.dynamic> ConformanceServiceBase$json = {
  '1': 'ConformanceService',
  '2': [
    {
      '1': 'Unary',
      '2': '.connectrpc.conformance.v1.UnaryRequest',
      '3': '.connectrpc.conformance.v1.UnaryResponse'
    },
    {
      '1': 'ServerStream',
      '2': '.connectrpc.conformance.v1.ServerStreamRequest',
      '3': '.connectrpc.conformance.v1.ServerStreamResponse',
      '6': true
    },
    {
      '1': 'ClientStream',
      '2': '.connectrpc.conformance.v1.ClientStreamRequest',
      '3': '.connectrpc.conformance.v1.ClientStreamResponse',
      '5': true
    },
    {
      '1': 'BidiStream',
      '2': '.connectrpc.conformance.v1.BidiStreamRequest',
      '3': '.connectrpc.conformance.v1.BidiStreamResponse',
      '5': true,
      '6': true
    },
    {
      '1': 'Unimplemented',
      '2': '.connectrpc.conformance.v1.UnimplementedRequest',
      '3': '.connectrpc.conformance.v1.UnimplementedResponse'
    },
    {
      '1': 'IdempotentUnary',
      '2': '.connectrpc.conformance.v1.IdempotentUnaryRequest',
      '3': '.connectrpc.conformance.v1.IdempotentUnaryResponse',
      '4': {'34': 1},
    },
  ],
};

@$core.Deprecated('Use conformanceServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    ConformanceServiceBase$messageJson = {
  '.connectrpc.conformance.v1.UnaryRequest': UnaryRequest$json,
  '.connectrpc.conformance.v1.UnaryResponseDefinition':
      UnaryResponseDefinition$json,
  '.connectrpc.conformance.v1.Header': Header$json,
  '.connectrpc.conformance.v1.Error': Error$json,
  '.google.protobuf.Any': $0.Any$json,
  '.connectrpc.conformance.v1.RawHTTPResponse': RawHTTPResponse$json,
  '.connectrpc.conformance.v1.MessageContents': MessageContents$json,
  '.connectrpc.conformance.v1.StreamContents': StreamContents$json,
  '.connectrpc.conformance.v1.StreamContents.StreamItem':
      StreamContents_StreamItem$json,
  '.connectrpc.conformance.v1.UnaryResponse': UnaryResponse$json,
  '.connectrpc.conformance.v1.ConformancePayload': ConformancePayload$json,
  '.connectrpc.conformance.v1.ConformancePayload.RequestInfo':
      ConformancePayload_RequestInfo$json,
  '.connectrpc.conformance.v1.ConformancePayload.ConnectGetInfo':
      ConformancePayload_ConnectGetInfo$json,
  '.connectrpc.conformance.v1.ServerStreamRequest': ServerStreamRequest$json,
  '.connectrpc.conformance.v1.StreamResponseDefinition':
      StreamResponseDefinition$json,
  '.connectrpc.conformance.v1.ServerStreamResponse': ServerStreamResponse$json,
  '.connectrpc.conformance.v1.ClientStreamRequest': ClientStreamRequest$json,
  '.connectrpc.conformance.v1.ClientStreamResponse': ClientStreamResponse$json,
  '.connectrpc.conformance.v1.BidiStreamRequest': BidiStreamRequest$json,
  '.connectrpc.conformance.v1.BidiStreamResponse': BidiStreamResponse$json,
  '.connectrpc.conformance.v1.UnimplementedRequest': UnimplementedRequest$json,
  '.connectrpc.conformance.v1.UnimplementedResponse':
      UnimplementedResponse$json,
  '.connectrpc.conformance.v1.IdempotentUnaryRequest':
      IdempotentUnaryRequest$json,
  '.connectrpc.conformance.v1.IdempotentUnaryResponse':
      IdempotentUnaryResponse$json,
};

/// Descriptor for `ConformanceService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List conformanceServiceDescriptor = $convert.base64Decode(
    'ChJDb25mb3JtYW5jZVNlcnZpY2USWgoFVW5hcnkSJy5jb25uZWN0cnBjLmNvbmZvcm1hbmNlLn'
    'YxLlVuYXJ5UmVxdWVzdBooLmNvbm5lY3RycGMuY29uZm9ybWFuY2UudjEuVW5hcnlSZXNwb25z'
    'ZRJxCgxTZXJ2ZXJTdHJlYW0SLi5jb25uZWN0cnBjLmNvbmZvcm1hbmNlLnYxLlNlcnZlclN0cm'
    'VhbVJlcXVlc3QaLy5jb25uZWN0cnBjLmNvbmZvcm1hbmNlLnYxLlNlcnZlclN0cmVhbVJlc3Bv'
    'bnNlMAEScQoMQ2xpZW50U3RyZWFtEi4uY29ubmVjdHJwYy5jb25mb3JtYW5jZS52MS5DbGllbn'
    'RTdHJlYW1SZXF1ZXN0Gi8uY29ubmVjdHJwYy5jb25mb3JtYW5jZS52MS5DbGllbnRTdHJlYW1S'
    'ZXNwb25zZSgBEm0KCkJpZGlTdHJlYW0SLC5jb25uZWN0cnBjLmNvbmZvcm1hbmNlLnYxLkJpZG'
    'lTdHJlYW1SZXF1ZXN0Gi0uY29ubmVjdHJwYy5jb25mb3JtYW5jZS52MS5CaWRpU3RyZWFtUmVz'
    'cG9uc2UoATABEnIKDVVuaW1wbGVtZW50ZWQSLy5jb25uZWN0cnBjLmNvbmZvcm1hbmNlLnYxLl'
    'VuaW1wbGVtZW50ZWRSZXF1ZXN0GjAuY29ubmVjdHJwYy5jb25mb3JtYW5jZS52MS5VbmltcGxl'
    'bWVudGVkUmVzcG9uc2USfQoPSWRlbXBvdGVudFVuYXJ5EjEuY29ubmVjdHJwYy5jb25mb3JtYW'
    '5jZS52MS5JZGVtcG90ZW50VW5hcnlSZXF1ZXN0GjIuY29ubmVjdHJwYy5jb25mb3JtYW5jZS52'
    'MS5JZGVtcG90ZW50VW5hcnlSZXNwb25zZSIDkAIB');
