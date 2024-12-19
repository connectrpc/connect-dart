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

import "../codec.dart";
import "../grpc/status.dart";
import "../http.dart";
import "../interceptor.dart";
import "../protocol/transport.dart";
import "protocol.dart";

/// Transport for the gRPC-web protocol.
final class Transport extends ProtocolTransport {
  Transport({
    required String baseUrl,
    required Codec codec,
    required HttpClient httpClient,
    required StatusParser statusParser,
    List<Interceptor>? interceptors,
  }) : super(
          baseUrl,
          codec,
          Protocol(statusParser),
          httpClient,
          interceptors ?? [],
        );
}
