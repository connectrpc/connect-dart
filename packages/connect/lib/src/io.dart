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
import 'dart:io' as io;
import 'dart:typed_data';

import 'exception.dart';
import 'headers.dart';
import 'http.dart';
import 'sentinel.dart';

/// Creates a [HttpClient] from [io.HttpClient].
///
/// [io.HttpClient] only supports HTTP/1, and hence cannot be used
/// with grpc and full duplex streaming in other protocols.
HttpClient createHttpClient(io.HttpClient client) {
  return (creq) async {
    final req = await client.openUrl(creq.method, Uri.parse(creq.url));
    // We don't want compression unless it came from upstream.
    //
    // Ref: https://api.dart.dev/dart-io/HttpClient-class.html
    req.headers.removeAll(io.HttpHeaders.acceptEncodingHeader);
    for (final header in creq.header.entries) {
      req.headers.add(header.name, header.value);
    }
    final sentinel = Sentinel.create();
    creq.signal?.future.then((err) {
      sentinel.reject(err);
      req.abort(err);
    });
    if (creq.body case final body?) {
      await for (final chunk in body) {
        req.add(chunk);
      }
    }
    final res = await sentinel.race(req.close());
    final compressed =
        res.headers.value(io.HttpHeaders.contentEncodingHeader) == 'gzip';
    final headers = Headers();
    res.headers.forEach((key, values) {
      // It automatically decompresses gzip responses, but keeps the
      // original content-length and accept-encoding headers.
      //
      // Ref: https://api.dart.dev/dart-io/HttpClient-class.html
      if (compressed &&
          (key == io.HttpHeaders.contentLengthHeader ||
              key == io.HttpHeaders.contentEncodingHeader)) {
        return;
      }
      for (final value in values) {
        headers.add(key, value);
      }
    });
    return HttpResponse(
      res.statusCode,
      headers,
      res.toBytes(sentinel),
      Headers(), // Trailers are not supported in H/1
    );
  };
}

extension on io.HttpClientResponse {
  Stream<Uint8List> toBytes(Sentinel sentinel) async* {
    final it = StreamIterator(this);
    try {
      while (await sentinel.race(it.moveNext())) {
        yield Uint8List.fromList(it.current);
      }
    } catch (err) {
      sentinel.reject(ConnectException.from(err));
      rethrow;
    } finally {
      it.cancel().ignore();
    }
  }
}
