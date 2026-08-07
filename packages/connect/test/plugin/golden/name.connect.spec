//
//  Generated code. Do not modify.
//  source: name.proto
//

import "package:connectrpc/connect.dart" as connect;
import "package:protobuf/well_known_types/google/protobuf/empty.pb.dart" as googleprotobufempty;

abstract final class NameService {
  /// Fully-qualified name of the NameService service.
  static const name = '.NameService';

  static const name$ = connect.Spec(
    '/$name/Name',
    connect.StreamType.unary,
    googleprotobufempty.Empty.new,
    googleprotobufempty.Empty.new,
  );

  static const getName = connect.Spec(
    '/$name/GetName',
    connect.StreamType.unary,
    googleprotobufempty.Empty.new,
    googleprotobufempty.Empty.new,
  );
}
