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
import 'dart:typed_data';

import 'package:connectrpc/connect.dart';
import 'package:connectrpc/protobuf.dart';
import 'package:connectrpc/protocol/grpc_web.dart' as web;
import 'package:connectrpc/src/grpc/trailer_error.dart';
import 'package:connectrpc/src/protocol/envelope.dart';
import 'package:protobuf/well_known_types/google/protobuf/wrappers.pb.dart';
import 'package:test/test.dart';

const _stream = Spec(
  '/TestService/ServerStream',
  StreamType.server,
  StringValue.new,
  StringValue.new,
);

void main() {
  for (final (name, values) in [
    ('invalid status', {'grpc-status': 'invalid'}),
    (
      'invalid base64',
      {'grpc-status': '16', 'grpc-status-details-bin': 'invalid@'},
    ),
    (
      'invalid status protobuf',
      {'grpc-status': '16', 'grpc-status-details-bin': 'AA=='},
    ),
    ('invalid percent escape', {'grpc-status': '16', 'grpc-message': '%'}),
  ]) {
    test('metadata parsing preserves typed failure and headers: $name', () {
      final headers = Headers();
      values.forEach(headers.add);
      expect(
        () => headers.findError(const StatusParser()),
        throwsA(
          isA<ConnectException>()
              .having((error) => error.code, 'code', Code.internal)
              .having(
                (error) => error.metadata['grpc-status'],
                'original status',
                values['grpc-status'],
              )
              .having(
                (error) => error.cause,
                'metadata parse cause',
                isA<MetadataParseFailure>(),
              ),
        ),
      );
    });

    test('gRPC-Web stream preserves the metadata failure: $name', () async {
      final trailer =
          values.entries
              .map((entry) => '${entry.key}: ${entry.value}\r\n')
              .join();
      final transport = _transport([
        ..._message('before-error'),
        ...encodeEnvelope(128, Uint8List.fromList(utf8.encode(trailer))),
      ]);
      final response = await transport.stream(
        _stream,
        Stream.value(StringValue()),
      );
      final messages = <String>[];
      await expectLater(
        response.message
            .map((message) => messages.add(message.value))
            .drain<void>(),
        throwsA(
          isA<ConnectException>()
              .having((error) => error.code, 'code', Code.internal)
              .having(
                (error) => error.metadata['grpc-status'],
                'original status',
                values['grpc-status'],
              )
              .having(
                (error) => error.cause,
                'metadata parse cause',
                isA<MetadataParseFailure>(),
              ),
        ),
      );
      expect(messages, ['before-error']);
    });
  }

  test('malformed trailer UTF8 is a typed metadata failure', () async {
    final transport = _transport([
      ..._message('before-error'),
      ...encodeEnvelope(128, Uint8List.fromList([0xff])),
    ]);
    final response = await transport.stream(
      _stream,
      Stream.value(StringValue()),
    );
    await expectLater(
      response.message.toList(),
      throwsA(
        isA<ConnectException>()
            .having((error) => error.code, 'code', Code.internal)
            .having(
              (error) => error.cause,
              'metadata parse cause',
              isA<MetadataParseFailure>(),
            ),
      ),
    );
  });

  test('truncated envelope remains a transport failure', () async {
    final frame = _message('incomplete');
    final transport = _transport(frame.sublist(0, frame.length - 1));
    final response = await transport.stream(
      _stream,
      Stream.value(StringValue()),
    );
    await expectLater(
      response.message.toList(),
      throwsA(
        isA<ConnectException>().having((error) => error.cause, 'cause', isNull),
      ),
    );
  });

  test('normal server INTERNAL is not a metadata parse failure', () {
    final headers = Headers()..['grpc-status'] = '13';
    final error = headers.findError(const StatusParser())!;
    expect(error.code, Code.internal);
    expect(error.cause, isNull);
  });

  test('a response body FormatException is not a metadata failure', () async {
    const failure = FormatException('body read failed');
    final transport = web.Transport(
      baseUrl: 'https://example.com',
      codec: const ProtoCodec(),
      statusParser: const StatusParser(),
      httpClient:
          (_) async => HttpResponse(
            200,
            Headers()..['content-type'] = 'application/grpc-web+proto',
            Stream<Uint8List>.error(failure),
            Headers(),
          ),
    );
    final response = await transport.stream(
      _stream,
      Stream.value(StringValue()),
    );
    await expectLater(response.message.toList(), throwsA(same(failure)));
  });

  test(
    'a non-success HTTP response preserves malformed message metadata',
    () async {
      final transport = web.Transport(
        baseUrl: 'https://example.com',
        codec: const ProtoCodec(),
        statusParser: const StatusParser(),
        httpClient:
            (_) async => HttpResponse(
              503,
              Headers()..['grpc-message'] = '%',
              const Stream<Uint8List>.empty(),
              Headers(),
            ),
      );
      await expectLater(
        transport.stream(_stream, Stream.value(StringValue())),
        throwsA(
          isA<ConnectException>()
              .having((error) => error.code, 'code', Code.internal)
              .having(
                (error) => error.cause,
                'metadata parse cause',
                isA<MetadataParseFailure>(),
              ),
        ),
      );
    },
  );

  test('normal UNAUTHENTICATED retains its authentication status', () {
    final headers = Headers()..['grpc-status'] = '16';
    final error = headers.findError(const StatusParser())!;
    expect(error.code, Code.unauthenticated);
    expect(error.cause, isNull);
  });

  test('a truncated protobuf payload is not a metadata failure', () async {
    final transport = _transport(encodeEnvelope(0, Uint8List.fromList([0x80])));
    final response = await transport.stream(
      _stream,
      Stream.value(StringValue()),
    );
    await expectLater(
      response.message.toList(),
      throwsA(
        isA<ConnectException>()
            .having((error) => error.code, 'code', Code.internal)
            .having(
              (error) => error.cause,
              'payload cause',
              isNot(isA<MetadataParseFailure>()),
            ),
      ),
    );
  });

  test('a normal HTTP 503 remains unavailable', () async {
    final transport = web.Transport(
      baseUrl: 'https://example.com',
      codec: const ProtoCodec(),
      statusParser: const StatusParser(),
      httpClient:
          (_) async => HttpResponse(
            503,
            Headers(),
            const Stream<Uint8List>.empty(),
            Headers(),
          ),
    );
    await expectLater(
      transport.stream(_stream, Stream.value(StringValue())),
      throwsA(
        isA<ConnectException>()
            .having((error) => error.code, 'code', Code.unavailable)
            .having((error) => error.cause, 'cause', isNull),
      ),
    );
  });

  test('successful fragmented stream stays successful', () async {
    final transport = _transport([
      ..._message('first'),
      ..._message('second'),
      ...encodeEnvelope(
        128,
        Uint8List.fromList(ascii.encode('grpc-status: 0\r\n')),
      ),
    ]);
    final response = await transport.stream(
      _stream,
      Stream.value(StringValue()),
    );
    final messages =
        await response.message.map((message) => message.value).toList();
    expect(messages, ['first', 'second']);
  });
}

Uint8List _message(String value) =>
    encodeEnvelope(0, StringValue(value: value).writeToBuffer());

web.Transport _transport(List<int> body) => web.Transport(
  baseUrl: 'https://example.com',
  codec: const ProtoCodec(),
  statusParser: const StatusParser(),
  httpClient:
      (_) async => HttpResponse(
        200,
        Headers()..['content-type'] = 'application/grpc-web+proto',
        Stream.fromIterable(body.map((byte) => Uint8List.fromList([byte]))),
        Headers(),
      ),
);
