// Copyright 2024 The Connect Authors
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

//
//  Generated code. Do not modify.
//  source: connectrpc/eliza/v1/eliza.proto
//

import "package:connectrpc/connect.dart" as connect;
import "eliza.pb.dart" as connectrpcelizav1eliza;

/// ElizaService provides a way to talk to Eliza, a port of the DOCTOR script
/// for Joseph Weizenbaum's original ELIZA program. Created in the mid-1960s at
/// the MIT Artificial Intelligence Laboratory, ELIZA demonstrates the
/// superficiality of human-computer communication. DOCTOR simulates a
/// psychotherapist, and is commonly found as an Easter egg in emacs
/// distributions.
abstract final class ElizaService {
  /// Fully-qualified name of the ElizaService service.
  static const name = 'connectrpc.eliza.v1.ElizaService';

  /// Say is a unary RPC. Eliza responds to the prompt with a single sentence.
  static const say = connect.Spec(
    '/$name/Say',
    connect.StreamType.unary,
    connectrpcelizav1eliza.SayRequest.new,
    connectrpcelizav1eliza.SayResponse.new,
    idempotency: connect.Idempotency.noSideEffects,
  );

  /// Converse is a bidirectional RPC. The caller may exchange multiple
  /// back-and-forth messages with Eliza over a long-lived connection. Eliza
  /// responds to each ConverseRequest with a ConverseResponse.
  static const converse = connect.Spec(
    '/$name/Converse',
    connect.StreamType.bidi,
    connectrpcelizav1eliza.ConverseRequest.new,
    connectrpcelizav1eliza.ConverseResponse.new,
  );

  /// Introduce is a server streaming RPC. Given the caller's name, Eliza
  /// returns a stream of sentences to introduce itself.
  static const introduce = connect.Spec(
    '/$name/Introduce',
    connect.StreamType.server,
    connectrpcelizav1eliza.IntroduceRequest.new,
    connectrpcelizav1eliza.IntroduceResponse.new,
  );
}
