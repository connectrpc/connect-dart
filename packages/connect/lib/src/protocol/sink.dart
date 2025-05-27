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

import 'package:connectrpc/connect.dart';

// True when compiled for the web (e.g. browsers).
const bool _isWeb = bool.fromEnvironment('dart.library.js_interop');

extension Read on Stream<Uint8List> {
  /// Combines all the chunks into a single [Uint8List].
  ///
  /// Some HTTP clients (for example browsers) transparently decompress
  /// responses, resulting in more bytes than indicated by the
  /// `Content-Length` header. To avoid false protocol errors in those
  /// environments, the over-length check is skipped when running on the web.
  /// This method still throws if fewer bytes than `expLength` are received.
  Future<Uint8List> toBytes(int? expLength) async {
    final chunks = <Uint8List>[];
    var actLength = 0;
    await for (final chunk in this) {
      chunks.add(chunk);
      actLength += chunk.length;
      if (!_isWeb && expLength != null && actLength > expLength) {
        throw ConnectException(
          Code.invalidArgument,
          'protocol error: promised $expLength bytes, received $actLength',
        );
      }
    }
    if (expLength != null && actLength < expLength) {
      throw ConnectException(
        Code.invalidArgument,
        'protocol error: promised $expLength bytes, received $actLength',
      );
    }
    final bytes = Uint8List(actLength);
    var offset = 0;
    for (final chunk in chunks) {
      bytes.setAll(offset, chunk);
      offset += chunk.length;
    }
    return bytes;
  }
}
