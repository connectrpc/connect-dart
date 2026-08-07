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

import 'package:connectrpc/protobuf.dart';
import 'package:connectrpc/src/connect/get.dart';
import 'package:protobuf/well_known_types/google/protobuf/wrappers.pb.dart';
import 'package:test/test.dart';

void main() {
  group('connectGetUrl', () {
    const url = 'https://example.com/TestService/Unary';
    final message = StringValue(value: 'abc');

    test('orders query parameters per spec for binary codecs', () {
      expect(
        connectGetUrl(url, const ProtoCodec(), message),
        equals('$url?connect=v1&base64=1&encoding=proto&message=CgNhYmM='),
      );
    });

    test('orders query parameters per spec for text codecs', () {
      expect(
        connectGetUrl(url, const JsonCodec(), message),
        equals('$url?connect=v1&encoding=json&message=%22abc%22'),
      );
    });
  });
}
