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

import '../abort.dart';
import '../codec.dart';
import '../compression.dart';
import '../headers.dart';
import '../version.dart';
import 'headers.dart';

const contentTypePrefix = "application/grpc";

Headers requestHeader(
  Codec codec,
  Headers? userProvidedHeaders,
  AbortSignal? signal,
  Compression? sendCompression,
  List<Compression> acceptCompressions,
) {
  final header = userProvidedHeaders == null
      ? Headers()
      : Headers.from(userProvidedHeaders);
  header[headerContentType] = '$contentTypePrefix+${codec.name}';
  if (signal?.deadline case final deadline?) {
    header[headerTimeout] =
        '${deadline.difference(DateTime.now()).inMilliseconds}m';
  }
  // The gRPC-HTTP2 specification requires this - it flushes out proxies that
  // don't support HTTP trailers.
  header["Te"] = "trailers";
  if (!header.contains(headerUserAgent)) {
    header[headerUserAgent] = 'connect-dart/$version';
  }
  if (sendCompression != null) {
    header[headerEncoding] = sendCompression.name;
  }
  if (acceptCompressions.isNotEmpty) {
    header[headerAcceptEncoding] =
        acceptCompressions.map((c) => c.name).join(",");
  }
  return header;
}
