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

import '../headers.dart';

/// Indicates that the data in a EnvelopedMessage
/// is a set of trailers of the gRPC-web protocol.
const trailerFlag = 128; // 0b10000000

Headers parseTrailer(Uint8List data) {
  final headers = Headers();
  final lines = Utf8Decoder().convert(data).split("\r\n");
  for (final line in lines) {
    if (line.isEmpty) continue;
    final i = line.indexOf(":");
    if (i > 0) {
      final name = line.substring(0, i).trim();
      final value = line.substring(i + 1).trim();
      headers.add(name, value);
    }
  }
  return headers;
}
