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
    var buffer = Uint8List(0);
    await for (final chunk in this) {
      buffer = _append(buffer, chunk);
      while (true) {
        final header = _peekHeader(buffer);
        if (header == null) {
          break;
        }
        EnvelopedMessage? env;
        (env, buffer) = _shiftEnvelope(buffer, header);
        if (env == null) {
          break;
        }
        yield env;
      }
    }
    if (buffer.lengthInBytes > 0) {
      final header = _peekHeader(buffer);
      var message = "protocol error: incomplete envelope";
      if (header != null) {
        message =
            'protocol error: promised ${header.length} bytes in enveloped message, got ${buffer.lengthInBytes - 5} bytes';
      }
      throw ConnectException(Code.invalidArgument, message);
    }
  }

  static Uint8List _append(Uint8List buffer, Uint8List other) {
    final result = Uint8List(buffer.length + other.length);
    result.setAll(0, buffer);
    result.setAll(buffer.length, other);
    return result;
  }

  static ({int length, int flags})? _peekHeader(Uint8List buffer) {
    if (buffer.lengthInBytes < 5) {
      return null;
    }
    final data = ByteData.sublistView(buffer);
    return (length: data.getUint32(1), flags: data.getUint8(0));
  }

  /// Returns the enveloped message if complete and the remaining buffer
  static (EnvelopedMessage?, Uint8List) _shiftEnvelope(
    Uint8List buffer,
    ({int length, int flags}) header,
  ) {
    if (buffer.lengthInBytes < 5 + header.length) {
      return (null, buffer);
    }
    return (
      EnvelopedMessage(
        header.flags,
        Uint8List.sublistView(buffer, 5, 5 + header.length),
      ),
      Uint8List.sublistView(buffer, 5 + header.length)
    );
  }
}
