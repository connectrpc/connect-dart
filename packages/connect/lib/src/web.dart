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
import 'dart:js_interop';
import 'dart:typed_data';

import 'abort.dart';
import 'exception.dart';
import 'fetch_bindings.dart' as web;
import 'headers.dart';
import 'http.dart';

/// Creates a [HttpClient] based on the fetch APIs.
///
/// This doesn't support client/bidi streaming.
HttpClient createHttpClient() {
  return (creq) async {
    final reqHeader = web.Headers();
    for (final header in creq.header.entries) {
      // Skip the default user-agent header.
      if (header.name == 'user-agent' && header.value.startsWith('connect-dart/')) {
        continue;
      }
      reqHeader.append(header.name, header.value);
    }
    Uint8List? body;
    if (creq.body != null) {
      await for (final chunk in creq.body!) {
        body = Uint8List.fromList(body ?? Uint8List(0) + chunk);
      }
    }
    final abortCtrl = web.AbortController();
    ConnectException? abortErr;
    creq.signal?.future.then(
      (err) {
        abortErr = err;
        abortCtrl.abort();
      },
    );
    try {
      final res = await web.fetch(
        creq.url,
        web.RequestInit(
          method: creq.method,
          headers: reqHeader,
          mode: "cors",
          credentials: "same-origin",
          redirect: "error",
          signal: abortCtrl.signal,
          body: body?.toJS,
        ),
      );
      final resHeader = Headers();
      for (final (:key, :value) in res.headers.entries()) {
        resHeader.add(key, value);
      }
      // Browsers and other fetch environments decompress the response,
      // but retain the original content-encoding and content-length headers.
      //
      // https://github.com/wintercg/fetch/issues/23
      if (resHeader.contains('content-encoding')) {
        resHeader.remove('content-encoding');
        resHeader.remove('content-length');
      }
      return HttpResponse(
        res.status,
        resHeader,
        res.body.toStream(creq.signal),
        Headers(),
      );
    } catch (err) {
      if (abortErr != null) {
        throw abortErr!;
      }
      rethrow;
    }
  };
}

extension on web.ReadableStream {
  Stream<Uint8List> toStream(AbortSignal? signal) async* {
    ConnectException? abortErr;
    signal?.future.then(
      (err) {
        abortErr = err;
      },
    );
    final reader = getReader();
    try {
      while (true) {
        if (abortErr != null) {
          throw abortErr!;
        }
        final next = await reader.read();
        if (next.done) {
          break;
        }
        // This is guaranteed to have data hence the !
        yield next.value!;
      }
    } catch (err) {
      if (abortErr != null) {
        throw abortErr!;
      }
      rethrow;
    }
  }
}
