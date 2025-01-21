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

import '../compression.dart';
import '../exception.dart';
import '../grpc/headers.dart';
import '../grpc/http_status.dart';
import '../grpc/status.dart';
import '../grpc/trailer_error.dart';
import '../headers.dart';
import '../http.dart';
import '../protocol/compression.dart';

extension ResponseValidation on HttpResponse {
  /// Validates response status and header for the gRPC-web protocol.
  ///
  /// Throws a ConnectError if the header contains an error status,
  /// or if the HTTP status indicates an error.
  ///
  /// Returns an object that indicates whether a gRPC status was found
  /// in the response header. In this case, clients can not expect a
  /// trailer.
  ({
    bool foundStatus,
    ConnectException? headerError,
    Compression? compression,
  }) validate(
    StatusParser statusParser,
    List<Compression> acceptCompression,
  ) {
    // For compatibility with the `grpc-web` package, we treat all HTTP status
    // codes in the 200 range as valid, not just HTTP 200.
    if (status >= 200 && status < 300) {
      return (
        foundStatus: header.contains(headerGrpcStatus),
        headerError: header.findError(statusParser),
        compression: findCompression(acceptCompression, headerEncoding),
      );
    }
    throw ConnectException(
      codeFromHttpStatus(status),
      Uri.decodeComponent(header[headerGrpcMessage] ?? 'HTTP $status'),
      metadata: header,
    );
  }
}
