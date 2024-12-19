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

import 'dart:typed_data';

import 'code.dart';
import 'headers.dart';

/// ConnectException captures four pieces of information: a Code, an error
/// message, an optional cause of the error, and an optional collection of
/// arbitrary Protobuf messages called  "details".
///
/// Because developer tools typically print just the toString message, we prefix
/// it with the status code, so that the most important information is always
/// visible immediately.
///
/// Error details are wrapped with google.protobuf.Any on the wire, so that
/// a server or middleware can attach arbitrary data to an error.
final class ConnectException implements Exception {
  /// The Code for this error.
  final Code code;

  /// A union of response headers and trailers associated with this error.
  final Headers metadata = Headers();

  /// The error message.
  final String message;

  /// The underlying cause of this error, if any. In cases where the actual cause
  /// is elided with the error message, the cause is specified here so that we
  /// don't leak the underlying error, but instead make it available for logging.
  final Object? cause;

  /// Incoming error details are stored
  /// in this property.
  final List<ErrorDetail> details = List.empty(growable: true);

  ConnectException(
    this.code,
    this.message, {
    this.cause,
    Headers? metadata,
    List<ErrorDetail>? details,
  }) {
    if (metadata != null) {
      this.metadata.addAll(metadata);
    }
    if (details != null) {
      this.details.addAll(details);
    }
  }

  @override
  String toString() {
    return message.isNotEmpty ? '[${code.name}] $message' : '[${code.name}]';
  }

  /// Convert any value - typically a caught exception into a [ConnectException],
  /// following these rules:
  /// - If the value is already a ConnectError, return it as is.
  /// - For other values, return the values String representation as a message,
  ///   with the code Unknown by default.
  factory ConnectException.from(Object reason, [Code code = Code.unknown]) {
    if (reason is ConnectException) {
      return reason;
    }
    return ConnectException(code, reason.toString(), cause: reason);
  }
}

/// An ErrorDetail is a self-describing message attached to an [ConnectException].
/// Error details are sent over the network to clients, which can then work with
/// strongly-typed data rather than trying to parse a complex error message. For
/// example, you might use details to send a localized error message or retry
/// parameters to the client.
final class ErrorDetail {
  final String type;
  final Uint8List value;
  final Object? debug;

  const ErrorDetail(this.type, this.value, [this.debug]);
}
