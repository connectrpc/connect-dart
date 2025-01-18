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
import '../grpc/headers.dart';
import '../headers.dart';

const contentTypePrefix = "application/grpc-web";

/// The canonical grpc/grpc-web JavaScript implementation sets
/// this request header with value "1".
/// Some servers may rely on the header to identify gRPC-web
/// requests. For example the proxy by improbable:
/// https://github.com/improbable-eng/grpc-web/blob/53aaf4cdc0fede7103c1b06f0cfc560c003a5c41/go/grpcweb/wrapper.go#L231
const headerXGrpcWeb = "x-grpc-web";

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
  header.add(headerXGrpcWeb, "1");
  // Note that we do not support the grpc-web-text format.
  // https://github.com/grpc/grpc/blob/master/doc/PROTOCOL-WEB.md#protocol-differences-vs-grpc-over-http2
  header[headerContentType] = '$contentTypePrefix+${codec.name}';
  if (signal?.deadline case final deadline?) {
    header[headerTimeout] =
        '${deadline.difference(DateTime.now()).inMilliseconds}m';
  }
  // TODO: User agent headers.
  if (sendCompression != null) {
    header[headerEncoding] = sendCompression.name;
  }
  if (acceptCompressions.isNotEmpty) {
    header[headerAcceptEncoding] =
        acceptCompressions.map((c) => c.name).join(",");
  }
  return header;
}
