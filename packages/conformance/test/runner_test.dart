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

import 'package:conformance/conformance.dart';
import 'package:conformance/runner.dart';
import 'package:test/test.dart';

void main() {
  test(
    'runner should exit with non-zero code on failed cases',
    () async {
      final conformance = ConformanceRunner();
      final result = await conformance.runClient(
        StreamTransformer.fromBind(
          (requests) => requests.map(
            (req) => ClientCompatResponse(testName: req.testName),
          ),
        ),
        args: ConformanceArgs(
          run: [
            "Basic/HTTPVersion:1/Protocol:PROTOCOL_CONNECT/Codec:CODEC_PROTO/Compression:COMPRESSION_IDENTITY/TLS:true/unary/empty-definition",
          ],
        ).toList(),
      );
      expect(result, isNot(0)); // We expect this to fail.
    },
  );
}
