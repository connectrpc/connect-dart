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

import 'dart:async';

import '../code.dart';
import '../exception.dart';
import 'envelope.dart';

/// Indicates that the data in a EnvelopedMessage is
/// compressed. It has the same meaning in the gRPC-Web, gRPC-HTTP2,
/// and Connect protocols.
///
const compressedFlag = 1; // 0b00000001

extension DecompressEnvelope on Stream<EnvelopedMessage> {
  /// Noop for now. Just ensures everything is uncompressed.
  Stream<EnvelopedMessage> decompress() async* {
    await for (final env in this) {
      if ((env.flags & compressedFlag) == compressedFlag) {
        throw ConnectException(
          Code.internal,
          "received compressed envelope, but do not know how to decompress",
        );
      }
      yield env;
    }
  }
}
