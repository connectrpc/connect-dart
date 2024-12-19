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

import '../exception.dart';

/// Represents a `google.protobuf.Status`.
final class Status {
  final int code;
  final String message;
  final List<ErrorDetail> details;

  const Status(this.code, this.message, this.details);
}

/// Used to parse google.protobuf.Status.
abstract interface class StatusParser {
  /// Parse the given bytes in to [Status]. The given
  /// bytes will be the serialized form of a google.rpc.Status
  /// Protobuf message.
  Status parse(Uint8List data);
}
