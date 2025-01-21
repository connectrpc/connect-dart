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
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:http2/transport.dart' as http2;

import '../code.dart';
import '../exception.dart';
import '../headers.dart';
import '../http.dart';
import '../sentinel.dart';
import 'connection.dart';
import 'errors.dart';

/// Creates a [HttpClient] based on `package:http2`
///
/// This only supports HTTP/2.
HttpClient createHttpClient({SecurityContext? context}) {
  final manager = Http2ClientTransportConnectionManager(context: context);
  return (req) async {
    final uri = Uri.parse(req.url);
    final transport = await manager.connect(uri);
    final sentinel = Sentinel.create();
    final stream = transport.makeRequest([
      http2.Header.ascii(':method', req.method),
      http2.Header.ascii(':scheme', uri.scheme),
      http2.Header.ascii(':authority', uri.host),
      http2.Header.ascii(
        ':path',
        [uri.path, if (uri.hasQuery) uri.query].join("?"),
      ),
      for (final header in req.header.entries)
        http2.Header.ascii(header.name, header.value)
    ]);
    req.signal?.future.then((err) {
      sentinel.reject(err);
      stream.terminate();
    }).ignore();
    stream.onTerminated = (code) {
      if (code == null || code == 0) {
        // Ignore RST_STREAM NO_ERROR codes.
        return;
      }
      sentinel.reject(
        errFromRstCode(code),
      );
    };
    if (req.body case Stream<Uint8List> body) {
      // Write request body in parallel to the response.
      body
          .addAll(sentinel, stream.outgoingMessages)
          .catchError(
            (Object err) => sentinel.reject(ConnectException.from(err)),
          )
          .ignore();
    } else {
      await stream.outgoingMessages.close();
    }
    final headers = Headers();
    final trailers = Headers();
    final status = Completer<int>();
    final body = stream.incomingMessages.toBytes(
      sentinel,
      (h2Headers) {
        int? parsedStatus;
        for (final header in h2Headers) {
          final name = utf8.decode(header.name);
          final value = utf8.decode(header.value);
          if (name == ":status") {
            if (parsedStatus != null) {
              throw ConnectException(
                Code.unknown,
                'protocol error: http/2: Duplicate status $value',
              );
            }
            parsedStatus = int.tryParse(value);
            if (parsedStatus == null) {
              throw ConnectException(
                Code.unknown,
                'protocol error: http/2: Invalid status $value',
              );
            }
            continue;
          }
          headers.add(name, value);
        }
        if (parsedStatus == null) {
          throw ConnectException(
            Code.unknown,
            'protocol error: http/2: Missing status code',
          );
        }
        status.complete(parsedStatus);
      },
      (h2Trailers) {
        for (final trailer in h2Trailers) {
          final name = utf8.decode(trailer.name);
          final value = utf8.decode(trailer.value);
          trailers.add(name, value);
        }
      },
    );
    return HttpResponse(
      await sentinel.race(status.future),
      headers,
      body,
      trailers,
    );
  };
}

extension on Stream<Uint8List> {
  /// Writes to the given [sink] until the end or
  /// until the [sentinel] is rejected.
  Future<void> addAll(
    Sentinel sentinel,
    StreamSink<http2.StreamMessage> sink,
  ) async {
    final it = StreamIterator(this);
    try {
      while (await sentinel.race(it.moveNext())) {
        sink.add(http2.DataStreamMessage(it.current));
      }
    } catch (err) {
      sentinel.reject(ConnectException.from(err));
    } finally {
      it.cancel().ignore();
      sink.close().ignore();
    }
  }
}

extension on Stream<http2.StreamMessage> {
  /// Transforms the HTTP frames to bytes.
  ///
  /// Omits the header frames and invokes the call backs with their values.
  /// All the data frames will be part of the returned stream.
  ///
  /// Throwing in the [onHeaders] or [onTrailers] will reject the [sentinel].
  Stream<Uint8List> toBytes(
    Sentinel sentinel,
    void Function(List<http2.Header>) onHeaders,
    void Function(List<http2.Header>) onTrailers,
  ) {
    // To receive headers immediately, we need to start listening on the stream.
    final ctrl = StreamController<Uint8List>();
    addAll(sentinel, onHeaders, onTrailers, ctrl.sink);
    return ctrl.stream;
  }

  /// Adds all the data frames to [sink].
  ///
  /// Calls [onHeaders] and [onTrailers] for the first and last
  /// header frames.
  ///
  /// Closes the sink when stream is done or sentinal is rejected.
  void addAll(
    Sentinel sentinel,
    void Function(List<http2.Header>) onHeaders,
    void Function(List<http2.Header>) onTrailers,
    StreamSink<Uint8List> sink,
  ) async {
    final it = StreamIterator(this);
    try {
      if (!(await sentinel.race(it.moveNext()))) {
        return;
      }
      final headersFrame = it.current;
      if (headersFrame is! http2.HeadersStreamMessage) {
        throw ConnectException(
          Code.unknown,
          'protocol error: http/2: '
          'Received data frame before headers',
        );
      }
      onHeaders(headersFrame.headers);
      var receivedTrailers = false;
      while (await sentinel.race(it.moveNext())) {
        if (receivedTrailers) {
          throw ConnectException(
            Code.unknown,
            'protocol error: http/2: '
            'Unexpected frame after trailers',
          );
        }
        final frame = it.current;
        if (frame is http2.HeadersStreamMessage) {
          receivedTrailers = true;
          onTrailers(frame.headers);
          continue;
        }
        if (frame is! http2.DataStreamMessage) {
          throw ConnectException(
            Code.unknown,
            'protocol error: http2: '
            'Unknown frame received: ${frame.runtimeType}',
          );
        }
        sink.add(Uint8List.fromList(frame.bytes));
      }
    } catch (err) {
      final ex = ConnectException.from(err);
      sentinel.reject(ex);
      sink.addError(ex);
    } finally {
      it.cancel().ignore();
      sink.close().ignore();
    }
  }
}
