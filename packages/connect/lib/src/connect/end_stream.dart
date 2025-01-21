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

import 'dart:convert';
import 'dart:typed_data';

import '../code.dart';
import '../exception.dart';
import '../headers.dart';
import 'error_json.dart';

/// Indicates that the data in a EnvelopedMessage
/// is a EndStreamResponse of the Connect protocol.
const endStreamFlag = 2; // 0b00000010

/// Represents the EndStreamResponse of the Connect protocol.
final class EndStreamResponse {
  final Headers metadata;
  final ConnectException? error;

  const EndStreamResponse(this.metadata, this.error);

  factory EndStreamResponse.fromJson(Uint8List bytes) {
    final parseErr = ConnectException(Code.unknown, "invalid end-of-stream");
    late final Object? json;
    try {
      json = jsonDecode(utf8.decode(bytes));
    } catch (_) {
      throw parseErr;
    }
    if (json is! Map<String, dynamic>) {
      throw parseErr;
    }
    final metadata = switch (json["metadata"]) {
      null => Headers(),
      Map<String, dynamic> dict => dict.entries.fold(
          Headers(),
          (headers, entry) {
            final values = entry.value;
            if (values is! List<dynamic>) {
              throw parseErr;
            }
            for (final value in values) {
              if (value is! String) {
                throw parseErr;
              }
              headers.add(entry.key, value);
            }
            return headers;
          },
        ),
      _ => throw parseErr,
    };
    return EndStreamResponse(
      metadata,
      switch (json["error"]) {
        null => null,
        Object err => errorFromJson(err, metadata, parseErr)
      },
    );
  }
}
