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

import '../headers.dart';

extension Demux on Headers {
  /// In unary RPCs, Connect transports trailing metadata as response header
  /// fields, prefixed with "trailer-".
  ///
  /// This function demuxes headers and trailers into two separate [Headers]
  /// objects.
  ({Headers headers, Headers trailers}) demux() {
    final h = Headers();
    final t = Headers();
    for (final header in entries) {
      if (header.name.startsWith('trailer-')) {
        t.add(header.name.substring("trailer-".length), header.value);
      } else {
        h.add(header.name, header.value);
      }
    }
    return (headers: h, trailers: t);
  }
}
