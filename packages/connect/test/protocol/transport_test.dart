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
import 'package:connectrpc/protobuf.dart';
import 'package:connectrpc/src/protocol/protocol.dart';
import 'package:connectrpc/src/protocol/transport.dart';
import 'package:test/test.dart';
import '../gen/google/protobuf/wrappers.pb.dart';

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
}

void main() {
  group('ProtocolTransport', () {
    group('Interceptors', () {
      test('can use a callable object', () {
        // ignore: implicit_call_tearoffs
        Interceptor _ = ClassInterceptor();
      });
      test('request fields are set', () async {
        final transport = TestTransport(
          interceptors: [
            <I extends Object, O extends Object>(next) {
              return (req) {
                expect(req.headers['foo'], equals('bar'));
                expect(req.url, equals('https://test/TestService/Unary'));
                expect(req.spec, TestService.unary);
                return next(req);
              };
            },
          ],
          protocol: DelegatingProtocol(
            onRequestHeaders: <I, O>(spec, codec, options) {
              return Headers()..add('foo', 'bar');
            },
            onUnary: <I, O>(req) async => UnaryResponse(
              req.spec,
              Headers(),
              req.message as O,
              Headers(),
            ),
          ),
        );
        await transport.unary(
          TestService.unary,
          StringValue(value: "foo"),
        );
      });
      test('must apply like an onion', () async {
        /// Returns an interceptor that sets a header on both request and response.
        Interceptor setHeader(String key, String value) {
          return <I extends Object, O extends Object>(next) {
            return (req) async {
              req.headers[key] = value;
              final res = await next(req);
              res.headers[key] = value;
              return res;
            };
          };
        }

        final transport = TestTransport(
          interceptors: [
            setHeader("key", "1"),
            setHeader("key", "2"),
          ],
          protocol: DelegatingProtocol(
            onUnary: <I, O>(req) async {
              // Must see the later value
              expect(req.headers['key'], equals("2"));
              return UnaryResponse(
                req.spec,
                Headers(),
                req.message as O,
                Headers(),
              );
            },
          ),
        );
        final res = await transport.unary(
          TestService.unary,
          StringValue(value: "foo"),
        );
        // Must see the first value
        expect(res.headers['key'], equals("1"));
      });
      test('should be able to cast to unary types', () async {
        final transport = TestTransport(
          protocol: DelegatingProtocol(
            onUnary: <I, O>(req) async => UnaryResponse(
              req.spec,
              Headers(),
              req.message as O,
              Headers(),
            ),
          ),
          interceptors: [
            <I extends Object, O extends Object>(next) {
              return (req) async {
                expect(req, isA<UnaryRequest<I, O>>());
                expect(
                  (req as UnaryRequest<I, O>).message,
                  isA<StringValue>(),
                );
                final res = await next(req);
                expect(res, isA<UnaryResponse<I, O>>());
                expect(
                  (res as UnaryResponse<I, O>).message,
                  isA<StringValue>(),
                );
                return res;
              };
            }
          ],
        );
        await transport.unary(
          TestService.unary,
          StringValue(value: "foo"),
        );
      });
      test('should be able to cast to stream types', () async {
        final transport = TestTransport(
          protocol: DelegatingProtocol(
            onStream: <I, O>(req) async => StreamResponse(
              req.spec,
              Headers(),
              req.message.cast<O>(),
              Headers(),
            ),
          ),
          interceptors: [
            <I extends Object, O extends Object>(next) {
              return (req) async {
                expect(req, isA<StreamRequest<I, O>>());
                expect(
                  (req as StreamRequest<I, O>).message,
                  isA<Stream<StringValue>>(),
                );
                final res = await next(req);
                expect(res, isA<StreamResponse<I, O>>());
                expect(
                  (res as StreamResponse<I, O>).message,
                  isA<Stream<StringValue>>(),
                );
                return res;
              };
            }
          ],
        );
        await transport.stream(
          TestService.unary,
          Stream.fromIterable([StringValue(value: "foo")]),
        );
      });
    });
  });
}

class DelegatingProtocol implements Protocol {
  final Headers Function<I, O>(Spec<I, O>, Codec, CallOptions?)?
      onRequestHeaders;
  final Future<StreamResponse<I, O>> Function<I, O>(StreamRequest<I, O>)?
      onStream;
  final Future<UnaryResponse<I, O>> Function<I, O>(UnaryRequest<I, O>)? onUnary;
  DelegatingProtocol({
    this.onUnary,
    this.onStream,
    this.onRequestHeaders,
  });

  @override
  Headers requestHeaders<I, O>(
    Spec<I, O> spec,
    Codec codec,
    CallOptions? options,
  ) {
    final onRequestHeaders = this.onRequestHeaders;
    if (onRequestHeaders != null) {
      return onRequestHeaders(
        spec,
        codec,
        options,
      );
    }
    return options?.headers ?? Headers();
  }

  @override
  Future<UnaryResponse<I, O>> unary<I extends Object, O extends Object>(
    UnaryRequest<I, O> req,
    Codec codec,
    HttpClient client,
  ) async {
    final onUnary = this.onUnary;
    if (onUnary != null) {
      final res = await onUnary(req);
      return UnaryResponse(
        req.spec,
        res.headers,
        res.message,
        res.trailers,
      );
    }
    throw UnimplementedError();
  }

  @override
  Future<StreamResponse<I, O>> stream<I extends Object, O extends Object>(
    StreamRequest<I, O> req,
    Codec codec,
    HttpClient client,
  ) async {
    final onStream = this.onStream;
    if (onStream != null) {
      final res = await onStream(req);
      return StreamResponse(
        req.spec,
        res.headers,
        res.message.cast<O>(),
        res.trailers,
      );
    }
    throw UnimplementedError();
  }
}

final class TestTransport extends ProtocolTransport {
  TestTransport({
    required Protocol protocol,
    List<Interceptor>? interceptors,
  }) : super(
          "https://test",
          ProtoCodec(),
          protocol,
          (req) => throw UnimplementedError(),
          interceptors ?? [],
        );
}

final class ClassInterceptor {
  AnyFn<I, O> call<I extends Object, O extends Object>(AnyFn<I, O> next) =>
      next;
}
