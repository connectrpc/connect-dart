## 0.3.0

- Add `Http2ClientTransport` to manage HTTP/2 connections using PING frames for keep alive. This resulted
  in a breaking change in `createHttpClient` of `package:connectrpc/http2.dart`. `SecurityContext` is no longer
  accepted, and instead replaced by a new `transport` option. The default transport (`Http2ClientTransport`)
  accepts a `SecurityContext`.
- Send a default `User-Agent` header on non web platforms.

## 0.2.1

- Fix the connectrpc path in example and internal package.

## 0.2.0

- Add compression support
- Fix an HTTP/2 bug where idle connections were not being closed.

## 0.1.0

- First release of Connect for Dart (alpha).
