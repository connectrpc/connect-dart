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
//  source: connectrpc/conformance/v1/server_compat.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use serverCompatRequestDescriptor instead')
const ServerCompatRequest$json = {
  '1': 'ServerCompatRequest',
  '2': [
    {
      '1': 'protocol',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.connectrpc.conformance.v1.Protocol',
      '10': 'protocol'
    },
    {
      '1': 'http_version',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.connectrpc.conformance.v1.HTTPVersion',
      '10': 'httpVersion'
    },
    {'1': 'use_tls', '3': 4, '4': 1, '5': 8, '10': 'useTls'},
    {'1': 'client_tls_cert', '3': 5, '4': 1, '5': 12, '10': 'clientTlsCert'},
    {
      '1': 'message_receive_limit',
      '3': 6,
      '4': 1,
      '5': 13,
      '10': 'messageReceiveLimit'
    },
    {
      '1': 'server_creds',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.connectrpc.conformance.v1.TLSCreds',
      '10': 'serverCreds'
    },
  ],
};

/// Descriptor for `ServerCompatRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serverCompatRequestDescriptor = $convert.base64Decode(
    'ChNTZXJ2ZXJDb21wYXRSZXF1ZXN0Ej8KCHByb3RvY29sGAEgASgOMiMuY29ubmVjdHJwYy5jb2'
    '5mb3JtYW5jZS52MS5Qcm90b2NvbFIIcHJvdG9jb2wSSQoMaHR0cF92ZXJzaW9uGAIgASgOMiYu'
    'Y29ubmVjdHJwYy5jb25mb3JtYW5jZS52MS5IVFRQVmVyc2lvblILaHR0cFZlcnNpb24SFwoHdX'
    'NlX3RscxgEIAEoCFIGdXNlVGxzEiYKD2NsaWVudF90bHNfY2VydBgFIAEoDFINY2xpZW50VGxz'
    'Q2VydBIyChVtZXNzYWdlX3JlY2VpdmVfbGltaXQYBiABKA1SE21lc3NhZ2VSZWNlaXZlTGltaX'
    'QSRgoMc2VydmVyX2NyZWRzGAcgASgLMiMuY29ubmVjdHJwYy5jb25mb3JtYW5jZS52MS5UTFND'
    'cmVkc1ILc2VydmVyQ3JlZHM=');

@$core.Deprecated('Use serverCompatResponseDescriptor instead')
const ServerCompatResponse$json = {
  '1': 'ServerCompatResponse',
  '2': [
    {'1': 'host', '3': 1, '4': 1, '5': 9, '10': 'host'},
    {'1': 'port', '3': 2, '4': 1, '5': 13, '10': 'port'},
    {'1': 'pem_cert', '3': 3, '4': 1, '5': 12, '10': 'pemCert'},
  ],
};

/// Descriptor for `ServerCompatResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serverCompatResponseDescriptor = $convert.base64Decode(
    'ChRTZXJ2ZXJDb21wYXRSZXNwb25zZRISCgRob3N0GAEgASgJUgRob3N0EhIKBHBvcnQYAiABKA'
    '1SBHBvcnQSGQoIcGVtX2NlcnQYAyABKAxSB3BlbUNlcnQ=');
