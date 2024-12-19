//
//  Generated code. Do not modify.
//  source: foo/v1/foo.proto
//

import "package:connectrpc/connect.dart" as connect;
import "foo.pb.dart" as foov1foo;

abstract final class FooService {
  /// Fully-qualified name of the FooService service.
  static const name = 'foo.v1.FooService';

  static const unaryFoo = connect.Spec(
    '/$name/UnaryFoo',
    connect.StreamType.unary,
    foov1foo.Foo.new,
    foov1foo.Foo.new,
  );

  static const serverFoo = connect.Spec(
    '/$name/ServerFoo',
    connect.StreamType.server,
    foov1foo.Foo.new,
    foov1foo.Foo.new,
  );

  static const clientFoo = connect.Spec(
    '/$name/ClientFoo',
    connect.StreamType.client,
    foov1foo.Foo.new,
    foov1foo.Foo.new,
  );

  static const bidiFoo = connect.Spec(
    '/$name/BidiFoo',
    connect.StreamType.bidi,
    foov1foo.Foo.new,
    foov1foo.Foo.new,
  );
}
