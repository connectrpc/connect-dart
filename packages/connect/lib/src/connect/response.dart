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

import '../code.dart';
import '../codec.dart';
import '../compression.dart';
import '../exception.dart';
import '../headers.dart';
import '../http.dart';
import '../protocol/compression.dart';
import '../spec.dart';
import 'header.dart';
import 'http_status.dart';

extension ResponseValidation on HttpResponse {
  /// Validates response status and header for the Connect protocol.
  /// Throws a [ConnectException] if the header indicates an error, or if
  /// the content type is unexpected, with the following exception:
  /// For unary RPCs with an HTTP error status, this returns an error
  /// derived from the HTTP status instead of throwing it, giving an
  /// implementation a chance to parse a Connect error from the wire.
  ({ConnectException? unaryError, Compression? compression}) validate(
    StreamType streamType,
    Codec codec,
    List<Compression> acceptCompressions,
  ) {
    final compression = findCompression(
      acceptCompressions,
      streamType == StreamType.unary
          ? headerUnaryEncoding
          : headerStreamEncoding,
    );
    final contentType = header[headerContentType] ?? '';
    if (status != 200) {
      final statusErr = ConnectException(
        codeFromHttpStatus(status),
        'HTTP $status',
      );
      if (streamType == StreamType.unary &&
          contentType.startsWith("application/json")) {
        // Unary JSON response
        return (unaryError: statusErr, compression: compression);
      }
      throw statusErr;
    }
    final validPrefix = streamType == StreamType.unary
        ? "application/${codec.name}"
        : "application/connect+${codec.name}";
    if (!contentType.startsWith(validPrefix)) {
      /// The error code makes a distinction between a
      /// possible content type like application/json where a application/proto
      /// was expected vs receving something like image/png
      throw ConnectException(
        contentType.startsWith("application") ? Code.internal : Code.unknown,
        'unsupported content type $contentType',
        metadata: header,
      );
    }
    return (unaryError: null, compression: compression);
  }
}
