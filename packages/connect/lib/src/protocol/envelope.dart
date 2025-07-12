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
import 'dart:typed_data';

import '../code.dart';
import '../exception.dart';

/// Represents an Enveloped-Message of the Connect protocol.
/// https://connectrpc.com/docs/protocol#streaming-rpcs
final class EnvelopedMessage {
  /// Envelope-Flags, a set of 8 bitwise flags.
  final int flags;

  /// Raw data of the message that was enveloped.
  final Uint8List data;

  const EnvelopedMessage(this.flags, this.data);
}

/// Encode a single enveloped message.
Uint8List encodeEnvelope(int flags, Uint8List data) {
  final bytes = Uint8List(data.length + 5);
  bytes.setAll(5, data);
  final v = ByteData.sublistView(bytes);
  v.setUint8(0, flags); // first byte is flags
  v.setUint32(1, data.length); // 4 bytes message length
  return bytes;
}

extension JoinEnvelope on Stream<EnvelopedMessage> {
  /// Turns the [EnvelopedMessage]s to their wire form.
  Stream<Uint8List> joinEnvelope() async* {
    await for (final env in this) {
      yield encodeEnvelope(env.flags, env.data);
    }
  }
}

extension SplitEnvelope on Stream<Uint8List> {
  /// Splits the stream into [EnvelopedMessage]s.
  ///
  /// The returned stream raises an error
  /// - if the stream ended before an enveloped message fully arrived,
  /// - or if the stream ended with extraneous data.
  Stream<EnvelopedMessage> splitEnvelope() async* {
    final header = Uint8List(5);
    var headerLen = 0;
    var dataLen = 0;
    EnvelopedMessage? env;
    await for (var chunk in this) {
      while (chunk.isNotEmpty) {
        // We are waiting for the next heeader
        if (env == null) {
          final needLen = 5 - headerLen;
          // If we have to read more to get the header.
          if (chunk.length < needLen) {
            header.setAll(headerLen, chunk);
            headerLen += chunk.length;
            break;
          }
          header.setAll(
            headerLen,
            Uint8List.sublistView(chunk, 0, needLen),
          );
          headerLen = 5;
          final (:flags, :length) = _readHeader(header);
          env = EnvelopedMessage(
            flags,
            Uint8List(length),
          );
          // Reset data length and update chunk to reflect remaining data.
          dataLen = 0;
          chunk = Uint8List.sublistView(chunk, needLen);
        }
        // We are reading the envelope.
        final needLen = env.data.length - dataLen;
        // If we have to read more to complete the envelope.
        if (chunk.length < needLen) {
          env.data.setAll(dataLen, chunk);
          dataLen += chunk.length;
          break;
        }
        // We can complete the envelope.
        env.data.setAll(
          dataLen,
          Uint8List.sublistView(chunk, 0, needLen),
        );
        yield env;
        // Reset the header and chunk and continue processing.
        env = null;
        headerLen = 0;
        chunk = Uint8List.sublistView(chunk, needLen);
      }
    }
    if (headerLen > 0) {
      var message = "protocol error: incomplete envelope";
      if (headerLen == 5) {
        final (flags: _, :length) = _readHeader(header);
        message =
            'protocol error: promised $length bytes in enveloped message, got $dataLen bytes';
      }
      throw ConnectException(Code.invalidArgument, message);
    }
  }

  static ({int length, int flags}) _readHeader(Uint8List buffer) {
    final data = ByteData.sublistView(buffer);
    return (length: data.getUint32(1), flags: data.getUint8(0));
  }
}
