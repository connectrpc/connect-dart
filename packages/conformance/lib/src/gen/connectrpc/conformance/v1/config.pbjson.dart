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

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use hTTPVersionDescriptor instead')
const HTTPVersion$json = {
  '1': 'HTTPVersion',
  '2': [
    {'1': 'HTTP_VERSION_UNSPECIFIED', '2': 0},
    {'1': 'HTTP_VERSION_1', '2': 1},
    {'1': 'HTTP_VERSION_2', '2': 2},
    {'1': 'HTTP_VERSION_3', '2': 3},
  ],
};

/// Descriptor for `HTTPVersion`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List hTTPVersionDescriptor = $convert.base64Decode(
    'CgtIVFRQVmVyc2lvbhIcChhIVFRQX1ZFUlNJT05fVU5TUEVDSUZJRUQQABISCg5IVFRQX1ZFUl'
    'NJT05fMRABEhIKDkhUVFBfVkVSU0lPTl8yEAISEgoOSFRUUF9WRVJTSU9OXzMQAw==');

@$core.Deprecated('Use protocolDescriptor instead')
const Protocol$json = {
  '1': 'Protocol',
  '2': [
    {'1': 'PROTOCOL_UNSPECIFIED', '2': 0},
    {'1': 'PROTOCOL_CONNECT', '2': 1},
    {'1': 'PROTOCOL_GRPC', '2': 2},
    {'1': 'PROTOCOL_GRPC_WEB', '2': 3},
  ],
};

/// Descriptor for `Protocol`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List protocolDescriptor = $convert.base64Decode(
    'CghQcm90b2NvbBIYChRQUk9UT0NPTF9VTlNQRUNJRklFRBAAEhQKEFBST1RPQ09MX0NPTk5FQ1'
    'QQARIRCg1QUk9UT0NPTF9HUlBDEAISFQoRUFJPVE9DT0xfR1JQQ19XRUIQAw==');

@$core.Deprecated('Use codecDescriptor instead')
const Codec$json = {
  '1': 'Codec',
  '2': [
    {'1': 'CODEC_UNSPECIFIED', '2': 0},
    {'1': 'CODEC_PROTO', '2': 1},
    {'1': 'CODEC_JSON', '2': 2},
    {
      '1': 'CODEC_TEXT',
      '2': 3,
      '3': {'1': true},
    },
  ],
};

/// Descriptor for `Codec`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List codecDescriptor = $convert.base64Decode(
    'CgVDb2RlYxIVChFDT0RFQ19VTlNQRUNJRklFRBAAEg8KC0NPREVDX1BST1RPEAESDgoKQ09ERU'
    'NfSlNPThACEhIKCkNPREVDX1RFWFQQAxoCCAE=');

@$core.Deprecated('Use compressionDescriptor instead')
const Compression$json = {
  '1': 'Compression',
  '2': [
    {'1': 'COMPRESSION_UNSPECIFIED', '2': 0},
    {'1': 'COMPRESSION_IDENTITY', '2': 1},
    {'1': 'COMPRESSION_GZIP', '2': 2},
    {'1': 'COMPRESSION_BR', '2': 3},
    {'1': 'COMPRESSION_ZSTD', '2': 4},
    {'1': 'COMPRESSION_DEFLATE', '2': 5},
    {'1': 'COMPRESSION_SNAPPY', '2': 6},
  ],
};

/// Descriptor for `Compression`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List compressionDescriptor = $convert.base64Decode(
    'CgtDb21wcmVzc2lvbhIbChdDT01QUkVTU0lPTl9VTlNQRUNJRklFRBAAEhgKFENPTVBSRVNTSU'
    '9OX0lERU5USVRZEAESFAoQQ09NUFJFU1NJT05fR1pJUBACEhIKDkNPTVBSRVNTSU9OX0JSEAMS'
    'FAoQQ09NUFJFU1NJT05fWlNURBAEEhcKE0NPTVBSRVNTSU9OX0RFRkxBVEUQBRIWChJDT01QUk'
    'VTU0lPTl9TTkFQUFkQBg==');

@$core.Deprecated('Use streamTypeDescriptor instead')
const StreamType$json = {
  '1': 'StreamType',
  '2': [
    {'1': 'STREAM_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'STREAM_TYPE_UNARY', '2': 1},
    {'1': 'STREAM_TYPE_CLIENT_STREAM', '2': 2},
    {'1': 'STREAM_TYPE_SERVER_STREAM', '2': 3},
    {'1': 'STREAM_TYPE_HALF_DUPLEX_BIDI_STREAM', '2': 4},
    {'1': 'STREAM_TYPE_FULL_DUPLEX_BIDI_STREAM', '2': 5},
  ],
};

/// Descriptor for `StreamType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List streamTypeDescriptor = $convert.base64Decode(
    'CgpTdHJlYW1UeXBlEhsKF1NUUkVBTV9UWVBFX1VOU1BFQ0lGSUVEEAASFQoRU1RSRUFNX1RZUE'
    'VfVU5BUlkQARIdChlTVFJFQU1fVFlQRV9DTElFTlRfU1RSRUFNEAISHQoZU1RSRUFNX1RZUEVf'
    'U0VSVkVSX1NUUkVBTRADEicKI1NUUkVBTV9UWVBFX0hBTEZfRFVQTEVYX0JJRElfU1RSRUFNEA'
    'QSJwojU1RSRUFNX1RZUEVfRlVMTF9EVVBMRVhfQklESV9TVFJFQU0QBQ==');

@$core.Deprecated('Use codeDescriptor instead')
const Code$json = {
  '1': 'Code',
  '2': [
    {'1': 'CODE_UNSPECIFIED', '2': 0},
    {'1': 'CODE_CANCELED', '2': 1},
    {'1': 'CODE_UNKNOWN', '2': 2},
    {'1': 'CODE_INVALID_ARGUMENT', '2': 3},
    {'1': 'CODE_DEADLINE_EXCEEDED', '2': 4},
    {'1': 'CODE_NOT_FOUND', '2': 5},
    {'1': 'CODE_ALREADY_EXISTS', '2': 6},
    {'1': 'CODE_PERMISSION_DENIED', '2': 7},
    {'1': 'CODE_RESOURCE_EXHAUSTED', '2': 8},
    {'1': 'CODE_FAILED_PRECONDITION', '2': 9},
    {'1': 'CODE_ABORTED', '2': 10},
    {'1': 'CODE_OUT_OF_RANGE', '2': 11},
    {'1': 'CODE_UNIMPLEMENTED', '2': 12},
    {'1': 'CODE_INTERNAL', '2': 13},
    {'1': 'CODE_UNAVAILABLE', '2': 14},
    {'1': 'CODE_DATA_LOSS', '2': 15},
    {'1': 'CODE_UNAUTHENTICATED', '2': 16},
  ],
};

/// Descriptor for `Code`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List codeDescriptor = $convert.base64Decode(
    'CgRDb2RlEhQKEENPREVfVU5TUEVDSUZJRUQQABIRCg1DT0RFX0NBTkNFTEVEEAESEAoMQ09ERV'
    '9VTktOT1dOEAISGQoVQ09ERV9JTlZBTElEX0FSR1VNRU5UEAMSGgoWQ09ERV9ERUFETElORV9F'
    'WENFRURFRBAEEhIKDkNPREVfTk9UX0ZPVU5EEAUSFwoTQ09ERV9BTFJFQURZX0VYSVNUUxAGEh'
    'oKFkNPREVfUEVSTUlTU0lPTl9ERU5JRUQQBxIbChdDT0RFX1JFU09VUkNFX0VYSEFVU1RFRBAI'
    'EhwKGENPREVfRkFJTEVEX1BSRUNPTkRJVElPThAJEhAKDENPREVfQUJPUlRFRBAKEhUKEUNPRE'
    'VfT1VUX09GX1JBTkdFEAsSFgoSQ09ERV9VTklNUExFTUVOVEVEEAwSEQoNQ09ERV9JTlRFUk5B'
    'TBANEhQKEENPREVfVU5BVkFJTEFCTEUQDhISCg5DT0RFX0RBVEFfTE9TUxAPEhgKFENPREVfVU'
    '5BVVRIRU5USUNBVEVEEBA=');

@$core.Deprecated('Use configDescriptor instead')
const Config$json = {
  '1': 'Config',
  '2': [
    {
      '1': 'features',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.connectrpc.conformance.v1.Features',
      '10': 'features'
    },
    {
      '1': 'include_cases',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.connectrpc.conformance.v1.ConfigCase',
      '10': 'includeCases'
    },
    {
      '1': 'exclude_cases',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.connectrpc.conformance.v1.ConfigCase',
      '10': 'excludeCases'
    },
  ],
};

/// Descriptor for `Config`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List configDescriptor = $convert.base64Decode(
    'CgZDb25maWcSPwoIZmVhdHVyZXMYASABKAsyIy5jb25uZWN0cnBjLmNvbmZvcm1hbmNlLnYxLk'
    'ZlYXR1cmVzUghmZWF0dXJlcxJKCg1pbmNsdWRlX2Nhc2VzGAIgAygLMiUuY29ubmVjdHJwYy5j'
    'b25mb3JtYW5jZS52MS5Db25maWdDYXNlUgxpbmNsdWRlQ2FzZXMSSgoNZXhjbHVkZV9jYXNlcx'
    'gDIAMoCzIlLmNvbm5lY3RycGMuY29uZm9ybWFuY2UudjEuQ29uZmlnQ2FzZVIMZXhjbHVkZUNh'
    'c2Vz');

@$core.Deprecated('Use featuresDescriptor instead')
const Features$json = {
  '1': 'Features',
  '2': [
    {
      '1': 'versions',
      '3': 1,
      '4': 3,
      '5': 14,
      '6': '.connectrpc.conformance.v1.HTTPVersion',
      '10': 'versions'
    },
    {
      '1': 'protocols',
      '3': 2,
      '4': 3,
      '5': 14,
      '6': '.connectrpc.conformance.v1.Protocol',
      '10': 'protocols'
    },
    {
      '1': 'codecs',
      '3': 3,
      '4': 3,
      '5': 14,
      '6': '.connectrpc.conformance.v1.Codec',
      '10': 'codecs'
    },
    {
      '1': 'compressions',
      '3': 4,
      '4': 3,
      '5': 14,
      '6': '.connectrpc.conformance.v1.Compression',
      '10': 'compressions'
    },
    {
      '1': 'stream_types',
      '3': 5,
      '4': 3,
      '5': 14,
      '6': '.connectrpc.conformance.v1.StreamType',
      '10': 'streamTypes'
    },
    {
      '1': 'supports_h2c',
      '3': 6,
      '4': 1,
      '5': 8,
      '9': 0,
      '10': 'supportsH2c',
      '17': true
    },
    {
      '1': 'supports_tls',
      '3': 7,
      '4': 1,
      '5': 8,
      '9': 1,
      '10': 'supportsTls',
      '17': true
    },
    {
      '1': 'supports_tls_client_certs',
      '3': 8,
      '4': 1,
      '5': 8,
      '9': 2,
      '10': 'supportsTlsClientCerts',
      '17': true
    },
    {
      '1': 'supports_trailers',
      '3': 9,
      '4': 1,
      '5': 8,
      '9': 3,
      '10': 'supportsTrailers',
      '17': true
    },
    {
      '1': 'supports_half_duplex_bidi_over_http1',
      '3': 10,
      '4': 1,
      '5': 8,
      '9': 4,
      '10': 'supportsHalfDuplexBidiOverHttp1',
      '17': true
    },
    {
      '1': 'supports_connect_get',
      '3': 11,
      '4': 1,
      '5': 8,
      '9': 5,
      '10': 'supportsConnectGet',
      '17': true
    },
    {
      '1': 'supports_message_receive_limit',
      '3': 12,
      '4': 1,
      '5': 8,
      '9': 6,
      '10': 'supportsMessageReceiveLimit',
      '17': true
    },
  ],
  '8': [
    {'1': '_supports_h2c'},
    {'1': '_supports_tls'},
    {'1': '_supports_tls_client_certs'},
    {'1': '_supports_trailers'},
    {'1': '_supports_half_duplex_bidi_over_http1'},
    {'1': '_supports_connect_get'},
    {'1': '_supports_message_receive_limit'},
  ],
};

/// Descriptor for `Features`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List featuresDescriptor = $convert.base64Decode(
    'CghGZWF0dXJlcxJCCgh2ZXJzaW9ucxgBIAMoDjImLmNvbm5lY3RycGMuY29uZm9ybWFuY2Uudj'
    'EuSFRUUFZlcnNpb25SCHZlcnNpb25zEkEKCXByb3RvY29scxgCIAMoDjIjLmNvbm5lY3RycGMu'
    'Y29uZm9ybWFuY2UudjEuUHJvdG9jb2xSCXByb3RvY29scxI4CgZjb2RlY3MYAyADKA4yIC5jb2'
    '5uZWN0cnBjLmNvbmZvcm1hbmNlLnYxLkNvZGVjUgZjb2RlY3MSSgoMY29tcHJlc3Npb25zGAQg'
    'AygOMiYuY29ubmVjdHJwYy5jb25mb3JtYW5jZS52MS5Db21wcmVzc2lvblIMY29tcHJlc3Npb2'
    '5zEkgKDHN0cmVhbV90eXBlcxgFIAMoDjIlLmNvbm5lY3RycGMuY29uZm9ybWFuY2UudjEuU3Ry'
    'ZWFtVHlwZVILc3RyZWFtVHlwZXMSJgoMc3VwcG9ydHNfaDJjGAYgASgISABSC3N1cHBvcnRzSD'
    'JjiAEBEiYKDHN1cHBvcnRzX3RscxgHIAEoCEgBUgtzdXBwb3J0c1Rsc4gBARI+ChlzdXBwb3J0'
    'c190bHNfY2xpZW50X2NlcnRzGAggASgISAJSFnN1cHBvcnRzVGxzQ2xpZW50Q2VydHOIAQESMA'
    'oRc3VwcG9ydHNfdHJhaWxlcnMYCSABKAhIA1IQc3VwcG9ydHNUcmFpbGVyc4gBARJSCiRzdXBw'
    'b3J0c19oYWxmX2R1cGxleF9iaWRpX292ZXJfaHR0cDEYCiABKAhIBFIfc3VwcG9ydHNIYWxmRH'
    'VwbGV4QmlkaU92ZXJIdHRwMYgBARI1ChRzdXBwb3J0c19jb25uZWN0X2dldBgLIAEoCEgFUhJz'
    'dXBwb3J0c0Nvbm5lY3RHZXSIAQESSAoec3VwcG9ydHNfbWVzc2FnZV9yZWNlaXZlX2xpbWl0GA'
    'wgASgISAZSG3N1cHBvcnRzTWVzc2FnZVJlY2VpdmVMaW1pdIgBAUIPCg1fc3VwcG9ydHNfaDJj'
    'Qg8KDV9zdXBwb3J0c190bHNCHAoaX3N1cHBvcnRzX3Rsc19jbGllbnRfY2VydHNCFAoSX3N1cH'
    'BvcnRzX3RyYWlsZXJzQicKJV9zdXBwb3J0c19oYWxmX2R1cGxleF9iaWRpX292ZXJfaHR0cDFC'
    'FwoVX3N1cHBvcnRzX2Nvbm5lY3RfZ2V0QiEKH19zdXBwb3J0c19tZXNzYWdlX3JlY2VpdmVfbG'
    'ltaXQ=');

@$core.Deprecated('Use configCaseDescriptor instead')
const ConfigCase$json = {
  '1': 'ConfigCase',
  '2': [
    {
      '1': 'version',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.connectrpc.conformance.v1.HTTPVersion',
      '10': 'version'
    },
    {
      '1': 'protocol',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.connectrpc.conformance.v1.Protocol',
      '10': 'protocol'
    },
    {
      '1': 'codec',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.connectrpc.conformance.v1.Codec',
      '10': 'codec'
    },
    {
      '1': 'compression',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.connectrpc.conformance.v1.Compression',
      '10': 'compression'
    },
    {
      '1': 'stream_type',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.connectrpc.conformance.v1.StreamType',
      '10': 'streamType'
    },
    {
      '1': 'use_tls',
      '3': 6,
      '4': 1,
      '5': 8,
      '9': 0,
      '10': 'useTls',
      '17': true
    },
    {
      '1': 'use_tls_client_certs',
      '3': 7,
      '4': 1,
      '5': 8,
      '9': 1,
      '10': 'useTlsClientCerts',
      '17': true
    },
    {
      '1': 'use_message_receive_limit',
      '3': 8,
      '4': 1,
      '5': 8,
      '9': 2,
      '10': 'useMessageReceiveLimit',
      '17': true
    },
  ],
  '8': [
    {'1': '_use_tls'},
    {'1': '_use_tls_client_certs'},
    {'1': '_use_message_receive_limit'},
  ],
};

/// Descriptor for `ConfigCase`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List configCaseDescriptor = $convert.base64Decode(
    'CgpDb25maWdDYXNlEkAKB3ZlcnNpb24YASABKA4yJi5jb25uZWN0cnBjLmNvbmZvcm1hbmNlLn'
    'YxLkhUVFBWZXJzaW9uUgd2ZXJzaW9uEj8KCHByb3RvY29sGAIgASgOMiMuY29ubmVjdHJwYy5j'
    'b25mb3JtYW5jZS52MS5Qcm90b2NvbFIIcHJvdG9jb2wSNgoFY29kZWMYAyABKA4yIC5jb25uZW'
    'N0cnBjLmNvbmZvcm1hbmNlLnYxLkNvZGVjUgVjb2RlYxJICgtjb21wcmVzc2lvbhgEIAEoDjIm'
    'LmNvbm5lY3RycGMuY29uZm9ybWFuY2UudjEuQ29tcHJlc3Npb25SC2NvbXByZXNzaW9uEkYKC3'
    'N0cmVhbV90eXBlGAUgASgOMiUuY29ubmVjdHJwYy5jb25mb3JtYW5jZS52MS5TdHJlYW1UeXBl'
    'UgpzdHJlYW1UeXBlEhwKB3VzZV90bHMYBiABKAhIAFIGdXNlVGxziAEBEjQKFHVzZV90bHNfY2'
    'xpZW50X2NlcnRzGAcgASgISAFSEXVzZVRsc0NsaWVudENlcnRziAEBEj4KGXVzZV9tZXNzYWdl'
    'X3JlY2VpdmVfbGltaXQYCCABKAhIAlIWdXNlTWVzc2FnZVJlY2VpdmVMaW1pdIgBAUIKCghfdX'
    'NlX3Rsc0IXChVfdXNlX3Rsc19jbGllbnRfY2VydHNCHAoaX3VzZV9tZXNzYWdlX3JlY2VpdmVf'
    'bGltaXQ=');

@$core.Deprecated('Use tLSCredsDescriptor instead')
const TLSCreds$json = {
  '1': 'TLSCreds',
  '2': [
    {'1': 'cert', '3': 1, '4': 1, '5': 12, '10': 'cert'},
    {'1': 'key', '3': 2, '4': 1, '5': 12, '10': 'key'},
  ],
};

/// Descriptor for `TLSCreds`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tLSCredsDescriptor = $convert.base64Decode(
    'CghUTFNDcmVkcxISCgRjZXJ0GAEgASgMUgRjZXJ0EhAKA2tleRgCIAEoDFIDa2V5');
