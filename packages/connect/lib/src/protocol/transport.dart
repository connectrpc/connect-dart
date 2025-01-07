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

import '../abort.dart';
import '../codec.dart';
import '../compression.dart';
import '../http.dart';
import '../interceptor.dart';
import '../spec.dart';
import '../transport.dart';
import 'protocol.dart';

/// Base Transport that handles interceptors, signal cleanup and delegates
/// the call to a [Protocol].
abstract base class ProtocolTransport implements Transport {
  final String _baseUrl;
  final Codec _codec;
  final Protocol _protocol;
  final HttpClient _httpClient;
  final List<Interceptor> _interceptors;
  final Compression? sendCompression;
  final List<Compression> acceptCompressions;

  ProtocolTransport(
    String baseUrl,
    this._codec,
    this._protocol,
    this._httpClient,
    this._interceptors,
    this.sendCompression,
    this.acceptCompressions,
  ) : _baseUrl = baseUrl.replaceAll(RegExp(r'/?$'), "");

  @override
  Future<UnaryResponse<I, O>> unary<I extends Object, O extends Object>(
    Spec<I, O> spec,
    I input, [
    CallOptions? options,
  ]) async {
    final signal = CancelableSignal(parent: options?.signal);
    try {
      final req = UnaryRequest(
        spec,
        _baseUrl + spec.procedure,
        _protocol.requestHeaders(
          spec,
          _codec,
          sendCompression,
          acceptCompressions,
          options,
        ),
        input,
        signal,
      );
      if (_interceptors.isEmpty) {
        return await _protocol.unary(
          req,
          _codec,
          _httpClient,
          sendCompression,
          acceptCompressions,
        );
      }
      final first = _interceptors.apply<I, O>(
        (req) async {
          return await _protocol.unary(
            req as UnaryRequest<I, O>,
            _codec,
            _httpClient,
            sendCompression,
            acceptCompressions,
          );
        },
      );
      return await first(req) as UnaryResponse<I, O>;
    } finally {
      // Cleanup
      signal.cancel();
    }
  }

  @override
  Future<StreamResponse<I, O>> stream<I extends Object, O extends Object>(
    Spec<I, O> spec,
    Stream<I> input, [
    CallOptions? options,
  ]) async {
    final signal = CancelableSignal(parent: options?.signal);
    try {
      final req = StreamRequest(
        spec,
        _baseUrl + spec.procedure,
        _protocol.requestHeaders(
          spec,
          _codec,
          sendCompression,
          acceptCompressions,
          options,
        ),
        input,
        signal,
      );
      late final StreamResponse<I, O> res;
      if (_interceptors.isEmpty) {
        res = await _protocol.stream(
          req,
          _codec,
          _httpClient,
          sendCompression,
          acceptCompressions,
        );
      } else {
        final first = _interceptors.apply<I, O>(
          (req) async {
            return await _protocol.stream(
              req as StreamRequest<I, O>,
              _codec,
              _httpClient,
              sendCompression,
              acceptCompressions,
            );
          },
        );
        res = await first(req) as StreamResponse<I, O>;
      }
      // We don't want to cancel the signal when this function returns
      // as that will cancel streaming reads/writes on the response
      // and requests respectively.
      //
      // Instead we cancel on first read error from response or when
      // it completes.
      return StreamResponse(
        res.spec,
        res.headers,
        res.message.withHooks(
          onError: signal.cancel,
          onDone: signal.cancel,
        ),
        res.trailers,
      );
    } catch (err) {
      signal.cancel(err);
      rethrow;
    }
  }
}

extension _Hooks<T> on Stream<T> {
  /// Returns a new stream that emits the same events as the original
  /// but calls [onError] when an error occurs and calls [onDone] when
  /// the stream is closed without any error.
  Stream<T> withHooks({
    required void Function(Object) onError,
    required void Function() onDone,
  }) async* {
    try {
      await for (final next in this) {
        yield next;
      }
      onDone();
    } catch (err) {
      onError(err);
      rethrow;
    }
  }
}

extension on List<Interceptor> {
  AnyFn<I, O> apply<I extends Object, O extends Object>(AnyFn<I, O> next) {
    return reversed.fold(next, (n, i) => i(n));
  }
}
