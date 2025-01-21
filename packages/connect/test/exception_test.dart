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

import 'package:connectrpc/connect.dart';
import 'package:test/test.dart';

void main() {
  group('from()', () {
    test('returns reason if already a ConnectException', () {
      final ex = ConnectException(Code.failedPrecondition, "foo");
      expect(ConnectException.from(ex), same(ex));
    });
    test('defaults to code unknown', () {
      final ex = ConnectException.from('foo');
      expect(ex.code, equals(Code.unknown));
    });
    test('defaults to code unknown', () {
      final ex = ConnectException.from('foo');
      expect(ex.code, equals(Code.unknown));
    });
    test('applies supplied code', () {
      final ex = ConnectException.from('foo', Code.failedPrecondition);
      expect(ex.code, equals(Code.failedPrecondition));
    });
  });
}
