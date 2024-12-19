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

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use clientCompatRequestDescriptor instead')
const ClientCompatRequest$json = {
  '1': 'ClientCompatRequest',
  '2': [
    {'1': 'test_name', '3': 1, '4': 1, '5': 9, '10': 'testName'},
    {
      '1': 'http_version',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.connectrpc.conformance.v1.HTTPVersion',
      '10': 'httpVersion'
    },
    {
      '1': 'protocol',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.connectrpc.conformance.v1.Protocol',
      '10': 'protocol'
    },
    {
      '1': 'codec',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.connectrpc.conformance.v1.Codec',
      '10': 'codec'
    },
    {
      '1': 'compression',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.connectrpc.conformance.v1.Compression',
      '10': 'compression'
    },
    {'1': 'host', '3': 6, '4': 1, '5': 9, '10': 'host'},
    {'1': 'port', '3': 7, '4': 1, '5': 13, '10': 'port'},
    {'1': 'server_tls_cert', '3': 8, '4': 1, '5': 12, '10': 'serverTlsCert'},
    {
      '1': 'client_tls_creds',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.connectrpc.conformance.v1.TLSCreds',
      '10': 'clientTlsCreds'
    },
    {
      '1': 'message_receive_limit',
      '3': 10,
      '4': 1,
      '5': 13,
      '10': 'messageReceiveLimit'
    },
    {
      '1': 'service',
      '3': 11,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'service',
      '17': true
    },
    {
      '1': 'method',
      '3': 12,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'method',
      '17': true
    },
    {
      '1': 'stream_type',
      '3': 13,
      '4': 1,
      '5': 14,
      '6': '.connectrpc.conformance.v1.StreamType',
      '10': 'streamType'
    },
    {
      '1': 'use_get_http_method',
      '3': 14,
      '4': 1,
      '5': 8,
      '10': 'useGetHttpMethod'
    },
    {
      '1': 'request_headers',
      '3': 15,
      '4': 3,
      '5': 11,
      '6': '.connectrpc.conformance.v1.Header',
      '10': 'requestHeaders'
    },
    {
      '1': 'request_messages',
      '3': 16,
      '4': 3,
      '5': 11,
      '6': '.google.protobuf.Any',
      '10': 'requestMessages'
    },
    {
      '1': 'timeout_ms',
      '3': 17,
      '4': 1,
      '5': 13,
      '9': 2,
      '10': 'timeoutMs',
      '17': true
    },
    {'1': 'request_delay_ms', '3': 18, '4': 1, '5': 13, '10': 'requestDelayMs'},
    {
      '1': 'cancel',
      '3': 19,
      '4': 1,
      '5': 11,
      '6': '.connectrpc.conformance.v1.ClientCompatRequest.Cancel',
      '10': 'cancel'
    },
    {
      '1': 'raw_request',
      '3': 20,
      '4': 1,
      '5': 11,
      '6': '.connectrpc.conformance.v1.RawHTTPRequest',
      '10': 'rawRequest'
    },
  ],
  '3': [ClientCompatRequest_Cancel$json],
  '8': [
    {'1': '_service'},
    {'1': '_method'},
    {'1': '_timeout_ms'},
  ],
};

@$core.Deprecated('Use clientCompatRequestDescriptor instead')
const ClientCompatRequest_Cancel$json = {
  '1': 'Cancel',
  '2': [
    {
      '1': 'before_close_send',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Empty',
      '9': 0,
      '10': 'beforeCloseSend'
    },
    {
      '1': 'after_close_send_ms',
      '3': 2,
      '4': 1,
      '5': 13,
      '9': 0,
      '10': 'afterCloseSendMs'
    },
    {
      '1': 'after_num_responses',
      '3': 3,
      '4': 1,
      '5': 13,
      '9': 0,
      '10': 'afterNumResponses'
    },
  ],
  '8': [
    {'1': 'cancel_timing'},
  ],
};

/// Descriptor for `ClientCompatRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List clientCompatRequestDescriptor = $convert.base64Decode(
    'ChNDbGllbnRDb21wYXRSZXF1ZXN0EhsKCXRlc3RfbmFtZRgBIAEoCVIIdGVzdE5hbWUSSQoMaH'
    'R0cF92ZXJzaW9uGAIgASgOMiYuY29ubmVjdHJwYy5jb25mb3JtYW5jZS52MS5IVFRQVmVyc2lv'
    'blILaHR0cFZlcnNpb24SPwoIcHJvdG9jb2wYAyABKA4yIy5jb25uZWN0cnBjLmNvbmZvcm1hbm'
    'NlLnYxLlByb3RvY29sUghwcm90b2NvbBI2CgVjb2RlYxgEIAEoDjIgLmNvbm5lY3RycGMuY29u'
    'Zm9ybWFuY2UudjEuQ29kZWNSBWNvZGVjEkgKC2NvbXByZXNzaW9uGAUgASgOMiYuY29ubmVjdH'
    'JwYy5jb25mb3JtYW5jZS52MS5Db21wcmVzc2lvblILY29tcHJlc3Npb24SEgoEaG9zdBgGIAEo'
    'CVIEaG9zdBISCgRwb3J0GAcgASgNUgRwb3J0EiYKD3NlcnZlcl90bHNfY2VydBgIIAEoDFINc2'
    'VydmVyVGxzQ2VydBJNChBjbGllbnRfdGxzX2NyZWRzGAkgASgLMiMuY29ubmVjdHJwYy5jb25m'
    'b3JtYW5jZS52MS5UTFNDcmVkc1IOY2xpZW50VGxzQ3JlZHMSMgoVbWVzc2FnZV9yZWNlaXZlX2'
    'xpbWl0GAogASgNUhNtZXNzYWdlUmVjZWl2ZUxpbWl0Eh0KB3NlcnZpY2UYCyABKAlIAFIHc2Vy'
    'dmljZYgBARIbCgZtZXRob2QYDCABKAlIAVIGbWV0aG9kiAEBEkYKC3N0cmVhbV90eXBlGA0gAS'
    'gOMiUuY29ubmVjdHJwYy5jb25mb3JtYW5jZS52MS5TdHJlYW1UeXBlUgpzdHJlYW1UeXBlEi0K'
    'E3VzZV9nZXRfaHR0cF9tZXRob2QYDiABKAhSEHVzZUdldEh0dHBNZXRob2QSSgoPcmVxdWVzdF'
    '9oZWFkZXJzGA8gAygLMiEuY29ubmVjdHJwYy5jb25mb3JtYW5jZS52MS5IZWFkZXJSDnJlcXVl'
    'c3RIZWFkZXJzEj8KEHJlcXVlc3RfbWVzc2FnZXMYECADKAsyFC5nb29nbGUucHJvdG9idWYuQW'
    '55Ug9yZXF1ZXN0TWVzc2FnZXMSIgoKdGltZW91dF9tcxgRIAEoDUgCUgl0aW1lb3V0TXOIAQES'
    'KAoQcmVxdWVzdF9kZWxheV9tcxgSIAEoDVIOcmVxdWVzdERlbGF5TXMSTQoGY2FuY2VsGBMgAS'
    'gLMjUuY29ubmVjdHJwYy5jb25mb3JtYW5jZS52MS5DbGllbnRDb21wYXRSZXF1ZXN0LkNhbmNl'
    'bFIGY2FuY2VsEkoKC3Jhd19yZXF1ZXN0GBQgASgLMikuY29ubmVjdHJwYy5jb25mb3JtYW5jZS'
    '52MS5SYXdIVFRQUmVxdWVzdFIKcmF3UmVxdWVzdBrCAQoGQ2FuY2VsEkQKEWJlZm9yZV9jbG9z'
    'ZV9zZW5kGAEgASgLMhYuZ29vZ2xlLnByb3RvYnVmLkVtcHR5SABSD2JlZm9yZUNsb3NlU2VuZB'
    'IvChNhZnRlcl9jbG9zZV9zZW5kX21zGAIgASgNSABSEGFmdGVyQ2xvc2VTZW5kTXMSMAoTYWZ0'
    'ZXJfbnVtX3Jlc3BvbnNlcxgDIAEoDUgAUhFhZnRlck51bVJlc3BvbnNlc0IPCg1jYW5jZWxfdG'
    'ltaW5nQgoKCF9zZXJ2aWNlQgkKB19tZXRob2RCDQoLX3RpbWVvdXRfbXM=');

@$core.Deprecated('Use clientCompatResponseDescriptor instead')
const ClientCompatResponse$json = {
  '1': 'ClientCompatResponse',
  '2': [
    {'1': 'test_name', '3': 1, '4': 1, '5': 9, '10': 'testName'},
    {
      '1': 'response',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.connectrpc.conformance.v1.ClientResponseResult',
      '9': 0,
      '10': 'response'
    },
    {
      '1': 'error',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.connectrpc.conformance.v1.ClientErrorResult',
      '9': 0,
      '10': 'error'
    },
  ],
  '8': [
    {'1': 'result'},
  ],
};

/// Descriptor for `ClientCompatResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List clientCompatResponseDescriptor = $convert.base64Decode(
    'ChRDbGllbnRDb21wYXRSZXNwb25zZRIbCgl0ZXN0X25hbWUYASABKAlSCHRlc3ROYW1lEk0KCH'
    'Jlc3BvbnNlGAIgASgLMi8uY29ubmVjdHJwYy5jb25mb3JtYW5jZS52MS5DbGllbnRSZXNwb25z'
    'ZVJlc3VsdEgAUghyZXNwb25zZRJECgVlcnJvchgDIAEoCzIsLmNvbm5lY3RycGMuY29uZm9ybW'
    'FuY2UudjEuQ2xpZW50RXJyb3JSZXN1bHRIAFIFZXJyb3JCCAoGcmVzdWx0');

@$core.Deprecated('Use clientResponseResultDescriptor instead')
const ClientResponseResult$json = {
  '1': 'ClientResponseResult',
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
      '1': 'payloads',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.connectrpc.conformance.v1.ConformancePayload',
      '10': 'payloads'
    },
    {
      '1': 'error',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.connectrpc.conformance.v1.Error',
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
      '1': 'num_unsent_requests',
      '3': 5,
      '4': 1,
      '5': 5,
      '10': 'numUnsentRequests'
    },
    {
      '1': 'http_status_code',
      '3': 6,
      '4': 1,
      '5': 5,
      '9': 0,
      '10': 'httpStatusCode',
      '17': true
    },
    {'1': 'feedback', '3': 7, '4': 3, '5': 9, '10': 'feedback'},
  ],
  '8': [
    {'1': '_http_status_code'},
  ],
};

/// Descriptor for `ClientResponseResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List clientResponseResultDescriptor = $convert.base64Decode(
    'ChRDbGllbnRSZXNwb25zZVJlc3VsdBJMChByZXNwb25zZV9oZWFkZXJzGAEgAygLMiEuY29ubm'
    'VjdHJwYy5jb25mb3JtYW5jZS52MS5IZWFkZXJSD3Jlc3BvbnNlSGVhZGVycxJJCghwYXlsb2Fk'
    'cxgCIAMoCzItLmNvbm5lY3RycGMuY29uZm9ybWFuY2UudjEuQ29uZm9ybWFuY2VQYXlsb2FkUg'
    'hwYXlsb2FkcxI2CgVlcnJvchgDIAEoCzIgLmNvbm5lY3RycGMuY29uZm9ybWFuY2UudjEuRXJy'
    'b3JSBWVycm9yEk4KEXJlc3BvbnNlX3RyYWlsZXJzGAQgAygLMiEuY29ubmVjdHJwYy5jb25mb3'
    'JtYW5jZS52MS5IZWFkZXJSEHJlc3BvbnNlVHJhaWxlcnMSLgoTbnVtX3Vuc2VudF9yZXF1ZXN0'
    'cxgFIAEoBVIRbnVtVW5zZW50UmVxdWVzdHMSLQoQaHR0cF9zdGF0dXNfY29kZRgGIAEoBUgAUg'
    '5odHRwU3RhdHVzQ29kZYgBARIaCghmZWVkYmFjaxgHIAMoCVIIZmVlZGJhY2tCEwoRX2h0dHBf'
    'c3RhdHVzX2NvZGU=');

@$core.Deprecated('Use clientErrorResultDescriptor instead')
const ClientErrorResult$json = {
  '1': 'ClientErrorResult',
  '2': [
    {'1': 'message', '3': 1, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `ClientErrorResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List clientErrorResultDescriptor = $convert.base64Decode(
    'ChFDbGllbnRFcnJvclJlc3VsdBIYCgdtZXNzYWdlGAEgASgJUgdtZXNzYWdl');

@$core.Deprecated('Use wireDetailsDescriptor instead')
const WireDetails$json = {
  '1': 'WireDetails',
  '2': [
    {
      '1': 'actual_status_code',
      '3': 1,
      '4': 1,
      '5': 5,
      '10': 'actualStatusCode'
    },
    {
      '1': 'connect_error_raw',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Struct',
      '10': 'connectErrorRaw'
    },
    {
      '1': 'actual_http_trailers',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.connectrpc.conformance.v1.Header',
      '10': 'actualHttpTrailers'
    },
    {
      '1': 'actual_grpcweb_trailers',
      '3': 4,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'actualGrpcwebTrailers',
      '17': true
    },
  ],
  '8': [
    {'1': '_actual_grpcweb_trailers'},
  ],
};

/// Descriptor for `WireDetails`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List wireDetailsDescriptor = $convert.base64Decode(
    'CgtXaXJlRGV0YWlscxIsChJhY3R1YWxfc3RhdHVzX2NvZGUYASABKAVSEGFjdHVhbFN0YXR1c0'
    'NvZGUSQwoRY29ubmVjdF9lcnJvcl9yYXcYAiABKAsyFy5nb29nbGUucHJvdG9idWYuU3RydWN0'
    'Ug9jb25uZWN0RXJyb3JSYXcSUwoUYWN0dWFsX2h0dHBfdHJhaWxlcnMYAyADKAsyIS5jb25uZW'
    'N0cnBjLmNvbmZvcm1hbmNlLnYxLkhlYWRlclISYWN0dWFsSHR0cFRyYWlsZXJzEjsKF2FjdHVh'
    'bF9ncnBjd2ViX3RyYWlsZXJzGAQgASgJSABSFWFjdHVhbEdycGN3ZWJUcmFpbGVyc4gBAUIaCh'
    'hfYWN0dWFsX2dycGN3ZWJfdHJhaWxlcnM=');
