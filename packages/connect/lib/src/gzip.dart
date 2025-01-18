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

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'compression.dart';

/// [Compression] that supports gzip compression algorithm.
final class GzipCompression extends Codec<Uint8List, Uint8List>
    implements Compression {
  final GZipCodec _codec;
  late final _Converter _encoder = _Converter(_codec.encoder);
  late final _Converter _decoder = _Converter(_codec.decoder);

  GzipCompression({GZipCodec? codec}) : _codec = codec ?? gzip;
  @override
  String get name => "gzip";

  @override
  Converter<Uint8List, Uint8List> get decoder => _decoder;

  @override
  Converter<Uint8List, Uint8List> get encoder => _encoder;
}

final class _Converter extends Converter<Uint8List, Uint8List> {
  final Converter<List<int>, List<int>> converter;
  const _Converter(this.converter);
  @override
  Uint8List convert(Uint8List input) {
    return Uint8List.fromList(converter.convert(input));
  }
}
