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

@TestOn('js')
library;

import 'package:conformance/conformance.dart' hide Header;
import 'package:conformance/test.dart';
import 'package:connectrpc/protobuf.dart';
import 'package:connectrpc/protocol/connect.dart' as connect;
import 'package:connectrpc/protocol/grpc_web.dart' as grpc_web;
import 'package:connectrpc/web.dart';
import 'package:protobuf/protobuf.dart';
import 'package:test/test.dart';

void main() {
  testClient(
    'web',
    ConformanceArgs(
      trace: true,
      config: 'test/conformance/conformance.web.yaml',
    ),
    (ClientCompatRequest req) {
      var scheme = "http://";
      if (req.serverTlsCert.isNotEmpty) {
        scheme = "https://";
      }
      final baseUrl = '${scheme}localhost:${req.port}';
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
      final httpClient = createHttpClient();
      return switch (req.protocol) {
        Protocol.PROTOCOL_GRPC => throw "unimplemented protocol",
        Protocol.PROTOCOL_CONNECT => connect.Transport(
            baseUrl: baseUrl,
            codec: codec,
            httpClient: httpClient,
            useHttpGet: req.useGetHttpMethod,
          ),
        Protocol.PROTOCOL_GRPC_WEB => grpc_web.Transport(
            baseUrl: baseUrl,
            codec: codec,
            httpClient: httpClient,
            statusParser: StatusParser(),
          ),
        _ => throw "Unknown protocol",
      };
    },
  );
}
