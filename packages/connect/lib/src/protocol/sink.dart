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

import 'package:connectrpc/connect.dart';

extension Read on Stream<Uint8List> {
  /// Combines all the chunks into a single [Uint8List].
  Future<Uint8List> toBytes(int? expLength) async {
    final chunks = <Uint8List>[];
    var actLength = 0;
    await for (final chunk in this) {
      chunks.add(chunk);
      actLength += chunk.length;
      if (expLength != null && actLength > expLength) {
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
