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

import 'package:connectrpc/connect.dart';
import 'package:test/test.dart';

void main() {
  group('CancellableSignal', () {
    test('cancels with the given reason', () async {
      final signal = CancelableSignal();
      signal.cancel('foo');
      final ex = await signal.future;
      expect(ex.code, equals(Code.canceled));
      expect(ex.cause, equals('foo'));
      expect(ex.message, equals('foo'));
    });
    test('cancels with a defailt message', () async {
      final signal = CancelableSignal();
      signal.cancel();
      final ex = await signal.future;
      expect(ex.code, equals(Code.canceled));
      expect(ex.cause, equals(null));
      expect(ex.message, equals('operation canceled'));
    });
    test('cancels when parent cancels', () async {
      final parent = CancelableSignal();
      final signal = CancelableSignal(
        parent: CancelableSignal(parent: parent),
      );
      parent.cancel();
      final ex = await signal.future;
      expect(ex.code, equals(Code.canceled));
    });
  });
  group('DeadlineSignal', () {
    test('cancels with the given reason', () async {
      final signal = DeadlineSignal(DateTime.now(), reason: 'foo');
      final ex = await signal.future;
      expect(ex.code, equals(Code.deadlineExceeded));
      expect(ex.cause, equals('foo'));
      expect(ex.message, equals('foo'));
    });
    test('cancels with a default message', () async {
      final signal = DeadlineSignal(DateTime.now());
      final ex = await signal.future;
      expect(ex.code, equals(Code.deadlineExceeded));
      expect(ex.cause, equals(null));
      expect(ex.message, equals('operation exceeded deadline'));
    });
    test('cancels when parent cancels', () async {
      final parent = CancelableSignal();
      final signal = DeadlineSignal(
        DateTime.now().add(Duration(days: 1)),
        parent: DeadlineSignal(
          DateTime.now().add(Duration(days: 2)),
          parent: parent,
        ),
      );
      parent.cancel();
      final ex = await signal.future;
      expect(ex.code, equals(Code.canceled));
    });
    test("doesn't cancel a long deadline", () {
      final signal = DeadlineSignal(DateTime.now().add(Duration(days: 365)));
      expect(signal.future, doesNotComplete);
    });
  });
  group('TimeoutSignal', () {
    test('cancels with the given reason', () async {
      final signal = TimeoutSignal(Duration.zero, reason: 'foo');
      final ex = await signal.future;
      expect(ex.code, equals(Code.deadlineExceeded));
      expect(ex.cause, equals('foo'));
      expect(ex.message, equals('foo'));
    });
    test('cancels with a default message', () async {
      final signal = TimeoutSignal(Duration.zero);
      final ex = await signal.future;
      expect(ex.code, equals(Code.deadlineExceeded));
      expect(ex.cause, equals(null));
      expect(ex.message, equals('operation timed out'));
    });
    test('cancels when parent cancels', () async {
      final parent = CancelableSignal();
      final signal = TimeoutSignal(
        Duration(days: 1),
        parent: TimeoutSignal(
          Duration(days: 2),
          parent: parent,
        ),
      );
      parent.cancel();
      final ex = await signal.future;
      expect(ex.code, equals(Code.canceled));
    });
    test("doesn't cancel a long timeout", () {
      final signal = TimeoutSignal(Duration(days: 365));
      expect(signal.future, doesNotComplete);
    });
  });
}
