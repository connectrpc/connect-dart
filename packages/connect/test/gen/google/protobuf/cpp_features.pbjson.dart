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
// Generated from google/protobuf/cpp_features.proto.

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

@$core.Deprecated('Use cppFeaturesDescriptor instead')
const CppFeatures$json = {
  '1': 'CppFeatures',
  '2': [
    {
      '1': 'legacy_closed_enum',
      '3': 1,
      '4': 1,
      '5': 8,
      '8': {
        '17': 1,
        '19': [4, 1],
        '20': [
          {'2': 'true', '3': 900},
          {'2': 'false', '3': 999},
        ],
        '22': {
          '1': 1000,
          '2': 1000,
          '3':
              'The legacy closed enum behavior in C++ is deprecated and is scheduled to be removed in edition 2025.  See http://protobuf.dev/programming-guides/enum/#cpp for more information'
        },
      },
      '10': 'legacyClosedEnum',
    },
    {
      '1': 'string_type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.pb.CppFeatures.StringType',
      '8': {
        '17': 1,
        '19': [4, 1],
        '20': [
          {'2': 'STRING', '3': 900},
          {'2': 'VIEW', '3': 1001},
        ],
        '22': {'1': 1000},
      },
      '10': 'stringType',
    },
    {
      '1': 'enum_name_uses_string_view',
      '3': 3,
      '4': 1,
      '5': 8,
      '8': {
        '17': 1,
        '19': [6, 1],
        '20': [
          {'2': 'false', '3': 900},
          {'2': 'true', '3': 1001},
        ],
        '22': {'1': 1001},
      },
      '10': 'enumNameUsesStringView',
    },
  ],
  '4': [CppFeatures_StringType$json],
};

@$core.Deprecated('Use cppFeaturesDescriptor instead')
const CppFeatures_StringType$json = {
  '1': 'StringType',
  '2': [
    {'1': 'STRING_TYPE_UNKNOWN', '2': 0},
    {'1': 'VIEW', '2': 1},
    {'1': 'CORD', '2': 2},
    {'1': 'STRING', '2': 3},
  ],
};

/// Descriptor for `CppFeatures`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cppFeaturesDescriptor = $convert.base64Decode(
    'CgtDcHBGZWF0dXJlcxKNAgoSbGVnYWN5X2Nsb3NlZF9lbnVtGAEgASgIQt4BiAEBmAEEmAEBog'
    'EJEgR0cnVlGIQHogEKEgVmYWxzZRjnB7IBuAEI6AcQ6AcarwFUaGUgbGVnYWN5IGNsb3NlZCBl'
    'bnVtIGJlaGF2aW9yIGluIEMrKyBpcyBkZXByZWNhdGVkIGFuZCBpcyBzY2hlZHVsZWQgdG8gYm'
    'UgcmVtb3ZlZCBpbiBlZGl0aW9uIDIwMjUuICBTZWUgaHR0cDovL3Byb3RvYnVmLmRldi9wcm9n'
    'cmFtbWluZy1ndWlkZXMvZW51bS8jY3BwIGZvciBtb3JlIGluZm9ybWF0aW9uUhBsZWdhY3lDbG'
    '9zZWRFbnVtEmYKC3N0cmluZ190eXBlGAIgASgOMhoucGIuQ3BwRmVhdHVyZXMuU3RyaW5nVHlw'
    'ZUIpiAEBmAEEmAEBogELEgZTVFJJTkcYhAeiAQkSBFZJRVcY6QeyAQMI6AdSCnN0cmluZ1R5cG'
    'USZAoaZW51bV9uYW1lX3VzZXNfc3RyaW5nX3ZpZXcYAyABKAhCKIgBAZgBBpgBAaIBChIFZmFs'
    'c2UYhAeiAQkSBHRydWUY6QeyAQMI6QdSFmVudW1OYW1lVXNlc1N0cmluZ1ZpZXciRQoKU3RyaW'
    '5nVHlwZRIXChNTVFJJTkdfVFlQRV9VTktOT1dOEAASCAoEVklFVxABEggKBENPUkQQAhIKCgZT'
    'VFJJTkcQAw==');
