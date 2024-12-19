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

import 'dart:io' as io;

import 'package:http2/http2.dart' as http2;

/// A wrapper around [http2.ClientTransportConnection] that only
/// exposes [makeRequest].
///
/// This guarantees that no other methods are called on connections returned
/// by [Http2ClientTransportConnectionManager]. This keeps connection state
/// changes predictable and within the implementation
/// of a [Http2ClientTransportConnectionManager]
extension type Http2ClientTransportConnection(
    http2.ClientTransportConnection _) {
  /// Same as [http2.ClientTransportConnection]'s [makeRequest].
  http2.ClientTransportStream makeRequest(
    List<http2.Header> headers,
  ) =>
      _.makeRequest(headers);
}

/// A manager used to manage [http2.ClientTransportConnection]s.
abstract interface class Http2ClientTransportConnectionManager {
  factory Http2ClientTransportConnectionManager({io.SecurityContext? context}) =
      _Http2ClientTransportConnectionManager;

  /// Returns a [Http2ClientTransportConnection] connected to the
  /// given authority of the url, optionally using a secure connection
  /// if the url's scheme is 'https'.
  ///
  /// It may return the same connection on multiple calls.
  Future<Http2ClientTransportConnection> connect(Uri uri);
}

/// Default implementation, for now it create a new connection on each call
/// to [connect]. In the future we should use it to pool connections and manage
/// ping frames.
final class _Http2ClientTransportConnectionManager
    implements Http2ClientTransportConnectionManager {
  final io.SecurityContext? context;

  _Http2ClientTransportConnectionManager({this.context});

  @override
  Future<Http2ClientTransportConnection> connect(
    Uri uri,
  ) async {
    final socket = await _connectSocket(uri);
    return Http2ClientTransportConnection(
      http2.ClientTransportConnection.viaSocket(socket),
    );
  }

  Future<io.Socket> _connectSocket(Uri uri) async {
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
