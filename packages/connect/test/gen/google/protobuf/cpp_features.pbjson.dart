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
// ignore_for_file: non_constant_identifier_names, unused_import

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
          {'2': 'true', '3': 998},
          {'2': 'false', '3': 999},
        ],
        '22': {
          '1': 1000,
          '2': 1000,
          '3':
              'The legacy closed enum treatment in C++ is deprecated and is scheduled to be removed in edition 2025.  Mark enum type on the enum definitions themselves rather than on fields.'
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
          {'2': 'STRING', '3': 998},
          {'2': 'VIEW', '3': 1001},
        ],
        '22': {'1': 1000},
      },
      '10': 'stringType',
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
    'EJEgR0cnVlGOYHogEKEgVmYWxzZRjnB7IBuAEI6AcQ6AcarwFUaGUgbGVnYWN5IGNsb3NlZCBl'
    'bnVtIHRyZWF0bWVudCBpbiBDKysgaXMgZGVwcmVjYXRlZCBhbmQgaXMgc2NoZWR1bGVkIHRvIG'
    'JlIHJlbW92ZWQgaW4gZWRpdGlvbiAyMDI1LiAgTWFyayBlbnVtIHR5cGUgb24gdGhlIGVudW0g'
    'ZGVmaW5pdGlvbnMgdGhlbXNlbHZlcyByYXRoZXIgdGhhbiBvbiBmaWVsZHMuUhBsZWdhY3lDbG'
    '9zZWRFbnVtEmYKC3N0cmluZ190eXBlGAIgASgOMhoucGIuQ3BwRmVhdHVyZXMuU3RyaW5nVHlw'
    'ZUIpiAEBmAEEmAEBogELEgZTVFJJTkcY5geiAQkSBFZJRVcY6QeyAQMI6AdSCnN0cmluZ1R5cG'
    'UiRQoKU3RyaW5nVHlwZRIXChNTVFJJTkdfVFlQRV9VTktOT1dOEAASCAoEVklFVxABEggKBENP'
    'UkQQAhIKCgZTVFJJTkcQAw==');
