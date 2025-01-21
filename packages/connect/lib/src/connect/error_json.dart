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

ConnectException errorFromJsonBytes(
  Uint8List bytes,
  Headers? metadata,
  ConnectException fallback,
) {
  late final dynamic json;
  try {
    json = jsonDecode(utf8.decode(bytes));
  } catch (e) {
    throw fallback;
  }
  return errorFromJson(json, metadata, fallback);
}

ConnectException errorFromJson(
  Object? json,
  Headers? metadata,
  ConnectException fallback,
) {
  if (metadata != null) {
    fallback.metadata.addAll(metadata);
  }
  if (json is! Map<String, dynamic>) {
    throw fallback;
  }
  final code = switch (json['code']) {
    String code => Code.values.firstWhere(
        (c) => c.name == code,
        orElse: () => fallback.code,
      ),
    _ => fallback.code,
  };
  final message = switch (json['message']) {
    String? message => message ?? '',
    _ => throw fallback,
  };
  final error = ConnectException(code, message, metadata: metadata);
  if (json['details'] case List<dynamic> details) {
    const codec = Base64Codec();
    for (final detail in details) {
      if (detail case {'type': String type, 'value': String value}) {
        if (value.length % 4 != 0) {
          // Non padded, this could be done in a more efficient way.
          value = codec.normalize(value);
        }
        error.details.add(
          ErrorDetail(
            type,
            base64.decode(value),
            detail['debug'],
          ),
        );
      } else {
        throw fallback;
      }
    }
  }
  return error;
}
