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
import 'headers.dart';
import 'interceptor.dart';
import 'spec.dart';

/// Transport represents the underlying transport for a client.
/// A transport implements a protocol, such as Connect or gRPC-web, and allows
/// for the concrete clients to be independent of the protocol.
abstract interface class Transport {
  /// Call a unary RPC - a method that takes a single input message, and
  /// responds with a single output message.
  Future<UnaryResponse<I, O>> unary<I extends Object, O extends Object>(
    Spec<I, O> spec,
    I input, [
    CallOptions? options,
  ]);

  /// Call a streaming RPC - a method that takes zero or more input messages,
  /// and responds with zero or more output messages.
  Future<StreamResponse<I, O>> stream<I extends Object, O extends Object>(
    Spec<I, O> spec,
    Stream<I> input, [
    CallOptions? options,
  ]);
}

/// Options that can be passed to [Transport.unary] and [Transport.stream].
final class CallOptions {
  final Headers? headers;
  final AbortSignal? signal;

  const CallOptions({this.headers, this.signal});
}
