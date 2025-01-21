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

import 'dart:convert';

import '../code.dart';
import '../exception.dart';
import '../headers.dart';
import 'headers.dart';
import 'status.dart';

extension TrailerError on Headers {
  ConnectException? findError(StatusParser statusParser) {
    var statusBytes = this[headerStatusDetailsBin];
    if (statusBytes != null) {
      if (statusBytes.length % 4 != 0) {
        // Non padded, this could be done in a more efficient way.
        statusBytes = base64.normalize(statusBytes);
      }
      final status = statusParser.parse(base64.decode(statusBytes));
      var code = Code.unknown;
      String? cause;
      if (status.code > 0 && status.code < 17) {
        code = Code.values[status.code - 1];
      } else {
        cause = "invalid grpc-status: ${status.code}";
      }
      return ConnectException(
        code,
        status.message,
        cause: cause,
        details: status.details,
        metadata: this,
      );
    }
    final grpcStatus = this[headerGrpcStatus];
    if (grpcStatus != null) {
      if (grpcStatus == "0") {
        return null;
      }
      final code = int.parse(grpcStatus);
      if (code > 0 && code < 17) {
        return ConnectException(
          Code.values[code - 1],
          Uri.decodeComponent(this[headerGrpcMessage] ?? ""),
          metadata: this,
        );
      }
      return ConnectException(
        Code.internal,
        'invalid grpc-status: $grpcStatus',
        metadata: this,
      );
    }
    return null;
  }
}
