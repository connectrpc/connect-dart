//
//  Generated code. Do not modify.
//  source: connectrpc/eliza/v1/eliza.proto
//

import "package:connectrpc/connect.dart" as connect;
import "eliza.pb.dart" as connectrpcelizav1eliza;
import "eliza.connect.spec.dart" as specs;

/// ElizaService provides a way to talk to Eliza, a port of the DOCTOR script
/// for Joseph Weizenbaum's original ELIZA program. Created in the mid-1960s at
/// the MIT Artificial Intelligence Laboratory, ELIZA demonstrates the
/// superficiality of human-computer communication. DOCTOR simulates a
/// psychotherapist, and is commonly found as an Easter egg in emacs
/// distributions.
extension type ElizaServiceClient(connect.Transport _transport) {
  /// Say is a unary RPC. Eliza responds to the prompt with a single sentence.
  Future<connectrpcelizav1eliza.SayResponse> say(
    connectrpcelizav1eliza.SayRequest input, {
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

  /// Converse is a bidirectional RPC. The caller may exchange multiple
  /// back-and-forth messages with Eliza over a long-lived connection. Eliza
  /// responds to each ConverseRequest with a ConverseResponse.
  Stream<connectrpcelizav1eliza.ConverseResponse> converse(
    Stream<connectrpcelizav1eliza.ConverseRequest> input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).bidi(
      specs.ElizaService.converse,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Introduce is a server streaming RPC. Given the caller's name, Eliza
  /// returns a stream of sentences to introduce itself.
  Stream<connectrpcelizav1eliza.IntroduceResponse> introduce(
    connectrpcelizav1eliza.IntroduceRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).server(
      specs.ElizaService.introduce,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
