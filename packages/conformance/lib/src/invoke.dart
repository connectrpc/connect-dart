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

import 'package:conformance/conformance.dart';
import 'package:connectrpc/connect.dart'
    hide UnaryRequest, UnaryResponse, StreamType, Headers;
import 'package:connectrpc/connect.dart' as connect;

import 'gen/connectrpc/conformance/v1/service.connect.client.dart';
import 'protocol.dart';

Future<ClientResponseResult> invoke(
  Transport transport,
  ClientCompatRequest req,
) {
  final client = ConformanceServiceClient(transport);
  return switch (req.method) {
    "Unary" => unary(client, req),
    "IdempotentUnary" => unary(client, req, true),
    "ServerStream" => serverStream(client, req),
    "ClientStream" => clientStream(client, req),
    "BidiStream" => bidiStream(client, req),
    "Unimplemented" => unimplemented(client, req),
    _ => throw 'Unknown method: ${req.method}',
  };
}

Future<ClientResponseResult> unary(
  ConformanceServiceClient client,
  ClientCompatRequest req, [
  bool idempotent = false,
]) async {
  if (req.requestMessages.length != 1) {
    throw "Unary method requires exactly one request message";
  }
  final msg = req.requestMessages[0];
  final uReq = idempotent ? IdempotentUnaryRequest() : UnaryRequest();
  if (!msg.canUnpackInto(uReq)) {
    throw "Could not unpack request message to unary request";
  }
  msg.unpackInto(uReq);
  final reqHeader = connect.Headers();
  addProtoHeaders(reqHeader, req.requestHeaders);
  ConnectException? error;
  List<Header> resHeaders = [];
  List<Header> resTrailers = [];
  List<ConformancePayload> payloads = [];
  try {
    await wait(req.requestDelayMs);
    final signal = connect.CancelableSignal(parent: getSignalForRequest(req));
    final cancelTiming = CancellationTiming.forRequest(req);
    if (cancelTiming.afterCloseSendMs >= 0) {
      wait(cancelTiming.afterCloseSendMs).then(signal.cancel).ignore();
    }
    final uResFuture = !idempotent
        ? client.unary(
            uReq as UnaryRequest,
            headers: reqHeader,
            signal: signal,
            onHeader: (header) => resHeaders = convertToProtoHeaders(header),
            onTrailer: (trailer) =>
                resTrailers = convertToProtoHeaders(trailer),
          )
        : client.idempotentUnary(
            uReq as IdempotentUnaryRequest,
            headers: reqHeader,
            signal: signal,
            onHeader: (header) => resHeaders = convertToProtoHeaders(header),
            onTrailer: (trailer) =>
                resTrailers = convertToProtoHeaders(trailer),
          );
    payloads.add(switch (await uResFuture) {
      UnaryResponse uRes => uRes.payload,
      IdempotentUnaryResponse uRes => uRes.payload,
      _ => throw 'Must be one of the known types',
    });
  } catch (e) {
    error = ConnectException.from(e);
    // We can't distinguish between headers and trailers here, so we just
    // add the metadata to both.
    //
    // But if the headers are already set, we don't need to overwrite them.
    resHeaders =
        resHeaders.isEmpty ? convertToProtoHeaders(error.metadata) : resHeaders;
    resTrailers = convertToProtoHeaders(error.metadata);
  }
  return ClientResponseResult(
    payloads: payloads,
    responseHeaders: resHeaders,
    responseTrailers: resTrailers,
    error: convertToProtoError(error),
  );
}

Future<ClientResponseResult> serverStream(
  ConformanceServiceClient client,
  ClientCompatRequest req,
) async {
  if (req.requestMessages.length != 1) {
    throw "ServerStream method requires exactly one request message";
  }
  final msg = req.requestMessages[0];
  final uReq = ServerStreamRequest();
  if (!msg.canUnpackInto(uReq)) {
    throw "Could not unpack request message to server stream request";
  }
  msg.unpackInto(uReq);
  final reqHeader = connect.Headers();
  addProtoHeaders(reqHeader, req.requestHeaders);
  ConnectException? error;
  List<Header> resHeaders = [];
  List<Header> resTrailers = [];
  List<ConformancePayload> payloads = [];
  final cancelTiming = CancellationTiming.forRequest(req);
  final signal = CancelableSignal();
  try {
    await wait(req.requestDelayMs);
    final res = client.serverStream(
      uReq,
      headers: reqHeader,
      signal: getSignalForRequest(req, signal),
      onHeader: (header) => resHeaders = convertToProtoHeaders(header),
      onTrailer: (trailer) => resTrailers = convertToProtoHeaders(trailer),
    );
    if (cancelTiming.afterCloseSendMs >= 0) {
      await wait(cancelTiming.afterCloseSendMs);
      signal.cancel();
    }
    var count = 0;
    await for (final msg in res) {
      payloads.add(msg.payload);
      count++;
      if (count == cancelTiming.afterNumResponses) {
        signal.cancel();
      }
    }
  } catch (e) {
    error = ConnectException.from(e);
    // We can't distinguish between headers and trailers here, so we just
    // add the metadata to both.
    //
    // But if the headers are already set, we don't need to overwrite them.
    resHeaders =
        resHeaders.isEmpty ? convertToProtoHeaders(error.metadata) : resHeaders;
    resTrailers = convertToProtoHeaders(error.metadata);
  }
  return ClientResponseResult(
    responseHeaders: resHeaders,
    responseTrailers: resTrailers,
    payloads: payloads,
    error: convertToProtoError(error),
  );
}

Future<ClientResponseResult> clientStream(
  ConformanceServiceClient client,
  ClientCompatRequest req,
) async {
  final reqHeaders = connect.Headers();
  addProtoHeaders(reqHeaders, req.requestHeaders);
  ConnectException? error;
  List<Header> resHeaders = [];
  List<Header> resTrailers = [];
  List<ConformancePayload> payloads = [];
  final cancelTiming = CancellationTiming.forRequest(req);
  final signal = CancelableSignal();
  try {
    final csRes = await client.clientStream(
      (() async* {
        for (final msg in req.requestMessages) {
          final csReq = ClientStreamRequest();
          if (!msg.canUnpackInto(csReq)) {
            throw "Could not unpack request message to client stream request";
          }
          msg.unpackInto(csReq);
          await wait(req.requestDelayMs);
          yield csReq;
        }
        if (cancelTiming.beforeCloseSend) {
          signal.cancel();
        } else if (cancelTiming.afterCloseSendMs >= 0) {
          Future.delayed(
            Duration(milliseconds: cancelTiming.afterCloseSendMs),
            () => signal.cancel(),
          );
        }
      })(),
      headers: reqHeaders,
      signal: getSignalForRequest(req, signal),
      onHeader: (header) => resHeaders = convertToProtoHeaders(header),
      onTrailer: (trailer) => resTrailers = convertToProtoHeaders(trailer),
    );
    payloads.add(csRes.payload);
  } catch (e) {
    error = ConnectException.from(e);
    // We can't distinguish between headers and trailers here, so we just
    // add the metadata to both.
    //
    // But if the headers are already set, we don't need to overwrite them.
    resHeaders =
        resHeaders.isEmpty ? convertToProtoHeaders(error.metadata) : resHeaders;
    resTrailers = convertToProtoHeaders(error.metadata);
  }
  return ClientResponseResult(
    responseHeaders: resHeaders,
    responseTrailers: resTrailers,
    payloads: payloads,
    error: convertToProtoError(error),
  );
}

Future<ClientResponseResult> bidiStream(
  ConformanceServiceClient client,
  ClientCompatRequest req,
) async {
  final reqHeaders = connect.Headers();
  addProtoHeaders(reqHeaders, req.requestHeaders);
  ConnectException? error;
  List<Header> resHeaders = [];
  List<Header> resTrailers = [];
  List<ConformancePayload> payloads = [];
  final cancelTiming = CancellationTiming.forRequest(req);
  final signal = CancelableSignal();
  var recvCount = 0;
  try {
    final reqIt = StreamController<BidiStreamRequest>();
    final sRes = client.bidiStream(
      reqIt.stream,
      headers: reqHeaders,
      signal: getSignalForRequest(req, signal),
      onHeader: (header) => resHeaders = convertToProtoHeaders(header),
      onTrailer: (trailer) => resTrailers = convertToProtoHeaders(trailer),
    );
    final resIt = StreamIterator(sRes);
    for (final msg in req.requestMessages) {
      final bdReq = BidiStreamRequest();
      if (!msg.canUnpackInto(bdReq)) {
        throw "Could not unpack request message to client stream request";
      }
      msg.unpackInto(bdReq);
      await wait(req.requestDelayMs);
      reqIt.add(bdReq);
      // We wait for the microstask to complete hoping that the add has
      // been received. We need to use a better stream controller that can tell
      // when a queued value is read.
      await null;
      if (req.streamType == StreamType.STREAM_TYPE_FULL_DUPLEX_BIDI_STREAM) {
        if (!(await resIt.moveNext())) {
          continue;
        }
        final next = resIt.current;
        payloads.add(next.payload);
        recvCount++;
        if (cancelTiming.afterNumResponses == recvCount) {
          signal.cancel();
        }
      }
    }
    if (cancelTiming.beforeCloseSend) {
      signal.cancel();
    }
    reqIt.close();
    if (cancelTiming.afterCloseSendMs >= 0) {
      Future.delayed(
        Duration(milliseconds: cancelTiming.afterCloseSendMs),
        () => signal.cancel(),
      );
    }
    if (cancelTiming.afterNumResponses == 0) {
      signal.cancel();
    }
    // Drain the response iterator
    while (true) {
      if (!(await resIt.moveNext())) {
        break;
      }
      final next = resIt.current;
      payloads.add(next.payload);
      recvCount++;
      if (cancelTiming.afterNumResponses == recvCount) {
        signal.cancel();
      }
    }
  } catch (e) {
    error = ConnectException.from(e);
    // We can't distinguish between headers and trailers here, so we just
    // add the metadata to both.
    //
    // But if the headers are already set, we don't need to overwrite them.
    resHeaders =
        resHeaders.isEmpty ? convertToProtoHeaders(error.metadata) : resHeaders;
    resTrailers = convertToProtoHeaders(error.metadata);
  }
  return ClientResponseResult(
    responseHeaders: resHeaders,
    responseTrailers: resTrailers,
    payloads: payloads,
    error: convertToProtoError(error),
  );
}

Future<ClientResponseResult> unimplemented(
  ConformanceServiceClient client,
  ClientCompatRequest req,
) async {
  final msg = req.requestMessages[0];
  final unReq = UnimplementedRequest();
  if (!msg.canUnpackInto(unReq)) {
    throw "Could not unpack request message to unary request";
  }
  msg.unpackInto(unReq);
  final reqHeader = connect.Headers();
  addProtoHeaders(reqHeader, req.requestHeaders);
  ConnectException? error;
  List<Header> resHeaders = [];
  List<Header> resTrailers = [];
  try {
    await client.unimplemented(
      unReq,
      headers: reqHeader,
      signal: getSignalForRequest(req),
      onHeader: (header) => resHeaders = convertToProtoHeaders(header),
      onTrailer: (trailer) => resTrailers = convertToProtoHeaders(trailer),
    );
  } catch (e) {
    error = ConnectException.from(e);
    // We can't distinguish between headers and trailers here, so we just
    // add the metadata to both.
    //
    // But if the headers are already set, we don't need to overwrite them.
    resHeaders =
        resHeaders.isEmpty ? convertToProtoHeaders(error.metadata) : resHeaders;
    resTrailers = convertToProtoHeaders(error.metadata);
  }
  return ClientResponseResult(
    responseHeaders: resHeaders,
    responseTrailers: resTrailers,
    error: convertToProtoError(error),
  );
}
