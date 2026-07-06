//
//  Generated code. Do not modify.
//  source: eliza.proto
//

import "package:connectrpc/connect.dart" as connect;
import "eliza.pb.dart" as eliza;
import "eliza.connect.spec.dart" as specs;

extension type ElizaServiceClient(connect.Transport _transport) {
  Future<eliza.SayResponse> say(
    eliza.SayRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ElizaService.say,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
