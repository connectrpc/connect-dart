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

//
//  Generated code. Do not modify.
//  source: connectrpc/conformance/v1/service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "service.pb.dart" as connectrpcconformancev1service;
import "service.connect.spec.dart" as specs;

/// The service implemented by conformance test servers. This is implemented by
/// the reference servers, used to test clients, and is expected to be implemented
/// by test servers, since this is the service used by reference clients.
/// Test servers must implement the service as described.
extension type ConformanceServiceClient(connect.Transport _transport) {
  /// A unary operation. The request indicates the response headers and trailers
  /// and also indicates either a response message or an error to send back.
  /// Response message data is specified as bytes. The service should echo back
  /// request properties in the ConformancePayload and then include the message
  /// data in the data field.
  /// If the response_delay_ms duration is specified, the server should wait the
  /// given duration after reading the request before sending the corresponding
  /// response.
  /// Servers should allow the response definition to be unset in the request and
  /// if it is, set no response headers or trailers and return no response data.
  /// The returned payload should only contain the request info.
  Future<connectrpcconformancev1service.UnaryResponse> unary(
    connectrpcconformancev1service.UnaryRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ConformanceService.unary,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// A server-streaming operation. The request indicates the response headers,
  /// response messages, trailers, and an optional error to send back. The
  /// response data should be sent in the order indicated, and the server should
  /// wait between sending response messages as indicated.
  /// Response message data is specified as bytes. The service should echo back
  /// request properties in the first ConformancePayload, and then include the
  /// message data in the data field. Subsequent messages after the first one
  /// should contain only the data field.
  /// Servers should immediately send response headers on the stream before sleeping
  /// for any specified response delay and/or sending the first message so that
  /// clients can be unblocked reading response headers.
  /// If a response definition is not specified OR is specified, but response data
  /// is empty, the server should skip sending anything on the stream. When there
  /// are no responses to send, servers should throw an error if one is provided
  /// and return without error if one is not. Stream headers and trailers should
  /// still be set on the stream if provided regardless of whether a response is
  /// sent or an error is thrown.
  Stream<connectrpcconformancev1service.ServerStreamResponse> serverStream(
    connectrpcconformancev1service.ServerStreamRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).server(
      specs.ConformanceService.serverStream,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// A client-streaming operation. The first request indicates the response
  /// headers and trailers and also indicates either a response message or an
  /// error to send back.
  /// Response message data is specified as bytes. The service should echo back
  /// request properties, including all request messages in the order they were
  /// received, in the ConformancePayload and then include the message data in
  /// the data field.
  /// If the input stream is empty, the server's response will include no data,
  /// only the request properties (headers, timeout).
  /// Servers should only read the response definition from the first message in
  /// the stream and should ignore any definition set in subsequent messages.
  /// Servers should allow the response definition to be unset in the request and
  /// if it is, set no response headers or trailers and return no response data.
  /// The returned payload should only contain the request info.
  Future<connectrpcconformancev1service.ClientStreamResponse> clientStream(
    Stream<connectrpcconformancev1service.ClientStreamRequest> input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).client(
      specs.ConformanceService.clientStream,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// A bidirectional-streaming operation. The first request indicates the response
  /// headers, response messages, trailers, and an optional error to send back.
  /// The response data should be sent in the order indicated, and the server
  /// should wait between sending response messages as indicated.
  /// Response message data is specified as bytes and should be included in the
  /// data field of the ConformancePayload in each response.
  /// Servers should send responses indicated according to the rules of half duplex
  /// vs. full duplex streams. Once all responses are sent, the server should either
  /// return an error if specified or close the stream without error.
  /// Servers should immediately send response headers on the stream before sleeping
  /// for any specified response delay and/or sending the first message so that
  /// clients can be unblocked reading response headers.
  /// If a response definition is not specified OR is specified, but response data
  /// is empty, the server should skip sending anything on the stream. Stream
  /// headers and trailers should always be set on the stream if provided
  /// regardless of whether a response is sent or an error is thrown.
  /// If the full_duplex field is true:
  /// - the handler should read one request and then send back one response, and
  ///   then alternate, reading another request and then sending back another response, etc.
  /// - if the server receives a request and has no responses to send, it
  ///   should throw the error specified in the request.
  /// - the service should echo back all request properties in the first response
  ///   including the last received request. Subsequent responses should only
  ///   echo back the last received request.
  /// - if the response_delay_ms duration is specified, the server should wait the given
  ///   duration after reading the request before sending the corresponding
  ///   response.
  /// If the full_duplex field is false:
  /// - the handler should read all requests until the client is done sending.
  ///   Once all requests are read, the server should then send back any responses
  ///   specified in the response definition.
  /// - the server should echo back all request properties, including all request
  ///   messages in the order they were received, in the first response. Subsequent
  ///   responses should only include the message data in the data field.
  /// - if the response_delay_ms duration is specified, the server should wait that
  ///   long in between sending each response message.
  Stream<connectrpcconformancev1service.BidiStreamResponse> bidiStream(
    Stream<connectrpcconformancev1service.BidiStreamRequest> input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).bidi(
      specs.ConformanceService.bidiStream,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// A unary endpoint that the server should not implement and should instead
  /// return an unimplemented error when invoked.
  Future<connectrpcconformancev1service.UnimplementedResponse> unimplemented(
    connectrpcconformancev1service.UnimplementedRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ConformanceService.unimplemented,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// A unary endpoint denoted as having no side effects (i.e. idempotent).
  /// Implementations should use an HTTP GET when invoking this endpoint and
  /// leverage query parameters to send data.
  Future<connectrpcconformancev1service.IdempotentUnaryResponse>
      idempotentUnary(
    connectrpcconformancev1service.IdempotentUnaryRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ConformanceService.idempotentUnary,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
