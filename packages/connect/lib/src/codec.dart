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

import 'dart:typed_data';

/// Codec encodes/decodes objects (typically generated from a schema) to and from bytes.
abstract interface class Codec {
  /// Name of the Codec.
  ///
  /// This may be used as part of the Content-Type within HTTP. For example,
  /// with gRPC this is the content subtype, so "application/grpc+proto" will
  /// map to the Codec with name "proto".
  ///
  /// Names must not be empty.
  String get name;

  /// Encode encodes the given message.
  ///
  /// Encode may expect a specific type of message, and will error if this type
  /// is not given.
  Uint8List encode(Object message);

  // Decode decodes the given message.
  //
  // Decode may expect a specific type of message, and will error if this
  // type is not given.
  void decode(
    Uint8List data,
    Object message,
  );
}
