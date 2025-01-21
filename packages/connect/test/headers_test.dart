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

import 'package:connectrpc/connect.dart';
import 'package:test/test.dart';

void main() {
  testHeaders('_Headers', () => Headers());
}

void testHeaders(String instanceName, Headers Function() factory) {
  group('Headers test for: $instanceName', () {
    group('get', () {
      test('names are case insensitive', () {
        final headers = factory();
        const contentType = "application/proto";
        headers['Content-Type'] = contentType;
        expect(headers['content-type'], equals(contentType));
        expect(headers['Content-Type'], equals(contentType));
        expect(headers['Content-type'], equals(contentType));
        expect(headers.entries.toList().length, equals(1));
      });
      test('returns all the headers', () {
        final headers = factory();
        const name = "accept-encoding";
        headers.add(name, "gzip");
        headers.add(name, "brotli");
        expect(headers.get(name), equals(["gzip", "brotli"]));
      });
      test('only returns headers at the call time', () {
        final headers = factory();
        const name = "accept-encoding";
        headers.add(name, "gzip");
        headers.add(name, "brotli");
        final encodings = headers.get(name);
        expect(encodings, equals(["gzip", "brotli"]));
        headers.add(name, "zstd");
        expect(encodings, equals(["gzip", "brotli"]));
        expect(headers.get(name), equals(["gzip", "brotli", "zstd"]));
      });
    });
    test('entries', () {
      final headers = factory();
      const encodingHeaderName = "accept-encoding";
      headers.add(encodingHeaderName, "gzip");
      headers.add(encodingHeaderName, "brotli");
      const contentTypeHeaderName = "content-type";
      headers.add(contentTypeHeaderName, "application/proto");
      expect(
        headers.entries,
        containsAll([
          (name: encodingHeaderName, value: "gzip"),
          (name: encodingHeaderName, value: "brotli"),
          (name: contentTypeHeaderName, value: "application/proto"),
        ]),
      );
    });
  });
}
