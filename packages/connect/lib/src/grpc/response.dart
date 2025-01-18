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

import '../code.dart';
import '../compression.dart';
import '../exception.dart';
import '../headers.dart';
import '../http.dart';
import '../protocol/compression.dart';
import './headers.dart';
import './request_header.dart';
import './status.dart';
import './trailer_error.dart';
import 'http_status.dart';

extension ResponseValidation on HttpResponse {
  /// Validates response status and header for the gRPC protocol.
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
    List<Compression> acceptCompressions,
  ) {
    if (status != 200) {
      throw ConnectException(
        codeFromHttpStatus(status),
        'HTTP $status',
        metadata: header,
      );
    }
    final contentType = header[headerContentType] ?? '';
    if (!contentType.startsWith(contentTypePrefix)) {
      throw ConnectException(
        Code.unknown,
        'unsupported content type $contentType',
        metadata: header,
      );
    }
    return (
      foundStatus: header.contains(headerGrpcStatus),
      headerError: header.findError(statusParser),
      compression: findCompression(acceptCompressions, headerEncoding)
    );
  }
}
