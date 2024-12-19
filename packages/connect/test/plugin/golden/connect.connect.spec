//
//  Generated code. Do not modify.
//  source: connect.proto
//

import "package:connectrpc/connect.dart" as connect;
import "connect.pb.dart" as connect$;

abstract final class ConnectService {
  /// Fully-qualified name of the ConnectService service.
  static const name = 'connect.ConnectService';

  static const getConnect = connect.Spec(
    '/$name/GetConnect',
    connect.StreamType.unary,
    connect$.Connect.new,
    connect$.Connect.new,
  );
}
