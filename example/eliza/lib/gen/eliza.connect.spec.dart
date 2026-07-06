//
//  Generated code. Do not modify.
//  source: eliza.proto
//

import "package:connectrpc/connect.dart" as connect;
import "eliza.pb.dart" as eliza;

abstract final class ElizaService {
  /// Fully-qualified name of the ElizaService service.
  static const name = 'connectrpc.eliza.v1.ElizaService';

  static const say = connect.Spec(
    '/$name/Say',
    connect.StreamType.unary,
    eliza.SayRequest.new,
    eliza.SayResponse.new,
  );
}
