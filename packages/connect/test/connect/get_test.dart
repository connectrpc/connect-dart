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

import 'package:connectrpc/src/connect/get.dart';
import 'package:connectrpc/src/connect/stable_codec.dart';
import 'package:test/test.dart';

void main() {
  group('connectGetUrl', () {
    test('orders parameters per spec for a binary codec', () {
      final codec = _FakeCodec(
        'proto',
        isBinary: true,
        bytes: Uint8List.fromList([0x01, 0x02, 0x03]),
      );
      expect(
        connectGetUrl('https://example.com/svc/M', codec, Object()),
        'https://example.com/svc/M'
        '?connect=v1&base64=1&encoding=proto&message=AQID',
      );
    });

    test('omits base64 and orders parameters per spec for a text codec', () {
      const body = '{"a":1}';
      final codec = _FakeCodec(
        'json',
        isBinary: false,
        bytes: Uint8List.fromList(utf8.encode(body)),
      );
      expect(
        connectGetUrl('https://example.com/svc/M', codec, Object()),
        'https://example.com/svc/M'
        '?connect=v1&encoding=json&message=${Uri.encodeQueryComponent(body)}',
      );
    });
  });
}

final class _FakeCodec implements StableCodec {
  _FakeCodec(this.name, {required this.isBinary, required this.bytes});

  @override
  final String name;

  @override
  final bool isBinary;

  final Uint8List bytes;

  @override
  Uint8List encode(Object message) => bytes;

  @override
  void decode(Uint8List data, Object message) {}

  @override
  Uint8List stableEncode(Object m) => bytes;
}
