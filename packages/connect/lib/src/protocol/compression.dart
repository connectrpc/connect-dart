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
import '../compression.dart';
import '../exception.dart';
import '../headers.dart';
import '../http.dart';
import 'envelope.dart';

/// Indicates that the data in a EnvelopedMessage is
/// compressed. It has the same meaning in the gRPC-Web, gRPC-HTTP2,
/// and Connect protocols.
///
const compressedFlag = 1; // 0b00000001

extension EnvelopeStreamCompression on Stream<EnvelopedMessage> {
  /// Decompressess the envoloped messaged if the [compression] is not null and
  /// the envelope is compressed.
  Stream<EnvelopedMessage> decompress(
    Compression? compression,
  ) async* {
    await for (final env in this) {
      if (env.flags & compressedFlag == compressedFlag) {
        if (compression == null) {
          throw ConnectException(
            Code.internal,
            "received compressed envelope, but do not know how to decompress",
          );
        }
        yield EnvelopedMessage(
          env.flags ^ compressedFlag,
          compression.decode(env.data),
        );
      } else {
        yield env;
      }
    }
  }

  /// Compresses an uncompressed enveloped message using the given
  /// [compression].
  Stream<EnvelopedMessage> compress(
    Compression? compression,
  ) {
    if (compression == null) {
      return this;
    }
    return (() async* {
      await for (final env in this) {
        yield EnvelopedMessage(
          env.flags | compressedFlag,
          compression.encode(env.data),
        );
      }
    })();
  }
}

extension FindCompression on HttpResponse {
  Compression? findCompression(List<Compression> accept, String headerKey) {
    final encoding = header[headerKey];
    if (encoding != null && encoding.toLowerCase() != 'identity') {
      final i = accept.indexWhere((c) => c.name == encoding);
      if (i < 0) {
        throw ConnectException(
          Code.internal,
          'unsupported response encoding "$encoding"',
          metadata: header,
        );
      }
      return accept[i];
    }
    return null;
  }
}
