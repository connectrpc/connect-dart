//
//  Generated code. Do not modify.
//  source: bar/bar_service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "../foo/v1/foo.pb.dart" as foov1foo;
import "bar.pb.dart" as barbar;

abstract final class BarService {
  /// Fully-qualified name of the BarService service.
  static const name = 'bar.BarService';

  static const unaryBarWithFoo = connect.Spec(
    '/$name/UnaryBarWithFoo',
    connect.StreamType.unary,
    foov1foo.Foo.new,
    barbar.Bar.new,
  );
}
