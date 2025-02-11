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

@TestOn('!js')
library;

import 'dart:async';
import 'dart:io';

import 'package:connectrpc/http2.dart';
import 'package:http2/http2.dart' as http2;
import 'package:test/test.dart';

void main() {
  late ServerSocket serverSocket;
  late Uri uri;
  List<http2.ServerTransportConnection> serverConns = [];
  List<http2.ServerTransportStream> serverStreams = [];
  setUp(() async {
    serverSocket = await ServerSocket.bind(
      InternetAddress.loopbackIPv4,
      0,
    );
    serverConns.clear();
    serverSocket.listen(
      (socket) {
        final conn = http2.ServerTransportConnection.viaSocket(socket);
        serverConns.add(conn);
        conn.incomingStreams.listen((stream) {
          stream.outgoingMessages.close().ignore();
          stream.incomingMessages.drain<void>().ignore();
          serverStreams.add(stream);
        });
      },
      cancelOnError: true,
      onError: (Object error) {
        fail('Error in server listen: $error');
      },
    );
    uri = Uri.parse('http://${serverSocket.address.host}:${serverSocket.port}');
  });
  tearDown(() async {
    await serverSocket.close();
  });
  test('reuse the same connection', () async {
    final transport = Http2ClientTransport();
    final req1 = await transport.request(uri);
    await req1.close();
    final req2 = await transport.request(uri);
    await req2.close();
    expect(serverConns.length, equals(1));
    expect(serverStreams.length, equals(2));
  });
  test('idleConnectionTimeout', () async {
    final transport = Http2ClientTransport(
      idleConnectionTimeout: Duration(milliseconds: 5),
    );
    var req = await transport.request(uri);
    await req.close();
    // wait for idle timeout
    await Future<void>.delayed(Duration(milliseconds: 7));
    // new request should open new connection without errors
    req = await transport.request(uri);
    await req.close();
    await serverSocket.close();
    expect(serverConns.length, equals(2));
  });
}

extension on Http2ClientTransport {
  Future<http2.ClientTransportStream> request(Uri uri) {
    return makeRequest(uri, [
      http2.Header.ascii(':method', 'POST'),
      http2.Header.ascii(':scheme', uri.scheme),
      http2.Header.ascii(':authority', uri.host),
      http2.Header.ascii(
        ':path',
        [uri.path, if (uri.hasQuery) uri.query].join("?"),
      ),
    ]);
  }
}

extension on http2.ClientTransportStream {
  Future<void> close() {
    return Future.wait([
      outgoingMessages.close(),
      incomingMessages.drain<void>(),
    ]);
  }
}
