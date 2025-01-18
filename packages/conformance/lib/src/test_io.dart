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

import 'dart:async';

import 'package:conformance/conformance.dart';
import 'package:conformance/runner.dart';
import 'package:connectrpc/connect.dart';
import 'package:test/test.dart';

void testClient(
  String description,
  ConformanceArgs args,
  Transport Function(ClientCompatRequest req) transportFactory,
) {
  test(
    description,
    timeout: Timeout.none,
    () async {
      final runner = ConformanceRunner();
      final result = await runner.runClient(
        args: args.toList(),
        StreamTransformer.fromBind(
          (requests) async* {
            await for (final req in requests) {
              final res = ClientCompatResponse(testName: req.testName);
              try {
                final result = await invoke(transportFactory(req), req);
                res.response = result;
              } catch (err) {
                res.error = ClientErrorResult(message: '$err');
              }
              yield res;
            }
          },
        ),
      );
      expect(
        result,
        equals(0),
        reason: 'connectconformance exited with a non-zero code',
      );
    },
  );
}
