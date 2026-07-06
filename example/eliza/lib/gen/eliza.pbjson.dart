// This is a generated file - do not edit.
//
// Generated from eliza.proto.

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

@$core.Deprecated('Use sayRequestDescriptor instead')
const SayRequest$json = {
  '1': 'SayRequest',
  '2': [
    {'1': 'sentence', '3': 1, '4': 1, '5': 9, '10': 'sentence'},
  ],
};

/// Descriptor for `SayRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sayRequestDescriptor = $convert
    .base64Decode('CgpTYXlSZXF1ZXN0EhoKCHNlbnRlbmNlGAEgASgJUghzZW50ZW5jZQ==');

@$core.Deprecated('Use sayResponseDescriptor instead')
const SayResponse$json = {
  '1': 'SayResponse',
  '2': [
    {'1': 'sentence', '3': 1, '4': 1, '5': 9, '10': 'sentence'},
  ],
};

/// Descriptor for `SayResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sayResponseDescriptor = $convert
    .base64Decode('CgtTYXlSZXNwb25zZRIaCghzZW50ZW5jZRgBIAEoCVIIc2VudGVuY2U=');

const $core.Map<$core.String, $core.dynamic> ElizaServiceBase$json = {
  '1': 'ElizaService',
  '2': [
    {
      '1': 'Say',
      '2': '.connectrpc.eliza.v1.SayRequest',
      '3': '.connectrpc.eliza.v1.SayResponse',
      '4': {}
    },
  ],
};

@$core.Deprecated('Use elizaServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    ElizaServiceBase$messageJson = {
  '.connectrpc.eliza.v1.SayRequest': SayRequest$json,
  '.connectrpc.eliza.v1.SayResponse': SayResponse$json,
};

/// Descriptor for `ElizaService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List elizaServiceDescriptor = $convert.base64Decode(
    'CgxFbGl6YVNlcnZpY2USSgoDU2F5Eh8uY29ubmVjdHJwYy5lbGl6YS52MS5TYXlSZXF1ZXN0Gi'
    'AuY29ubmVjdHJwYy5lbGl6YS52MS5TYXlSZXNwb25zZSIA');
