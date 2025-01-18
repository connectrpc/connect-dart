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

import 'dart:async';

import '../code.dart';
import '../codec.dart';
import '../compression.dart';
import '../exception.dart';
import '../grpc/headers.dart';
import '../grpc/status.dart';
import '../grpc/trailer.dart';
import '../headers.dart';
import '../http.dart';
import '../interceptor.dart';
import '../protocol/compression.dart';
import '../protocol/envelope.dart';
import '../protocol/protocol.dart' as base;
import '../protocol/serialization.dart';
import '../spec.dart';
import '../transport.dart';
import 'request_header.dart';
import 'response.dart';
import 'trailer.dart';

final class Protocol implements base.Protocol {
  final StatusParser statusParser;

  const Protocol(this.statusParser);

  @override
  Headers requestHeaders<I, O>(
    Spec<I, O> spec,
    Codec codec,
    Compression? sendCompression,
    List<Compression> acceptCompressions,
    CallOptions? options,
  ) {
    return requestHeader(
      codec,
      options?.headers,
      options?.signal,
      sendCompression,
      acceptCompressions,
    );
  }

  @override
  Future<UnaryResponse<I, O>> unary<I extends Object, O extends Object>(
    UnaryRequest<I, O> req,
    Codec codec,
    HttpClient httpClient,
    Compression? sendCompression,
    List<Compression> acceptCompressions,
  ) async {
    final res = await httpClient(
      HttpRequest(
        req.url,
        "POST",
        req.headers,
        Stream.fromIterable([req.message])
            .serialize(codec)
            .compress(sendCompression)
            .joinEnvelope(),
        req.signal,
      ),
    );
    final (:foundStatus, :headerError, :compression) = res.validate(
      statusParser,
      acceptCompressions,
    );
    final (message, trailer) = await res.body
        .splitEnvelope()
        .decompress(compression)
        .parse(
          codec,
          req.spec.outputFactory,
          trailerFlag,
          parseTrailer,
        )
        .tryReadSingleMessage();
    if (trailer == null) {
      if (headerError != null) {
        throw headerError;
      }
      throw ConnectException(
        foundStatus ? Code.unimplemented : Code.unknown,
        "protocol error: missing trailer",
      );
    }
    trailer.validateTrailer(res.header, statusParser);
    if (message == null) {
      throw ConnectException(
        trailer.contains(headerGrpcStatus) ? Code.unimplemented : Code.unknown,
        "protocol error: missing output message for unary method",
      );
    }
    return UnaryResponse(
      req.spec,
      res.header,
      message,
      trailer,
    );
  }

  @override
  Future<StreamResponse<I, O>> stream<I extends Object, O extends Object>(
    StreamRequest<I, O> req,
    Codec codec,
    HttpClient httpClient,
    Compression? sendCompression,
    List<Compression> acceptCompressions,
  ) async {
    final res = await httpClient(
      HttpRequest(
        req.url,
        "POST",
        req.headers,
        req.message.serialize(codec).joinEnvelope(),
        req.signal,
      ),
    );
    final (:foundStatus, :headerError, :compression) = res.validate(
      statusParser,
      acceptCompressions,
    );
    if (headerError != null) {
      throw headerError;
    }
    final trailer = Headers();
    return StreamResponse(
      req.spec,
      res.header,
      res.body
          .splitEnvelope()
          .decompress(compression)
          .parse(
            codec,
            req.spec.outputFactory,
            trailerFlag,
            parseTrailer,
          )
          .skipTrailer(
        foundStatus,
        (recvTrailers) {
          trailer.addAll(
            recvTrailers..validateTrailer(req.headers, statusParser),
          );
        },
      ),
      trailer,
    );
  }
}

extension<O extends Object> on Stream<ParsedEnvelopedMessage<O, Headers>> {
  /// Returns a stream of all the messages and skips the trailer.
  ///
  /// It also ensures no messages are received once trailer is recevied.
  Stream<O> skipTrailer(
    bool trailersOnly,
    void Function(Headers) onTrailers,
  ) async* {
    // A grpc-status: 0 response header was present. This is a "trailers-only"
    // response (a response without a body and no trailers).
    //
    // The spec seems to disallow a trailers-only response for status 0 - we are
    // lenient and only verify that the body is empty.
    //
    // > [...] Trailers-Only is permitted for calls that produce an immediate error.
    // See https://github.com/grpc/grpc/blob/master/doc/PROTOCOL-HTTP2.md
    var trailerReceived = trailersOnly;
    await for (final env in this) {
      if (trailerReceived) {
        throw ConnectException(
          Code.invalidArgument,
          trailersOnly
              ? "protocol error: extra data for trailers-only"
              : "protocol error: received extra data after trailer",
        );
      }
      switch (env) {
        case EndStreamMessage<O, Headers> _:
          trailerReceived = true;
          onTrailers(env.value);
        case ParsedMessage<O, Headers> _:
          yield env.value;
      }
    }
    if (!trailerReceived) {
      throw ConnectException(
        Code.internal,
        "protocol error: missing trailer",
      );
    }
  }

  /// Tries to read a single message and trailers from the stream.
  Future<(O? message, Headers? trailer)> tryReadSingleMessage() async {
    O? message;
    Headers? trailer;
    await for (final env in this) {
      switch (env) {
        case EndStreamMessage<O, Headers> _:
          if (trailer != null) {
            throw ConnectException(
              Code.unimplemented,
              "protocol error: received extra trailer",
            );
          }
          trailer = env.value;
        case ParsedMessage<O, Headers> _:
          if (message != null) {
            throw ConnectException(
              Code.unimplemented,
              "protocol error: received extra output message for unary method",
            );
          }
          message = env.value;
      }
    }
    return (message, trailer);
  }
}
