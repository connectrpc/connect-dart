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

import '../code.dart';
import '../codec.dart';
import '../exception.dart';
import '../headers.dart';
import '../http.dart';
import '../interceptor.dart';
import '../protocol/compression.dart';
import '../protocol/envelope.dart';
import '../protocol/protocol.dart' as base;
import "../protocol/serialization.dart";
import '../protocol/sink.dart';
import '../spec.dart';
import '../transport.dart';
import 'end_stream.dart';
import 'error_json.dart';
import 'get.dart';
import 'header.dart';
import 'response.dart';
import 'stable_codec.dart';
import 'trailer.dart';

final class Protocol implements base.Protocol {
  final bool useHttpGet;

  const Protocol(this.useHttpGet);

  @override
  Headers requestHeaders<I, O>(
    Spec<I, O> spec,
    Codec codec,
    CallOptions? options,
  ) {
    return requestHeader(
      codec,
      spec.streamType,
      options?.headers,
      options?.signal,
    );
  }

  @override
  Future<UnaryResponse<I, O>> unary<I extends Object, O extends Object>(
    UnaryRequest<I, O> req,
    Codec codec,
    HttpClient httpClient,
  ) async {
    final HttpRequest hReq;
    if (useHttpGet &&
        req.spec.idempotency == Idempotency.noSideEffects &&
        codec is StableCodec) {
      hReq = HttpRequest(
        connectGetUrl(req.url, codec, req.message),
        "GET",
        req.headers
          ..remove(headerContentType)
          ..remove(headerContentLength)
          ..remove(headerProtocolVersion),
        null,
        req.signal,
      );
    } else {
      hReq = HttpRequest(
        req.url,
        "POST",
        req.headers,
        Stream.fromIterable([codec.encode(req.message)]),
        req.signal,
      );
    }
    final res = await httpClient(hReq);
    final unaryError = res.validate(req.spec.streamType, codec);
    final (:headers, :trailers) = res.header.demux();
    final body = await res.body.toBytes(
      int.tryParse(headers[headerContentLength] ?? ''),
    );
    if (unaryError != null) {
      throw errorFromJsonBytes(
        body,
        headers..addAll(trailers),
        unaryError,
      );
    }
    return UnaryResponse(
      req.spec,
      headers,
      codec.parse(body, req.spec.outputFactory),
      trailers,
    );
  }

  @override
  Future<StreamResponse<I, O>> stream<I extends Object, O extends Object>(
    StreamRequest<I, O> req,
    Codec codec,
    HttpClient httpClient,
  ) async {
    final res = await httpClient(
      HttpRequest(
        req.url,
        'POST',
        req.headers,
        req.message.serialize(codec).joinEnvelope(),
        req.signal,
      ),
    );
    res.validate(req.spec.streamType, codec);
    final trailer = Headers();
    return StreamResponse(
      req.spec,
      res.header,
      res.body
          .splitEnvelope()
          .decompress()
          .parse(
            codec,
            req.spec.outputFactory,
            endStreamFlag,
            EndStreamResponse.fromJson,
          )
          .skipEndStream(
        (endStream) {
          if (endStream.error case ConnectException err) {
            res.header.addAll(err.metadata);
            throw err;
          }
          trailer.addAll(endStream.metadata);
        },
      ),
      trailer,
    );
  }
}

extension<O extends Object>
    on Stream<ParsedEnvelopedMessage<O, EndStreamResponse>> {
  /// Returns a stream of all the messages skipping the end stream message.
  Stream<O> skipEndStream(
    void Function(EndStreamResponse) onEndStream,
  ) async* {
    var endStreamReceived = false;
    await for (final env in this) {
      if (endStreamReceived) {
        throw ConnectException(
          Code.invalidArgument,
          "protocol error: received extra data after end-stream-reponse",
        );
      }
      switch (env) {
        case EndStreamMessage<O, EndStreamResponse> _:
          endStreamReceived = true;
          onEndStream(env.value);
        case ParsedMessage<O, EndStreamResponse> _:
          yield env.value;
      }
    }
    if (!endStreamReceived) {
      throw ConnectException(
        Code.invalidArgument,
        "protocol error: missing end-stream-response",
      );
    }
  }
}
