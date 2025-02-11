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
import 'dart:io' as io;

import 'package:http2/http2.dart' as http2;

/// Transport for managing HTTP/2 connections.
abstract interface class Http2ClientTransport {
  /// The default implementation manages HTTP/2 connections and keeps them alive
  /// with PING frames.
  ///
  /// The logic is based on "Basic Keepalive" described in
  /// https://github.com/grpc/proposal/blob/0ba0c1905050525f9b0aee46f3f23c8e1e515489/A8-client-side-keepalive.md#basic-keepalive
  /// as well as the client channel arguments described in
  /// https://github.com/grpc/grpc/blob/8e137e524a1b1da7bbf4603662876d5719563b57/doc/keepalive.md
  factory Http2ClientTransport({
    io.SecurityContext context,
    Duration idleConnectionTimeout,
  }) = _Http2ClientTransport;

  /// Similar to [http2.ClientTransportConnection.makeRequest], but
  /// handles connectring to the server and issuing the request.
  ///
  /// Implementations can choose to manage the connections/streams
  /// however they see fit.
  ///
  /// The [uri] is only used for establishing the socket connection
  /// and any standard headers that can be derived from the [uri]
  /// must be sent via [headers], similar to what would be send to
  /// [http2.ClientTransportConnection.makeRequest].
  Future<http2.ClientTransportStream> makeRequest(
    Uri uri,
    List<http2.Header> headers,
  );
}

final class _Http2ClientTransport implements Http2ClientTransport {
  /// The [io.SecurityContext] passed to [io.SecureSocket.connect].
  final io.SecurityContext? context;

  /// Automatically close a connection if the time since the last request stream
  /// exceeds this value.
  ///
  /// Defaults to 15 minutes.
  ///
  /// This option is equivalent to GRPC_ARG_CLIENT_IDLE_TIMEOUT_MS of gRPC core.
  final Duration idleConnectionTimeout;

  _Http2ClientTransport({
    this.context,
    this.idleConnectionTimeout = const Duration(minutes: 15),
  });

  final originTransports = <String, _SingleOriginHttp2ClientTransport>{};

  @override
  Future<http2.ClientTransportStream> makeRequest(
    Uri uri,
    List<http2.Header> headers,
  ) {
    final key = '${uri.scheme}://${uri.host}:${uri.port}';
    var transport = originTransports[key];
    if (transport == null) {
      transport = _SingleOriginHttp2ClientTransport(
        uri,
        context,
        idleConnectionTimeout,
      );
      originTransports[key] = transport;
    }
    return transport.makeRequest(headers);
  }
}

final class _SingleOriginHttp2ClientTransport {
  final Uri uri;
  final io.SecurityContext? context;
  final Duration idleConnectionTimeout;

  Timer? idleTimer;
  Future<void>? connecting;
  http2.ClientTransportConnection? activeConnection;

  _SingleOriginHttp2ClientTransport(
    this.uri,
    this.context,
    this.idleConnectionTimeout,
  );

  Future<http2.ClientTransportStream> makeRequest(
    List<http2.Header> headers,
  ) async {
    /// Dart cannot infer non-nullability if we don't use a local variable
    var connection = activeConnection;
    while (connection == null || !connection.isOpen) {
      connecting ??= connect();
      try {
        await connecting;
      } finally {
        connecting = null;
      }
      connection = activeConnection;
    }
    return connection.makeRequest(headers);
  }

  Future<void> connect() async {
    final socket = await connectSocket();
    final connection = http2.ClientTransportConnection.viaSocket(socket);
    connection.onActiveStateChanged = (active) {
      if (active) {
        idleTimer?.cancel();
        idleTimer = null;
      } else {
        idleTimer = Timer(idleConnectionTimeout, () {
          connection.finish().ignore();
        });
      }
    };
    activeConnection = connection;
  }

  Future<io.Socket> connectSocket() async {
    var secure = uri.scheme == 'https';
    if (secure) {
      var secureSocket = await io.SecureSocket.connect(
        uri.host,
        uri.port,
        supportedProtocols: ['h2'],
        context: context,
      );
      if (secureSocket.selectedProtocol != 'h2') {
        throw Exception(
          'Failed to negogiate http/2 via alpn. Maybe server '
          "doesn't support http/2.",
        );
      }
      return secureSocket;
    } else {
      if (uri.scheme != "http") {
        throw Exception(
          'Unsupported scheme ${uri.scheme}, must be '
          'http or https',
        );
      }
      return await io.Socket.connect(uri.host, uri.port);
    }
  }
}
