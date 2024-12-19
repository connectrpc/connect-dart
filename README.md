# Connect-Dart

[![Build](https://github.com/connectrpc/connect-dart/actions/workflows/ci.yaml/badge.svg?branch=main)](https://github.com/connectrpc/connect-dart/actions/workflows/ci.yaml)
[![License](https://img.shields.io/badge/License-Apache_2.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

Connect-Dart is a slim library for using generated, type-safe, and idiomatic Dart clients to communicate with your app's servers using [Protocol Buffers (Protobuf)][protobuf]. It works with the [Connect][connect-protocol], [gRPC][grpc-protocol], and [gRPC-Web][grpc-web-protocol] protocol.

Given a simple Protobuf schema, Connect-Dart generates idiomatic dart:

<details><summary>Click to expand <code>eliza.connect.dart</code></summary>

```dart
extension type ElizaServiceClient(connect.Transport _transport) {
  Future<connectrpcelizav1eliza.SayResponse> say(
    connectrpcelizav1eliza.SayRequest input, {
    connect.Header? header,
    connect.AbortSignal? signal,
    Function(connect.Header)? onHeader,
    Function(connect.Header)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      const connect.Spec(
        '/$name/Say',
        connect.StreamType.unary,
        connectrpcelizav1eliza.SayRequest.new,
        connectrpcelizav1eliza.SayResponse.new,
      ),
      input,
      signal: signal,
      header: header,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  Stream<connectrpcelizav1eliza.ConverseResponse> converse(
    Stream<connectrpcelizav1eliza.ConverseRequest> input, {
    connect.Header? header,
    connect.AbortSignal? signal,
    Function(connect.Header)? onHeader,
    Function(connect.Header)? onTrailer,
  }) {
    return connect.Client(_transport).bidi(
      const connect.Spec(
        '/$name/Converse',
        connect.StreamType.bidi,
        connectrpcelizav1eliza.ConverseRequest.new,
        connectrpcelizav1eliza.ConverseResponse.new,
      ),
      input,
      signal: signal,
      header: header,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  Stream<connectrpcelizav1eliza.IntroduceResponse> introduce(
    connectrpcelizav1eliza.IntroduceRequest input, {
    connect.Header? header,
    connect.AbortSignal? signal,
    Function(connect.Header)? onHeader,
    Function(connect.Header)? onTrailer,
  }) {
    return connect.Client(_transport).server(
      const connect.Spec(
        '/$name/Introduce',
        connect.StreamType.server,
        connectrpcelizav1eliza.IntroduceRequest.new,
        connectrpcelizav1eliza.IntroduceResponse.new,
      ),
      input,
      signal: signal,
      header: header,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
```

</details>

This code can then be integrated with just a few lines:

```dart
void main() async {
    late ElizaServiceClient elizaClient;
    final response = await elizaClient.say(SayRequest(sentence: "Hey!"))
    print(response.message);
}
```

That’s it! You no longer need to manually define request/response models, write encode/decode methods, specify the exact path of your request, nor worry about the underlying networking transport for your applications!

## Quick Start

Head over to our [quick start tutorial][getting-started] to get started.
It only takes ~10 minutes to complete a working chat app that uses Connect-Dart!

## Documentation

Comprehensive documentation for everything, including
[interceptors][interceptors], [streaming][streaming], and [error handling][error-handling]
is available on the [connectrpc.com website][getting-started].

## Generation Options

| **Option**                     | **Type** | **Default** | **Details**                                                                |
|--------------------------------|:--------:|:-----------:|----------------------------------------------------------------------------|
| `keep_empty_files`             | Boolean  |   `false`   | Generate files even if the proto file doesn't have any service definitions |

## Example Apps

Example apps are available in [`/examples`](./examples). 

## Contributing

We'd love your help making Connect better!

Extensive instructions for building the library and generator plugins locally,
running tests, and contributing to the repository are available in our
[`CONTRIBUTING.md` guide](./.github/CONTRIBUTING.md). Please check it out
for details.

## Ecosystem

- [connect-swift]: Swift clients for idiomatic gRPC & Connect RPC
- [connect-kotlin]: Idiomatic gRPC & Connect RPCs for Kotlin
- [connect-es]: Type-safe APIs with Protobuf and TypeScript.
- [connect-go]: Service handlers and clients for GoLang
- [conformance]: Connect, gRPC, and gRPC-Web interoperability tests

## Status

This project is in alpha, and we will make a few changes as we gather feedback
from early adopters.

## Legal

Offered under the [Apache 2 license](/LICENSE).

[blog]: https://buf.build/blog/connect-a-better-grpc
[conformance]: https://github.com/connectrpc/conformance
[connect-go]: https://github.com/connectrpc/connect-go
[connect-protocol]: https://connectrpc.com/docs/protocol
[connect-swift]: https://github.com/connectrpc/connect-swift
[connect-kotlin]: https://github.com/connectrpc/connect-kotlin
[connect-es]: https://www.npmjs.com/package/@connectrpc/connect
[error-handling]: https://connectrpc.com/docs/dart/errors
[getting-started]: https://connectrpc.com/docs/dart/getting-started
[grpc-protocol]: https://github.com/grpc/grpc/blob/master/doc/PROTOCOL-HTTP2.md
[grpc-web-protocol]: https://github.com/grpc/grpc/blob/master/doc/PROTOCOL-WEB.md
[interceptors]: https://connectrpc.com/docs/dart/interceptors
[license]: https://github.com/connectrpc/connect-dart/blob/main/LICENSE
[protobuf]: https://developers.google.com/protocol-buffers
[protocol]: https://connectrpc.com/docs/protocol
[streaming]: https://connectrpc.com/docs/dart/using-clients#using-generated-clients
