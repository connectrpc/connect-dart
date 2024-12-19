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

import 'dart:async';

import 'package:connectrpc/connect.dart';
import 'package:connectrpc/test.dart';
import 'package:test/test.dart';

import 'gen/google/protobuf/wrappers.pb.dart';

final class TestService {
  static const unary = Spec(
    '/TestService/Unary',
    StreamType.unary,
    StringValue.new,
    StringValue.new,
  );
  static const serverStream = Spec(
    '/TestService/ServerStream',
    StreamType.server,
    StringValue.new,
    StringValue.new,
  );
  static const clientStream = Spec(
    '/TestService/ClientStream',
    StreamType.client,
    StringValue.new,
    StringValue.new,
  );
  static const bidiStream = Spec(
    '/TestService/BidiStream',
    StreamType.bidi,
    StringValue.new,
    StringValue.new,
  );
}

void main() {
  group('FakeTransport', () {
    test('works for unary', () async {
      var interceptor = false;
      var onHeader = false;
      var onTrailer = false;
      final transport = FakeTransportBuilder().unary(
        TestService.unary,
        (req, context) {
          expect(req.value, equals("foo"));
          expect(context.requestHeaders['foo'], equals('bar'));
          context.responseHeaders.add('bar', 'foo');
          context.responseTrailers.add('baz', 'foo');
          return StringValue(value: "bar");
        },
      ).build(
        interceptors: [
          <I extends Object, O extends Object>(next) {
            return (req) async {
              interceptor = true;
              expect(req.headers['foo'], equals('bar'));
              final res = await next(req);
              expect(res.headers['bar'], 'foo');
              expect(res.trailers['baz'], 'foo');
              return res;
            };
          }
        ],
      );
      final res = await Client(transport).unary(
        TestService.unary,
        StringValue(value: "foo"),
        headers: Headers()..add('foo', 'bar'),
        onHeader: (headers) {
          onHeader = true;
          expect(headers['bar'], equals('foo'));
        },
        onTrailer: (trailers) {
          onTrailer = true;
          expect(trailers['baz'], equals('foo'));
        },
      );
      expect(res.value, equals('bar'));
      expect(interceptor, isTrue);
      expect(onHeader, isTrue);
      expect(onTrailer, isTrue);
    });
    test('works for client streaming', () async {
      var interceptor = false;
      var onHeader = false;
      var onTrailer = false;
      final transport = FakeTransportBuilder().client(
        TestService.clientStream,
        (req, context) async {
          await for (final next in req) {
            expect(next.value, equals("foo"));
          }
          expect(context.requestHeaders['foo'], equals('bar'));
          context.responseHeaders.add('bar', 'foo');
          context.responseTrailers.add('baz', 'foo');
          return StringValue(value: "bar");
        },
      ).build(
        interceptors: [
          <I extends Object, O extends Object>(next) {
            return (req) async {
              interceptor = true;
              expect(req.headers['foo'], equals('bar'));
              final res = await next(req);
              expect(res.headers['bar'], 'foo');
              // Trailers are only visible after the last received message
              expect(res.trailers['baz'], null);
              expect(res, isA<StreamResponse<I, O>>());
              return StreamResponse(
                res.spec,
                res.headers,
                (res as StreamResponse<I, O>).message.transform(
                  StreamTransformer.fromBind(
                    (stream) async* {
                      yield* stream;
                      expect(res.trailers['baz'], 'foo');
                    },
                  ),
                ),
                res.trailers,
              );
            };
          }
        ],
      );
      final res = await Client(transport).client(
        TestService.clientStream,
        Stream.fromIterable([StringValue(value: "foo")]),
        headers: Headers()..add('foo', 'bar'),
        onHeader: (headers) {
          onHeader = true;
          expect(headers['bar'], equals('foo'));
        },
        onTrailer: (trailers) {
          onTrailer = true;
          expect(trailers['baz'], equals('foo'));
        },
      );
      expect(res.value, equals('bar'));
      expect(interceptor, isTrue);
      expect(onHeader, isTrue);
      expect(onTrailer, isTrue);
    });
    test('works for server', () async {
      var interceptor = false;
      var onHeader = false;
      var onTrailer = false;
      final transport = FakeTransportBuilder().server(
        TestService.serverStream,
        (req, context) async* {
          expect(req.value, equals("foo"));
          expect(context.requestHeaders['foo'], equals('bar'));
          context.responseHeaders.add('bar', 'foo');
          context.responseTrailers.add('baz', 'foo');
          yield StringValue(value: "bar");
        },
      ).build(
        interceptors: [
          <I extends Object, O extends Object>(next) {
            return (req) async {
              interceptor = true;
              expect(req.headers['foo'], equals('bar'));
              final res = await next(req);
              expect(res.headers['bar'], 'foo');
              // Trailers are only visible after the last received message
              expect(res.trailers['baz'], null);
              expect(res, isA<StreamResponse<I, O>>());
              return StreamResponse(
                res.spec,
                res.headers,
                (res as StreamResponse<I, O>).message.transform(
                  StreamTransformer.fromBind(
                    (stream) async* {
                      yield* stream;
                      expect(res.trailers['baz'], 'foo');
                    },
                  ),
                ),
                res.trailers,
              );
            };
          }
        ],
      );
      final res = Client(transport).server(
        TestService.serverStream,
        StringValue(value: "foo"),
        headers: Headers()..add('foo', 'bar'),
        onHeader: (headers) {
          onHeader = true;
          expect(headers['bar'], equals('foo'));
        },
        onTrailer: (trailers) {
          onTrailer = true;
          expect(trailers['baz'], equals('foo'));
        },
      );
      await for (final next in res) {
        expect(next.value, equals('bar'));
      }
      expect(interceptor, isTrue);
      expect(onHeader, isTrue);
      expect(onTrailer, isTrue);
    });
    test('works for bidi', () async {
      var interceptor = false;
      var onHeader = false;
      var onTrailer = false;
      final transport = FakeTransportBuilder().bidi(
        TestService.bidiStream,
        (req, context) async* {
          await for (final next in req) {
            expect(next.value, equals('foo'));
          }
          expect(context.requestHeaders['foo'], equals('bar'));
          context.responseHeaders.add('bar', 'foo');
          context.responseTrailers.add('baz', 'foo');
          yield StringValue(value: "bar");
        },
      ).build(
        interceptors: [
          <I extends Object, O extends Object>(next) {
            return (req) async {
              interceptor = true;
              expect(req.headers['foo'], equals('bar'));
              final res = await next(req);
              expect(res.headers['bar'], 'foo');
              // Trailers are only visible after the last received message
              expect(res.trailers['baz'], null);
              expect(res, isA<StreamResponse<I, O>>());
              return StreamResponse(
                res.spec,
                res.headers,
                (res as StreamResponse<I, O>).message.transform(
                  StreamTransformer.fromBind(
                    (stream) async* {
                      yield* stream;
                      expect(res.trailers['baz'], 'foo');
                    },
                  ),
                ),
                res.trailers,
              );
            };
          }
        ],
      );
      final res = Client(transport).bidi(
        TestService.bidiStream,
        Stream.fromIterable([StringValue(value: "foo")]),
        headers: Headers()..add('foo', 'bar'),
        onHeader: (headers) {
          onHeader = true;
          expect(headers['bar'], equals('foo'));
        },
        onTrailer: (trailers) {
          onTrailer = true;
          expect(trailers['baz'], equals('foo'));
        },
      );
      await for (final next in res) {
        expect(next.value, equals('bar'));
      }
      expect(interceptor, isTrue);
      expect(onHeader, isTrue);
      expect(onTrailer, isTrue);
    });
  });
}
