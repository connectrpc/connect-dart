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
  List<int> serverPings = [];
  setUp(() async {
    serverSocket = await ServerSocket.bind(
      InternetAddress.loopbackIPv4,
      0,
    );
    serverSocket.listen(
      (socket) {
        final conn = http2.ServerTransportConnection.viaSocket(socket);
        conn.onPingReceived.listen((id) => serverPings.add(id));
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
    serverConns.clear();
    serverStreams.clear();
    serverPings.clear();
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
  test('verify stale connections', () async {
    final transport = Http2ClientTransport(
      pingInterval: Duration(milliseconds: 5),
    );
    // issue a request and close it, then wait for more than pingInterval to trigger a verification
    final req1 = await transport.request(uri);
    await req1.close();
    await Future<void>.delayed(Duration(milliseconds: 10));
    serverPings.clear();
    final req2 = await transport.request(uri);
    expect(serverPings.length, greaterThan(0));
    await req2.close();
    expect(serverConns.length, equals(1));
  });
  test('open a new connection if verification fails', () async {
    final transport = Http2ClientTransport(
      pingTimeout: Duration.zero, // Intentionally unsatisfiable
      pingInterval: Duration(milliseconds: 5),
    );
    // issue a request and close it, then wait for more than pingInterval to trigger a verification
    final req1 = await transport.request(uri);
    await req1.close();
    await Future<void>.delayed(Duration(milliseconds: 50));
    serverPings.clear();
    final req2 = await transport.request(uri);
    await req2.close();
    expect(serverConns.length, equals(2));
  });
  group('PING frames', () {
    group('for open connections', () {
      test('should be sent', () async {
        final transport = Http2ClientTransport(
          pingInterval: Duration(milliseconds: 5),
        );
        final req = await transport.request(uri);
        await Future<void>.delayed(Duration(milliseconds: 50));
        expect(serverPings.length, greaterThanOrEqualTo(1));
        await req.close();
      });
      test(
        'should destroy the connection if not answered in time',
        () async {
          final transport = Http2ClientTransport(
            pingTimeout: Duration.zero,
            pingInterval: Duration(milliseconds: 5),
          );
          final req = await transport.request(uri);
          expect(
            req.incomingMessages,
            emitsError(anything),
          );
          req.terminate();
        },
      );
    });
    group('for idle connections', () {
      test('should not be sent by default', () async {
        final transport = Http2ClientTransport(
          pingInterval: Duration(milliseconds: 5),
        );
        final req = await transport.request(uri);
        await req.close();
        await Future<void>.delayed(Duration(milliseconds: 10));
        serverPings.clear();
        await Future<void>.delayed(Duration(milliseconds: 30));
        expect(serverPings.length, equals(0));
      });
      test('should be sent if pingIdleConnection is true', () async {
        final transport = Http2ClientTransport(
          pingInterval: Duration(milliseconds: 5),
          pingIdleConnections: true,
        );
        final req = await transport.request(uri);
        await req.close();
        await Future<void>.delayed(Duration(milliseconds: 10));
        serverPings.clear();
        await Future<void>.delayed(Duration(milliseconds: 50));
        expect(serverPings.length, greaterThanOrEqualTo(1));
      });
    });
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
