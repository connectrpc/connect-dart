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

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class HTTPVersion extends $pb.ProtobufEnum {
  static const HTTPVersion HTTP_VERSION_UNSPECIFIED =
      HTTPVersion._(0, _omitEnumNames ? '' : 'HTTP_VERSION_UNSPECIFIED');
  static const HTTPVersion HTTP_VERSION_1 =
      HTTPVersion._(1, _omitEnumNames ? '' : 'HTTP_VERSION_1');
  static const HTTPVersion HTTP_VERSION_2 =
      HTTPVersion._(2, _omitEnumNames ? '' : 'HTTP_VERSION_2');
  static const HTTPVersion HTTP_VERSION_3 =
      HTTPVersion._(3, _omitEnumNames ? '' : 'HTTP_VERSION_3');

  static const $core.List<HTTPVersion> values = <HTTPVersion>[
    HTTP_VERSION_UNSPECIFIED,
    HTTP_VERSION_1,
    HTTP_VERSION_2,
    HTTP_VERSION_3,
  ];

  static final $core.Map<$core.int, HTTPVersion> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static HTTPVersion? valueOf($core.int value) => _byValue[value];

  const HTTPVersion._($core.int v, $core.String n) : super(v, n);
}

class Protocol extends $pb.ProtobufEnum {
  static const Protocol PROTOCOL_UNSPECIFIED =
      Protocol._(0, _omitEnumNames ? '' : 'PROTOCOL_UNSPECIFIED');
  static const Protocol PROTOCOL_CONNECT =
      Protocol._(1, _omitEnumNames ? '' : 'PROTOCOL_CONNECT');
  static const Protocol PROTOCOL_GRPC =
      Protocol._(2, _omitEnumNames ? '' : 'PROTOCOL_GRPC');
  static const Protocol PROTOCOL_GRPC_WEB =
      Protocol._(3, _omitEnumNames ? '' : 'PROTOCOL_GRPC_WEB');

  static const $core.List<Protocol> values = <Protocol>[
    PROTOCOL_UNSPECIFIED,
    PROTOCOL_CONNECT,
    PROTOCOL_GRPC,
    PROTOCOL_GRPC_WEB,
  ];

  static final $core.Map<$core.int, Protocol> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static Protocol? valueOf($core.int value) => _byValue[value];

  const Protocol._($core.int v, $core.String n) : super(v, n);
}

class Codec extends $pb.ProtobufEnum {
  static const Codec CODEC_UNSPECIFIED =
      Codec._(0, _omitEnumNames ? '' : 'CODEC_UNSPECIFIED');
  static const Codec CODEC_PROTO =
      Codec._(1, _omitEnumNames ? '' : 'CODEC_PROTO');
  static const Codec CODEC_JSON =
      Codec._(2, _omitEnumNames ? '' : 'CODEC_JSON');
  static const Codec CODEC_TEXT =
      Codec._(3, _omitEnumNames ? '' : 'CODEC_TEXT');

  static const $core.List<Codec> values = <Codec>[
    CODEC_UNSPECIFIED,
    CODEC_PROTO,
    CODEC_JSON,
    CODEC_TEXT,
  ];

  static final $core.Map<$core.int, Codec> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static Codec? valueOf($core.int value) => _byValue[value];

  const Codec._($core.int v, $core.String n) : super(v, n);
}

class Compression extends $pb.ProtobufEnum {
  static const Compression COMPRESSION_UNSPECIFIED =
      Compression._(0, _omitEnumNames ? '' : 'COMPRESSION_UNSPECIFIED');
  static const Compression COMPRESSION_IDENTITY =
      Compression._(1, _omitEnumNames ? '' : 'COMPRESSION_IDENTITY');
  static const Compression COMPRESSION_GZIP =
      Compression._(2, _omitEnumNames ? '' : 'COMPRESSION_GZIP');
  static const Compression COMPRESSION_BR =
      Compression._(3, _omitEnumNames ? '' : 'COMPRESSION_BR');
  static const Compression COMPRESSION_ZSTD =
      Compression._(4, _omitEnumNames ? '' : 'COMPRESSION_ZSTD');
  static const Compression COMPRESSION_DEFLATE =
      Compression._(5, _omitEnumNames ? '' : 'COMPRESSION_DEFLATE');
  static const Compression COMPRESSION_SNAPPY =
      Compression._(6, _omitEnumNames ? '' : 'COMPRESSION_SNAPPY');

  static const $core.List<Compression> values = <Compression>[
    COMPRESSION_UNSPECIFIED,
    COMPRESSION_IDENTITY,
    COMPRESSION_GZIP,
    COMPRESSION_BR,
    COMPRESSION_ZSTD,
    COMPRESSION_DEFLATE,
    COMPRESSION_SNAPPY,
  ];

  static final $core.Map<$core.int, Compression> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static Compression? valueOf($core.int value) => _byValue[value];

  const Compression._($core.int v, $core.String n) : super(v, n);
}

class StreamType extends $pb.ProtobufEnum {
  static const StreamType STREAM_TYPE_UNSPECIFIED =
      StreamType._(0, _omitEnumNames ? '' : 'STREAM_TYPE_UNSPECIFIED');
  static const StreamType STREAM_TYPE_UNARY =
      StreamType._(1, _omitEnumNames ? '' : 'STREAM_TYPE_UNARY');
  static const StreamType STREAM_TYPE_CLIENT_STREAM =
      StreamType._(2, _omitEnumNames ? '' : 'STREAM_TYPE_CLIENT_STREAM');
  static const StreamType STREAM_TYPE_SERVER_STREAM =
      StreamType._(3, _omitEnumNames ? '' : 'STREAM_TYPE_SERVER_STREAM');
  static const StreamType STREAM_TYPE_HALF_DUPLEX_BIDI_STREAM = StreamType._(
      4, _omitEnumNames ? '' : 'STREAM_TYPE_HALF_DUPLEX_BIDI_STREAM');
  static const StreamType STREAM_TYPE_FULL_DUPLEX_BIDI_STREAM = StreamType._(
      5, _omitEnumNames ? '' : 'STREAM_TYPE_FULL_DUPLEX_BIDI_STREAM');

  static const $core.List<StreamType> values = <StreamType>[
    STREAM_TYPE_UNSPECIFIED,
    STREAM_TYPE_UNARY,
    STREAM_TYPE_CLIENT_STREAM,
    STREAM_TYPE_SERVER_STREAM,
    STREAM_TYPE_HALF_DUPLEX_BIDI_STREAM,
    STREAM_TYPE_FULL_DUPLEX_BIDI_STREAM,
  ];

  static final $core.Map<$core.int, StreamType> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static StreamType? valueOf($core.int value) => _byValue[value];

  const StreamType._($core.int v, $core.String n) : super(v, n);
}

class Code extends $pb.ProtobufEnum {
  static const Code CODE_UNSPECIFIED =
      Code._(0, _omitEnumNames ? '' : 'CODE_UNSPECIFIED');
  static const Code CODE_CANCELED =
      Code._(1, _omitEnumNames ? '' : 'CODE_CANCELED');
  static const Code CODE_UNKNOWN =
      Code._(2, _omitEnumNames ? '' : 'CODE_UNKNOWN');
  static const Code CODE_INVALID_ARGUMENT =
      Code._(3, _omitEnumNames ? '' : 'CODE_INVALID_ARGUMENT');
  static const Code CODE_DEADLINE_EXCEEDED =
      Code._(4, _omitEnumNames ? '' : 'CODE_DEADLINE_EXCEEDED');
  static const Code CODE_NOT_FOUND =
      Code._(5, _omitEnumNames ? '' : 'CODE_NOT_FOUND');
  static const Code CODE_ALREADY_EXISTS =
      Code._(6, _omitEnumNames ? '' : 'CODE_ALREADY_EXISTS');
  static const Code CODE_PERMISSION_DENIED =
      Code._(7, _omitEnumNames ? '' : 'CODE_PERMISSION_DENIED');
  static const Code CODE_RESOURCE_EXHAUSTED =
      Code._(8, _omitEnumNames ? '' : 'CODE_RESOURCE_EXHAUSTED');
  static const Code CODE_FAILED_PRECONDITION =
      Code._(9, _omitEnumNames ? '' : 'CODE_FAILED_PRECONDITION');
  static const Code CODE_ABORTED =
      Code._(10, _omitEnumNames ? '' : 'CODE_ABORTED');
  static const Code CODE_OUT_OF_RANGE =
      Code._(11, _omitEnumNames ? '' : 'CODE_OUT_OF_RANGE');
  static const Code CODE_UNIMPLEMENTED =
      Code._(12, _omitEnumNames ? '' : 'CODE_UNIMPLEMENTED');
  static const Code CODE_INTERNAL =
      Code._(13, _omitEnumNames ? '' : 'CODE_INTERNAL');
  static const Code CODE_UNAVAILABLE =
      Code._(14, _omitEnumNames ? '' : 'CODE_UNAVAILABLE');
  static const Code CODE_DATA_LOSS =
      Code._(15, _omitEnumNames ? '' : 'CODE_DATA_LOSS');
  static const Code CODE_UNAUTHENTICATED =
      Code._(16, _omitEnumNames ? '' : 'CODE_UNAUTHENTICATED');

  static const $core.List<Code> values = <Code>[
    CODE_UNSPECIFIED,
    CODE_CANCELED,
    CODE_UNKNOWN,
    CODE_INVALID_ARGUMENT,
    CODE_DEADLINE_EXCEEDED,
    CODE_NOT_FOUND,
    CODE_ALREADY_EXISTS,
    CODE_PERMISSION_DENIED,
    CODE_RESOURCE_EXHAUSTED,
    CODE_FAILED_PRECONDITION,
    CODE_ABORTED,
    CODE_OUT_OF_RANGE,
    CODE_UNIMPLEMENTED,
    CODE_INTERNAL,
    CODE_UNAVAILABLE,
    CODE_DATA_LOSS,
    CODE_UNAUTHENTICATED,
  ];

  static final $core.Map<$core.int, Code> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static Code? valueOf($core.int value) => _byValue[value];

  const Code._($core.int v, $core.String n) : super(v, n);
}

const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
