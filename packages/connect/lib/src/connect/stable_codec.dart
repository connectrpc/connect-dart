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

import '../codec.dart';

/// Optional interface that can be implemented by [Codec]s to allow Connect
/// GET requests.
abstract interface class StableCodec implements Codec {
  /// Returns true if the marshalled data is binary for this codec.
  ///
  /// If this function returns false, the data returned from Marshal and
  /// MarshalStable are considered valid text and may be used in contexts
  /// where text is expected.
  bool get isBinary;

  /// Encodes the given message with stable field ordering.
  //
  // Should return the same output for a given input. Although
  // it is not guaranteed to be canonicalized, the encoding routine
  // will opt for the most normalized output available for a
  // given serialization.
  //
  // For practical reasons, it is possible for stableEncode to return two
  // different results for two inputs considered to be "equal" in their own
  // domain, and it may change in the future with codec updates, but for
  // any given concrete value and any given version, it should return the
  // same output.
  Uint8List stableEncode(Object m);
}
