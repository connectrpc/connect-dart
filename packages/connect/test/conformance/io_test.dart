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

@TestOn('!js')
library;

import 'dart:io' as io;

import 'package:conformance/conformance.dart';
import 'package:conformance/test.dart';
import 'package:connectrpc/http2.dart' as http2;
import 'package:connectrpc/io.dart' as http1;
import 'package:connectrpc/protobuf.dart';
import 'package:connectrpc/protocol/connect.dart' as connect;
import 'package:connectrpc/protocol/grpc.dart' as grpc;
import 'package:connectrpc/protocol/grpc_web.dart' as grpc_web;
import 'package:connectrpc/src/gzip.dart';
import 'package:protobuf/protobuf.dart';
import 'package:test/test.dart';

void main() {
  testClient(
    'io',
    ConformanceArgs(
      trace: true,
      config: 'test/conformance/conformance.io.yaml',
    ),
    (ClientCompatRequest req) {
      var scheme = "http://";
      if (req.serverTlsCert.isNotEmpty) {
        scheme = "https://";
      }
      final baseUrl = '$scheme${req.host}:${req.port}';
      final codec = switch (req.codec) {
        Codec.CODEC_PROTO => ProtoCodec(),
        Codec.CODEC_JSON => JsonCodec(
            typeRegistry: TypeRegistry([
              UnaryRequest(),
              ServerStreamRequest(),
              ClientStreamRequest(),
              BidiStreamRequest(),
              IdempotentUnaryRequest(),
            ]),
          ),
        _ => throw "Unknown codec",
      };
      final context = io.SecurityContext(withTrustedRoots: false);
      if (req.hasServerTlsCert()) {
        context.setTrustedCertificatesBytes(req.serverTlsCert);
      }
      if (req.hasClientTlsCreds()) {
        context.usePrivateKeyBytes(req.clientTlsCreds.key);
        context.useCertificateChainBytes(req.clientTlsCreds.cert);
      }
      final httpClient = switch (req.httpVersion) {
        HTTPVersion.HTTP_VERSION_1 => http1.createHttpClient(
            io.HttpClient(context: context),
          ),
        HTTPVersion.HTTP_VERSION_2 => http2.createHttpClient(
            transport: http2.Http2ClientTransport(
              context: context,
            ),
          ),
        _ => throw 'Unsupported Http version',
      };
      final compression = switch (req.compression) {
        Compression.COMPRESSION_GZIP => GzipCompression(),
        Compression.COMPRESSION_UNSPECIFIED => null,
        Compression.COMPRESSION_IDENTITY => null,
        _ => throw 'Unsupported compression ${req.compression.name}',
      };
      return switch (req.protocol) {
        Protocol.PROTOCOL_CONNECT => connect.Transport(
            baseUrl: baseUrl,
            codec: codec,
            httpClient: httpClient,
            useHttpGet: req.useGetHttpMethod,
            sendCompression: compression,
            acceptCompressions: compression != null ? [compression] : [],
          ),
        Protocol.PROTOCOL_GRPC => grpc.Transport(
            baseUrl: baseUrl,
            codec: codec,
            httpClient: httpClient,
            statusParser: StatusParser(),
            sendCompression: compression,
            acceptCompressions: compression != null ? [compression] : [],
          ),
        Protocol.PROTOCOL_GRPC_WEB => grpc_web.Transport(
            baseUrl: baseUrl,
            codec: codec,
            httpClient: httpClient,
            statusParser: StatusParser(),
            sendCompression: compression,
            acceptCompressions: compression != null ? [compression] : [],
          ),
        _ => throw "Unknown protocol",
      };
    },
  );
}
