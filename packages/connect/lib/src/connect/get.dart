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

import 'stable_codec.dart';
import 'version.dart';

/// Constructs a url for connect GET request.
String connectGetUrl(String url, StableCodec codec, Object message) {
  final messageBytes = codec.stableEncode(message);
  final buf = StringBuffer(url);
  buf.write("?");
  buf.writeAll(
    [
      'connect=v$protocolVersion',
      'encoding=${codec.name}',
      if (codec.isBinary) 'base64=1',
      if (codec.isBinary)
        'message=${base64Url.encode(messageBytes)}'
      else
        'message=${Uri.encodeQueryComponent(utf8.decode(messageBytes))}',
    ],
    "&",
  );
  return buf.toString();
}
