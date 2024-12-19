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
import 'dart:typed_data';

import 'abort.dart';
import 'codec.dart';
import 'headers.dart';
import 'http.dart';
import 'interceptor.dart';
import 'protocol/protocol.dart';
import 'protocol/transport.dart';
import 'spec.dart';
import 'transport.dart';

/// A builder for a fake [Transport] that can be used to return mock responses.
///
/// Responses can be returned by registring the handlers for rpcs. The
/// [build] method builds a transport that responds with the registered handlers
/// and throws an [UnimplementedError] for the rest of the rpcs.
final class FakeTransportBuilder {
  final _handlers = <Spec<Object, Object>, Function>{};

  FakeTransportBuilder();

  /// Register a unary handler.
  FakeTransportBuilder unary<I extends Object, O extends Object>(
    Spec<I, O> spec,
    FutureOr<O> Function(
      I request,
      FakeHandlerContext context,
    ) handler,
  ) {
    _assertSpecStream(spec, StreamType.unary);
    _handlers[spec] = handler;
    return this;
  }

  /// Register a client streaming handler.
  FakeTransportBuilder client<I extends Object, O extends Object>(
    Spec<I, O> spec,
    FutureOr<O> Function(
      Stream<I> request,
      FakeHandlerContext context,
    ) handler,
  ) {
    _assertSpecStream(spec, StreamType.client);
    _handlers[spec] = _clientToStream(handler);
    return this;
  }

  /// Register a server streaming handler.
  FakeTransportBuilder server<I extends Object, O extends Object>(
    Spec<I, O> spec,
    Stream<O> Function(
      I request,
      FakeHandlerContext context,
    ) handler,
  ) {
    _assertSpecStream(spec, StreamType.server);
    _handlers[spec] = _serverToStream(handler);
    return this;
  }

  /// Register a bidi streaming handler.
  FakeTransportBuilder bidi<I extends Object, O extends Object>(
    Spec<I, O> spec,
    Stream<O> Function(
      Stream<I> request,
      FakeHandlerContext context,
    ) handler,
  ) {
    _assertSpecStream(spec, StreamType.bidi);
    _handlers[spec] = handler;
    return this;
  }

  /// Build the transport.
  Transport build({
    List<Interceptor>? interceptors,
  }) {
    return _FakeTransport(
      Map.from(_handlers),
      interceptors,
    );
  }

  _StreamHandler<I, O> _clientToStream<I, O>(
    _ClientHandler<I, O> client,
  ) {
    return (req, context) async* {
      yield await client(req, context);
    };
  }

  _StreamHandler<I, O> _serverToStream<I, O>(
    _ServerHandler<I, O> server,
  ) {
    return (req, context) async* {
      yield* server(await req.first, context);
    };
  }

  void _assertSpecStream<I, O>(Spec<I, O> spec, StreamType streamType) {
    assert(
      spec.streamType == streamType,
      "${spec.procedure} is not a $streamType rpc",
    );
  }
}

/// This can be used to set response header and trailers.
final class FakeHandlerContext {
  /// The signal for the call.
  final AbortSignal signal;

  /// Request headers sent by the client.
  final Headers requestHeaders;

  /// Response headers to be sent back.
  final Headers responseHeaders;

  /// Response trailers to be sent back.
  final Headers responseTrailers;

  FakeHandlerContext._(
    this.signal,
    this.requestHeaders,
    this.responseHeaders,
    this.responseTrailers,
  );
}

// We implement the protocol transport to
// be able to test interceptors.
final class _FakeTransport extends ProtocolTransport {
  _FakeTransport(
    Map<Spec<Object, Object>, Function> handlers,
    List<Interceptor>? interceptors,
  ) : super(
          "test://test",
          _FakeCodec(),
          _FakeProtocol(handlers),
          (req) => throw UnimplementedError(),
          interceptors ?? [],
        );
}

final class _FakeProtocol implements Protocol {
  final Map<Spec<Object, Object>, Function> handlers;

  _FakeProtocol(this.handlers);

  @override
  Headers requestHeaders<I, O>(
    Spec<I, O> spec,
    Codec codec,
    CallOptions? options,
  ) {
    final headers = Headers();
    if (options?.headers case Headers userHeaders) {
      headers.addAll(userHeaders);
    }
    return headers;
  }

  @override
  Future<UnaryResponse<I, O>> unary<I extends Object, O extends Object>(
    UnaryRequest<I, O> req,
    Codec codec,
    HttpClient client,
  ) async {
    final handler = handlers[req.spec];
    if (handler == null) {
      throw UnimplementedError(
        "Handler for ${req.spec.procedure} is not registred",
      );
    }
    final headers = Headers();
    final trailers = Headers();
    return UnaryResponse(
      req.spec,
      headers,
      await (handler as _UnaryHandler<I, O>)(
        req.message,
        FakeHandlerContext._(
          req.signal,
          req.headers,
          headers,
          trailers,
        ),
      ),
      trailers,
    );
  }

  @override
  Future<StreamResponse<I, O>> stream<I extends Object, O extends Object>(
    StreamRequest<I, O> req,
    Codec codec,
    HttpClient client,
  ) async {
    final handler = handlers[req.spec];
    if (handler == null) {
      throw UnimplementedError(
        "Handler for ${req.spec.procedure} is not registred",
      );
    }
    final context = FakeHandlerContext._(
      req.signal,
      req.headers,
      Headers(),
      Headers(),
    );
    final trailers = Headers();
    final messages = await (handler as _StreamHandler<I, O>)(
      req.message,
      context,
      // If we do not wait for the first value headers will not be visible
    ).untilFirst(
      // Similarly we also wait for the last message to replicate the server
      // behaviour of only sending trailers at the end.
      () {
        trailers.addAll(context.responseTrailers);
      },
    );
    return StreamResponse(
      req.spec,
      // Cloning will replicate actual server behaviour of only headers before the first response being visible.
      Headers.from(context.responseHeaders),
      messages,
      trailers,
    );
  }
}

typedef _UnaryHandler<I, O> = FutureOr<O> Function(
  I request,
  FakeHandlerContext context,
);

typedef _StreamHandler<I, O> = Stream<O> Function(
  Stream<I> request,
  FakeHandlerContext context,
);

typedef _ClientHandler<I, O> = FutureOr<O> Function(
  Stream<I> request,
  FakeHandlerContext context,
);

typedef _ServerHandler<I, O> = Stream<O> Function(
  I request,
  FakeHandlerContext context,
);

final class _FakeCodec implements Codec {
  @override
  void decode(Uint8List data, Object message) {
    throw UnimplementedError();
  }

  @override
  Uint8List encode(Object message) {
    throw UnimplementedError();
  }

  @override
  String get name => "fake";
}

extension<T> on Stream<T> {
  /// Immediately subscribes to the stream and waits until a value is seen or
  /// stream is closed. Returns a stream with the same values.
  Future<Stream<T>> untilFirst(void Function() onDone) async {
    late final StreamSubscription<T> sub;
    final ctrl = StreamController<T>(
      onCancel: () {
        sub.cancel();
      },
    );
    final first = Completer<void>();
    sub = listen(
      (data) {
        if (!first.isCompleted) {
          first.complete(); // First data. Happy path.
        }
        ctrl.add(data);
      },
      onError: (Object err, StackTrace stackTrace) {
        if (!first.isCompleted) {
          first.completeError(err, stackTrace); // If we see an error first.
        }
        ctrl.addError(err);
        ctrl.close();
      },
      onDone: () {
        if (!first.isCompleted) {
          first.complete(); // Completed with no values.
        }
        ctrl.close();
        onDone();
      },
      cancelOnError: true,
    );
    await first.future;
    return ctrl.stream;
  }
}
