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
  ///
  /// [idleConnectionTimeout] will close a connection if the time since the last request stream
  /// exceeds this value. Defaults to 15 minutes.
  ///
  /// [pingInterval] is interval to send PING frames to keep a connection alive.
  /// If a PING frame is not responded to within [pingTimeout], the connection and all open streams close.
  ///
  /// By default, no PING frames are sent. If a value is provided, PING frames
  /// are sent only for connections that have open streams, unless
  /// [pingIdleConnections] is enabled.
  ///
  /// Sensible values for [pingInterval] can be between 10 seconds and 2 hours,
  /// depending on your infrastructure.
  factory Http2ClientTransport({
    io.SecurityContext? context,
    Duration? pingInterval,
    Duration pingTimeout = const Duration(seconds: 15),
    bool pingIdleConnections = false,
    Duration idleConnectionTimeout = const Duration(minutes: 15),
  }) {
    return _Http2ClientTransport(
      context,
      _KeepAliveOptions(
        pingTimeout: pingTimeout,
        pingInterval: pingInterval,
        pingIdleConnections: pingIdleConnections,
        idleConnectionTimeout: idleConnectionTimeout,
      ),
    );
  }

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
  final io.SecurityContext? context;

  final _KeepAliveOptions options;

  _Http2ClientTransport(this.context, this.options);

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
        options,
      );
      originTransports[key] = transport;
    }
    return transport.makeRequest(headers);
  }
}

final class _SingleOriginHttp2ClientTransport {
  final Uri uri;
  final io.SecurityContext? context;

  final _KeepAliveOptions options;

  Future<void>? connecting;
  _KeepAliveConnection? activeConnection;
  DateTime? lastAliveAt;

  _SingleOriginHttp2ClientTransport(
    this.uri,
    this.context,
    this.options,
  );

  Future<http2.ClientTransportStream> makeRequest(
    List<http2.Header> headers,
  ) async {
    /// Dart cannot infer non-nullability if we don't use a local variable
    var connection = activeConnection;
    while (connection == null || !(await connection.verify())) {
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
    activeConnection = _KeepAliveConnection(connection, options);
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

final class _KeepAliveConnection {
  final http2.ClientTransportConnection connection;
  final _KeepAliveOptions options;

  bool idle = true;
  Timer? pingTimer;
  DateTime lastAliveAt = DateTime.now();
  Future<bool>? verifying;
  List<http2.ClientTransportStream> streams = [];

  _KeepAliveConnection(
    this.connection,
    this.options,
  ) {
    resetPingTimer();
    Timer? idleTimer;
    connection.onActiveStateChanged = (active) {
      idle = !active;
      if (active) {
        // We want to reset if it isn't already pinging
        if (options.pingInterval != null && !options.pingIdleConnections) {
          resetPingTimer();
        }
        idleTimer?.cancel();
        idleTimer = null;
      } else {
        if (!options.pingIdleConnections) {
          pingTimer?.cancel();
        }
        streams.clear();
        idleTimer = Timer(options.idleConnectionTimeout, () {
          connection.finish().ignore();
        });
      }
    };
  }

  http2.ClientTransportStream makeRequest(
    List<http2.Header> headers,
  ) {
    final stream = connection.makeRequest(headers);
    streams.add(stream);
    return stream;
  }

  void resetPingTimer() {
    final pingInterval = options.pingInterval;
    if (pingInterval == null) return;
    pingTimer?.cancel();
    pingTimer = Timer(pingInterval, () async {
      await ping();
      if (!idle || options.pingIdleConnections) {
        resetPingTimer();
      }
    });
  }

  Future<bool> ping() async {
    if (!connection.isOpen) {
      return false;
    }
    final responseTimer = Timer(options.pingTimeout, () {
      // Terminating the connection doesn't terminate the requests
      //
      // See: https://github.com/dart-lang/http/issues/1370
      connection.terminate(http2.ErrorCode.CANCEL).ignore();
    });
    // Ping returns a future that waits for the server to respond
    // for the PING.
    try {
      await connection.ping();
      responseTimer.cancel();
      lastAliveAt = DateTime.now();
      return true;
    } catch (_) {
      // `ping()` only throws if the connection is terminated.
      return false;
    }
  }

  Future<bool> verify() {
    final pingInterval = options.pingInterval;
    final durationSinceLastPing = DateTime.now().difference(lastAliveAt);
    final stale = pingInterval != null && durationSinceLastPing > pingInterval;
    if (connection.isOpen && !stale) {
      return Future.value(true);
    }
    try {
      return verifying ??= ping();
    } finally {
      verifying = null;
    }
  }
}

final class _KeepAliveOptions {
  final Duration pingTimeout;
  final Duration? pingInterval;
  final bool pingIdleConnections;
  final Duration idleConnectionTimeout;

  _KeepAliveOptions({
    required this.pingTimeout,
    required this.pingInterval,
    required this.pingIdleConnections,
    required this.idleConnectionTimeout,
  });
}
