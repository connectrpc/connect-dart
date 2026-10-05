//
//  Generated code. Do not modify.
//  source: nested.proto
//

import "package:connectrpc/connect.dart" as connect;
import "nested.pb.dart" as nested;

abstract final class NestedService {
  /// Fully-qualified name of the NestedService service.
  static const name = 'nested.NestedService';

  static const foo = connect.Spec(
    '/$name/Foo',
    connect.StreamType.unary,
    nested.OuterFoo_Middle.new,
    nested.OuterFoo_Middle_Inner.new,
  );

  static const bar = connect.Spec(
    '/$name/Bar',
    connect.StreamType.unary,
    nested.OuterBar_Middle.new,
    nested.OuterBar_Middle_Inner.new,
  );
}
