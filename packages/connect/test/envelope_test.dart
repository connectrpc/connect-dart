import "dart:typed_data";

import "package:connectrpc/connect.dart";
import "package:connectrpc/src/protocol/envelope.dart";
import "package:test/test.dart";

void main() {
  group("SplitEnvelope", () {
    group("one message", () {
      // 100 bytes
      final env = EnvelopedMessage(0, Uint8List(95));
      final envBytes = encodeEnvelope(env.flags, env.data);
      final expected = emitsInOrder([
        allOf(HasFlags(env), HasData(env)),
        emitsDone,
      ]);
      test("One chunk", () {
        expect(
          Stream.fromIterable([envBytes]).splitEnvelope(),
          expected,
        );
      });
      test("split at header", () {
        expect(
          Stream.fromIterable(envBytes.split(5)).splitEnvelope(),
          expected,
        );
      });
      test("split before header", () {
        expect(
          Stream.fromIterable(envBytes.split(2)).splitEnvelope(),
          expected,
        );
      });
      test("split mid data", () {
        expect(
          Stream.fromIterable(envBytes.split(50)).splitEnvelope(),
          expected,
        );
      });
      test("empty chunk", () {
        expect(
          Stream<Uint8List>.fromIterable([]).splitEnvelope(),
          emitsInOrder([emitsDone]),
        );
      });
      test("Invalid header", () {
        expect(
          Stream.fromIterable([envBytes.sublist(0, 2)]).splitEnvelope(),
          emitsInOrder([emitsError(isA<ConnectException>())]),
        );
      });
      test("Invalid data", () {
        expect(
          Stream.fromIterable([envBytes.sublist(0, 50)]).splitEnvelope(),
          emitsInOrder([emitsError(isA<ConnectException>())]),
        );
      });
    });
    group("two messages", () {
      // 100 bytes
      final env = EnvelopedMessage(0, Uint8List(95));
      final envBytes = encodeEnvelope(env.flags, env.data);
      // 200
      final streamBytes = Uint8List.fromList(envBytes + envBytes);
      final expected = emitsInOrder([
        allOf(HasFlags(env), HasData(env)),
        allOf(HasFlags(env), HasData(env)),
        emitsDone,
      ]);
      test("One each", () {
        expect(
          Stream.fromIterable(streamBytes.split(100)).splitEnvelope(),
          expected,
        );
      });
      test("Both together", () {
        expect(
          Stream.fromIterable([streamBytes]).splitEnvelope(),
          expected,
        );
      });
      test("At first header", () {
        expect(
          Stream.fromIterable(streamBytes.split(5)).splitEnvelope(),
          expected,
        );
      });
      test("Before first header", () {
        expect(
          Stream.fromIterable(streamBytes.split(2)).splitEnvelope(),
          expected,
        );
      });
      test("After first header", () {
        expect(
          Stream.fromIterable(streamBytes.split(6)).splitEnvelope(),
          expected,
        );
      });
      test("At second header", () {
        expect(
          Stream.fromIterable(streamBytes.split(105)).splitEnvelope(),
          expected,
        );
      });
      test("Before second header", () {
        expect(
          Stream.fromIterable(streamBytes.split(102)).splitEnvelope(),
          expected,
        );
      });
      test("After second header", () {
        expect(
          Stream.fromIterable(streamBytes.split(106)).splitEnvelope(),
          expected,
        );
      });
    });
  });
}

class HasFlags extends CustomMatcher {
  HasFlags(
    EnvelopedMessage env,
  ) : super("EnvelopeMessage with flags that is", "flags", equals(env.flags));

  @override
  Object? featureValueOf(actual) {
    return (actual as EnvelopedMessage).flags;
  }
}

class HasData extends CustomMatcher {
  HasData(
    EnvelopedMessage env,
  ) : super("EnvelopeMessage with data that is", "data", equals(env.data));

  @override
  Object? featureValueOf(actual) {
    return (actual as EnvelopedMessage).data;
  }
}

extension on Uint8List {
  List<Uint8List> split(int index) {
    return [sublist(0, index), sublist(index)];
  }
}
