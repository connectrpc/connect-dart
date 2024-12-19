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
import '../codec.dart';
import '../exception.dart';
import 'envelope.dart';

/// ParsedEnvelopedMessage is the deserialized counterpart to an
/// [EnvelopedMessage].
///
/// It is either a [ParsedMessage], or an [EndStreamMessage]
/// typically distinguished by a flag on an enveloped message.
///
sealed class ParsedEnvelopedMessage<M extends Object, E extends Object> {}

/// Parsed message.
final class ParsedMessage<M extends Object, _ extends Object>
    implements ParsedEnvelopedMessage<M, _> {
  final M value;
  const ParsedMessage(this.value);
}

// End of stream message.
final class EndStreamMessage<_ extends Object, E extends Object>
    implements ParsedEnvelopedMessage<_, E> {
  final E value;
  const EndStreamMessage(this.value);
}

extension ParseEnvelope on Stream<EnvelopedMessage> {
  /// Parses envelopes into messages or custom end serialization.
  /// The end serialization will differ by protocol.
  Stream<ParsedEnvelopedMessage<M, E>>
      parse<M extends Object, E extends Object>(
    Codec codec,
    M Function() factory,
    int? endStreamFlag,
    E Function(Uint8List)? parseEnd,
  ) async* {
    await for (final EnvelopedMessage(flags: flags, data: data) in this) {
      if (endStreamFlag != null && (flags & endStreamFlag) == endStreamFlag) {
        if (parseEnd != null) {
          yield EndStreamMessage(parseEnd(data));
        }
        // skips the end-of-stream envelope
        continue;
      }
      yield ParsedMessage(codec.parse(data, factory));
    }
  }
}

extension SerializeEnvelope<M extends Object> on Stream<M> {
  /// Transforms messages into [EnvelopedMessage]s by
  /// serializaing them.
  Stream<EnvelopedMessage> serialize(Codec codec) async* {
    await for (final msg in this) {
      yield EnvelopedMessage(0, codec.encode(msg));
    }
  }
}

extension Parse on Codec {
  T parse<T extends Object>(Uint8List data, T Function() factory) {
    final t = factory();
    try {
      decode(data, t);
    } catch (err) {
      throw ConnectException.from(err, Code.internal);
    }
    return t;
  }
}
