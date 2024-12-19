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

import 'dart:convert';
import 'dart:typed_data';

import 'package:protobuf/protobuf.dart';

import 'connect/stable_codec.dart';
import 'exception.dart';
import "grpc/gen/status.pb.dart" as pb;
import 'grpc/status.dart' as status;

final ArgumentError _invalidTypeError = ArgumentError(
  "Invalid message type, expected a $GeneratedMessage",
);

final class ProtoCodec implements StableCodec {
  final ExtensionRegistry extensionRegistry;

  const ProtoCodec({
    this.extensionRegistry = ExtensionRegistry.EMPTY,
  });

  @override
  String get name => "proto";
  @override
  Uint8List encode(Object message) {
    if (message is! GeneratedMessage) {
      throw _invalidTypeError;
    }
    return message.writeToBuffer();
  }

  @override
  void decode(Uint8List data, Object message) {
    if (message is! GeneratedMessage) {
      throw _invalidTypeError;
    }
    message.mergeFromBuffer(data, extensionRegistry);
  }

  @override
  bool get isBinary => true;

  @override
  Uint8List stableEncode(Object message) {
    // There is no way to do a deterministic encoding.
    //
    // The default encoding does order by tag numners but map keys are
    // not deterministic.
    return encode(message);
  }
}

final class JsonCodec implements StableCodec {
  final TypeRegistry typeRegistry;
  final bool permissiveEnums;
  final bool ignoreUnknownFields;
  final bool supportNamesWithUnderscores;

  const JsonCodec({
    this.typeRegistry = const TypeRegistry.empty(),
    this.permissiveEnums = false,
    this.ignoreUnknownFields = true,
    this.supportNamesWithUnderscores = false,
  });

  @override
  String get name => "json";
  @override
  Uint8List encode(Object message) {
    if (message is! GeneratedMessage) {
      throw _invalidTypeError;
    }
    return Utf8Encoder().convert(
      jsonEncode(
        message.toProto3Json(
          typeRegistry: typeRegistry,
        ),
      ),
    );
  }

  @override
  void decode(Uint8List data, Object message) {
    if (message is! GeneratedMessage) {
      throw _invalidTypeError;
    }
    message.mergeFromProto3Json(
      jsonDecode(Utf8Decoder().convert(data)),
      typeRegistry: typeRegistry,
      permissiveEnums: permissiveEnums,
      ignoreUnknownFields: ignoreUnknownFields,
      supportNamesWithUnderscores: supportNamesWithUnderscores,
    );
  }

  @override
  bool get isBinary => false;

  @override
  Uint8List stableEncode(Object message) {
    // There is no way to do a deterministic encoding.
    //
    // The default encoding does order by tag numners but map keys are
    // not deterministic.
    return encode(message);
  }
}

final class StatusParser implements status.StatusParser {
  const StatusParser();
  @override
  status.Status parse(Uint8List data) {
    final pStatus = pb.Status.fromBuffer(data);
    return status.Status(
      pStatus.code,
      pStatus.message,
      pStatus.details
          .map(
            (any) => ErrorDetail(
              any.typeUrl.substring(any.typeUrl.lastIndexOf("/") + 1),
              Uint8List.fromList(any.value),
            ),
          )
          .toList(),
    );
  }
}
