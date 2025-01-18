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

/// Determine the Connect error code for the given HTTP status code.
/// See https://github.com/grpc/grpc/blob/master/doc/http-grpc-status-mapping.md.
Code codeFromHttpStatus(int httpStatus) {
  return switch (httpStatus) {
    400 => // Bad Request
      Code.internal,
    401 => // Unauthorized
      Code.unauthenticated,
    403 => // Forbidden
      Code.permissionDenied,
    404 => // Not Found
      Code.unimplemented,
    429 => // Too Many Requests
      Code.unavailable,
    502 => // Bad Gateway
      Code.unavailable,
    503 => // Service Unavailable
      Code.unavailable,
    504 => // Gateway Timeout
      Code.unavailable,
    _ => Code.unknown
  };
}
