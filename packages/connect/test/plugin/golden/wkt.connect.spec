//
//  Generated code. Do not modify.
//  source: wkt.proto
//

import "package:connectrpc/connect.dart" as connect;
import "google/protobuf/any.pb.dart" as googleprotobufany;
import "google/protobuf/timestamp.pb.dart" as googleprotobuftimestamp;

abstract final class WktService {
  /// Fully-qualified name of the WktService service.
  static const name = 'wkt.WktService';

  static const unaryWkt = connect.Spec(
    '/$name/UnaryWkt',
    connect.StreamType.unary,
    googleprotobufany.Any.new,
    googleprotobuftimestamp.Timestamp.new,
  );
}
