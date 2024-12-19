//
//  Generated code. Do not modify.
//  source: idempotency.proto
//

import "package:connectrpc/connect.dart" as connect;
import "idempotency.pb.dart" as idempotency;

abstract final class ConnectService {
  /// Fully-qualified name of the ConnectService service.
  static const name = 'idempotency.ConnectService';

  static const getIdempotent = connect.Spec(
    '/$name/GetIdempotent',
    connect.StreamType.unary,
    idempotency.Idempotent.new,
    idempotency.Idempotent.new,
    idempotency: connect.Idempotency.noSideEffects,
  );

  static const updateIdempotent = connect.Spec(
    '/$name/UpdateIdempotent',
    connect.StreamType.unary,
    idempotency.Idempotent.new,
    idempotency.Idempotent.new,
    idempotency: connect.Idempotency.idempotent,
  );
}
