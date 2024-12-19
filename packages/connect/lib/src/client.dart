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

import 'abort.dart';
import 'code.dart';
import 'exception.dart';
import 'headers.dart';
import 'spec.dart';
import 'transport.dart';

/// Extension used by generated code. Not intended for importing directly.
extension type Client(Transport t) {
  /// Similar to [unary] but with a slightly usage friendly
  Future<O> unary<I extends Object, O extends Object>(
    Spec<I, O> spec,
    I input, {
    void Function(Headers)? onHeader,
    void Function(Headers)? onTrailer,
    AbortSignal? signal,
    Headers? headers,
  }) async {
    final res = await t.unary(
      spec,
      input,
      CallOptions(headers: headers, signal: signal),
    );
    onHeader?.call(res.headers);
    onTrailer?.call(res.trailers);
    return res.message;
  }

  /// Convenient api over [stream] for server streaming calls.
  Stream<O> server<I extends Object, O extends Object>(
    Spec<I, O> spec,
    I input, {
    void Function(Headers)? onHeader,
    void Function(Headers)? onTrailer,
    AbortSignal? signal,
    Headers? headers,
  }) async* {
    final res = await t.stream(
      spec,
      Stream.value(input),
      CallOptions(headers: headers, signal: signal),
    );
    onHeader?.call(res.headers);
    yield* res.message;
    onTrailer?.call(res.trailers);
  }

  /// Convenient api over [stream] for client streaming calls.
  Future<O> client<I extends Object, O extends Object>(
    Spec<I, O> spec,
    Stream<I> input, {
    void Function(Headers)? onHeader,
    void Function(Headers)? onTrailer,
    AbortSignal? signal,
    Headers? headers,
  }) async {
    final res = await t.stream(
      spec,
      input,
      CallOptions(headers: headers, signal: signal),
    );
    onHeader?.call(res.headers);
    O? message;
    var count = 0;
    await for (final next in res.message) {
      message = next;
      count++;
    }
    if (message == null) {
      throw ConnectException(
        Code.unimplemented,
        "protocol error: missing response message",
      );
    }
    if (count > 1) {
      throw ConnectException(
        Code.unimplemented,
        "protocol error: received extra messages for client streaming method",
      );
    }
    onTrailer?.call(res.trailers);
    return message;
  }

  /// Convenient api over [stream] for bidi streaming calls.
  Stream<O> bidi<I extends Object, O extends Object>(
    Spec<I, O> spec,
    Stream<I> input, {
    void Function(Headers)? onHeader,
    void Function(Headers)? onTrailer,
    AbortSignal? signal,
    Headers? headers,
  }) async* {
    final res = await t.stream(
      spec,
      input,
      CallOptions(headers: headers, signal: signal),
    );
    onHeader?.call(res.headers);
    yield* res.message;
    onTrailer?.call(res.trailers);
  }
}
