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

import 'dart:typed_data';

import 'abort.dart';
import 'headers.dart';

/// A minimal abstraction of an HTTP client.
typedef HttpClient = Future<HttpResponse> Function(HttpRequest req);

/// A minimal abstraction of an HTTP request.
final class HttpRequest {
  final String url;
  final String method;
  final Headers header;
  final Stream<Uint8List>? body;
  final AbortSignal? signal;

  const HttpRequest(this.url, this.method, this.header, this.body, this.signal);
}

/// A minimal abstraction of an HTTP response.
final class HttpResponse {
  final int status;
  final Headers header;
  final Stream<Uint8List> body;
  final Headers trailer;

  const HttpResponse(this.status, this.header, this.body, this.trailer);
}
