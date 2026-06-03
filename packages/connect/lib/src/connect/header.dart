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
import '../spec.dart';
import '../version.dart';
import 'version.dart';

const headerContentType = "content-type";
const headerContentLength = "content-length";
const headerTimeout = "connect-timeout-ms";
const headerProtocolVersion = "connect-protocol-version";
const headerUnaryEncoding = "content-encoding";
const headerStreamEncoding = "connect-content-encoding";
const headerUnaryAcceptEncoding = "accept-encoding";
const headerStreamAcceptEncoding = "connect-accept-encoding";
const headerUserAgent = "user-agent";

Headers requestHeader(
  Codec codec,
  StreamType streamType,
  Headers? userProvidedHeaders,
  AbortSignal? signal,
  Compression? sendCompression,
  List<Compression> acceptCompressions,
) {
  final header = userProvidedHeaders == null
      ? Headers()
      : Headers.from(userProvidedHeaders);
  header[headerProtocolVersion] = protocolVersion;
  if (signal?.deadline case final deadline?) {
    header[headerTimeout] =
        deadline.difference(DateTime.now()).inMilliseconds.toString();
  }
  header[headerContentType] = streamType == StreamType.unary
      ? 'application/${codec.name}'
      : 'application/connect+${codec.name}';
  if (!header.contains(headerUserAgent)) {
    header[headerUserAgent] = 'connect-dart/$version';
  }
  if (sendCompression != null) {
    header[streamType == StreamType.unary
        ? headerUnaryEncoding
        : headerStreamEncoding] = sendCompression.name;
  }
  if (acceptCompressions.isNotEmpty) {
    header[streamType == StreamType.unary
            ? headerUnaryAcceptEncoding
            : headerStreamAcceptEncoding] =
        acceptCompressions.map((c) => c.name).join(",");
  }
  return header;
}
