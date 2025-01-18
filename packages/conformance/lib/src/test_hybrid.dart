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
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:stream_channel/stream_channel.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';

/// More on this here: https://pub.dev/packages/test#browservm-hybrid-tests
void hybridMain(StreamChannel<dynamic> channel) async {
  final args = (await channel.stream.first as List<dynamic>).cast<String>();
  final runner = ConformanceRunner();
  final server = await io.serve(
    webSocketHandler((WebSocketChannel ws) async {
      await ws.ready;
      final read = ws.stream.asBroadcastStream();
      final write = ws.sink;
      final result = await runner.runClient(
        args: args,
        StreamTransformer.fromBind((requests) async* {
          await for (final request in requests) {
            final next = read.first;
            write.add(request.writeToBuffer());
            final result = await next as List<int>;
            yield ClientCompatResponse.fromBuffer(result);
          }
        }),
      );
      write.close(
        result == 0 ? status.normalClosure : status.internalServerError,
      );
    }),
    'localhost',
    0,
  );
  channel.sink.add(server.port);
}
