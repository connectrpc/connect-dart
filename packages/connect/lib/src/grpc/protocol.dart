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

import '../code.dart';
import '../codec.dart';
import '../compression.dart';
import '../exception.dart';
import '../headers.dart';
import '../http.dart';
import '../interceptor.dart';
import '../protocol/compression.dart';
import '../protocol/envelope.dart';
import '../protocol/protocol.dart' as base;
import '../protocol/serialization.dart' hide ParseEnvelope;
import '../spec.dart';
import '../transport.dart';
import 'headers.dart';
import 'request_header.dart';
import 'response.dart';
import 'status.dart';
import 'trailer.dart';

final class Protocol implements base.Protocol {
  final StatusParser statusParser;
  final Compression? sendCompression;

  const Protocol(this.statusParser, this.sendCompression);

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
    final (foundStatus: _, :headerError, :compression) = res.validate(
      statusParser,
      acceptCompressions,
    );
    final message = await res.body
        .splitEnvelope()
        .decompress(compression)
        .parse(codec, req.spec.outputFactory)
        .tryReadingSingleMessage();
    res.trailer.validateTrailer(res.header, statusParser);
    if (message == null) {
      if (headerError != null) {
        // Trailers only response.
        throw headerError;
      }
      throw ConnectException(
        res.trailer.contains(headerGrpcStatus)
            ? Code.unimplemented
            : Code.unknown,
        "protocol error: missing output message for unary method",
      );
    }
    if (headerError != null) {
      throw ConnectException(
        Code.unknown,
        'protocol error: received output message for unary method '
        'with error status',
      );
    }
    return UnaryResponse(
      req.spec,
      res.header,
      message,
      res.trailer,
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
        req.message.serialize(codec).compress(sendCompression).joinEnvelope(),
        req.signal,
      ),
    );
    final (:foundStatus, :headerError, :compression) = res.validate(
      statusParser,
      acceptCompressions,
    );
    if (headerError != null) {
      // Trailers only response.
      throw headerError;
    }
    return StreamResponse(
      req.spec,
      res.header,
      res.body
          .splitEnvelope()
          .decompress(compression)
          .parse(codec, req.spec.outputFactory)
          .onDone(() {
        if (!foundStatus) {
          res.trailer.validateTrailer(res.header, statusParser);
        }
      }),
      res.trailer,
    );
  }
}

extension on Stream<EnvelopedMessage> {
  Stream<M> parse<M extends Object>(Codec codec, M Function() factory) async* {
    await for (final next in this) {
      yield codec.parse(next.data, factory);
    }
  }
}

extension<T extends Object> on Stream<T> {
  Future<T?> tryReadingSingleMessage() async {
    T? first;
    await for (final next in this) {
      if (first != null) {
        throw ConnectException(
          Code.unimplemented,
          "protocol error: received extra output message for unary method",
        );
      }
      first = next;
    }
    return first;
  }

  // Calls cb at the end of the stream.
  Stream<T> onDone(void Function() cb) async* {
    yield* this;
    cb();
  }
}
