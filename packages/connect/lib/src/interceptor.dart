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

import 'abort.dart';
import 'headers.dart';
import 'spec.dart';

/// An interceptor can add logic to clients or servers, similar to the decorators
/// or middleware you may have seen in other libraries. Interceptors may
/// mutate the request and response, catch errors and retry/recover, emit
/// logs, or do nearly everything else.
///
/// You can think of interceptors like a layered onion. A request initiated
/// by a client goes through the outermost layer first. In the center, the
/// actual HTTP request is run by the transport. The response then comes back
/// through all layers and is returned to the client.
///
/// To implement that layering, Interceptors are functions that wrap a call
/// invocation. In an array of interceptors, the interceptor at the end of
/// the array is applied first.
typedef Interceptor = AnyFn<I, O> Function<I extends Object, O extends Object>(
  AnyFn<I, O> next,
);

/// AnyFn represents the client-side invocation of an RPC. Interceptors can wrap
/// this invocation, add request headers, and wrap parts of the request or
/// response to inspect and log.
typedef AnyFn<I, O> = Future<Response<I, O>> Function(Request<I, O> request);

/// Request is used in interceptors to represent a base request.
/// See [UnaryRequest], and [StreamRequest].
sealed class Request<I, O> {
  /// Spec of the call.
  final Spec<I, O> spec;

  /// The URL the request is going to hit
  final String url;

  /// Headers that will be sent along with the request.
  final Headers headers;

  /// Signal to abort the call.
  final AbortSignal signal;

  const Request(this.spec, this.url, this.headers, this.signal);
}

/// Response is used in interceptors to represent a base response.
/// See [UnaryResponse], and [StreamResponse].
sealed class Response<I, O> {
  /// Spec of the call.
  final Spec<I, O> spec;

  /// Headers received from the response.
  final Headers headers;

  /// Trailers received from the response.
  ///
  /// Note that trailers are only populated when the entirety of the response
  /// has been read.
  final Headers trailers;

  const Response(this.spec, this.headers, this.trailers);
}

/// UnaryRequest is used in interceptors to represent a request with a
/// single input message.
final class UnaryRequest<I, O> extends Request<I, O> {
  /// The input message that will be transmitted.
  final I message;

  const UnaryRequest(
    super.spec,
    super.url,
    super.headers,
    this.message,
    super.signal,
  );
}

/// UnaryResponse is used in interceptors to represent a response with
/// a single output message.
final class UnaryResponse<I, O> extends Response<I, O> {
  /// The received output message.
  final O message;

  const UnaryResponse(
    super.spec,
    super.headers,
    this.message,
    super.trailers,
  );
}

/// StreamResponse is used in interceptors to represent an ongoing call that has
/// zero or more input messages, and zero or more output messages.
final class StreamResponse<I, O> extends Response<I, O> {
  /// The output messages.
  final Stream<O> message;

  const StreamResponse(
    super.spec,
    super.headers,
    this.message,
    super.trailers,
  );
}

/// StreamRequest is used in interceptors to represent a request that has
/// zero or more input messages, and zero or more output messages.
final class StreamRequest<I, O> extends Request<I, O> {
  /// The input messages that will be transmitted.
  final Stream<I> message;

  const StreamRequest(
    super.spec,
    super.url,
    super.headers,
    this.message,
    super.signal,
  );
}
