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

import 'package:conformance/conformance.dart';
import 'package:connectrpc/connect.dart';
import 'package:test/test.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';

void testClient(
  String clientName,
  ConformanceArgs args,
  Transport Function(ClientCompatRequest req) transportFactory,
) {
  test(
    'client conformance tests for $clientName',
    timeout: Timeout.none,
    () async {
      // Starts the conformance runner in an dart isolate
      // (runs in dart-vm outside the browser).
      //
      // The returned channel has undocumented behaviour which is
      // resulting in very obscure errors. To avoid that we limit the
      // usage and use websockets instead.
      final channel = spawnHybridUri(
        // relative won't work when imported by other packages.
        'package:conformance/src/test_hybrid.dart',
      );
      channel.sink.add(args.toList());
      final port = await channel.stream.first as int;
      final ws = WebSocketChannel.connect(Uri.parse('ws://localhost:$port'));
      await ws.ready;
      await for (final buffer in ws.stream) {
        final req = ClientCompatRequest.fromBuffer(buffer as List<int>);
        final res = ClientCompatResponse(testName: req.testName);
        try {
          final result = await invoke(transportFactory(req), req);
          res.response = result;
        } catch (err) {
          res.error = ClientErrorResult(message: '$err');
        }
        ws.sink.add(res.writeToBuffer());
      }
      expect(
        ws.closeCode,
        equals(status.normalClosure),
        reason: 'connectconformance exited with non-zero code',
      );
    },
  );
}
