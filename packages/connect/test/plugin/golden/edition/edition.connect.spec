//
//  Generated code. Do not modify.
//  source: edition/edition.proto
//

import "package:connectrpc/connect.dart" as connect;
import "edition.pb.dart" as editionedition;

abstract final class EditionService {
  /// Fully-qualified name of the EditionService service.
  static const name = 'edition.EditionService';

  static const unary = connect.Spec(
    '/$name/Unary',
    connect.StreamType.unary,
    editionedition.Msg.new,
    editionedition.Msg.new,
  );
}
