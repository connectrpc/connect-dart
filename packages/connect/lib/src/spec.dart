// Copyright 2024-2025 The Connect Authors
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

/// Spec is a description of a client call.
final class Spec<I, O> {
  final String procedure; // for example, "/acme.foo.v1.FooService/Bar"
  final StreamType streamType;
  final Idempotency? idempotency;

  /// Returns a zeroed instance of [I]
  /// that is safe to update.
  final I Function() inputFactory;

  /// Returns a zeroed instance of [O]
  /// that is safe to update.
  final O Function() outputFactory;

  const Spec(
    this.procedure,
    this.streamType,
    this.inputFactory,
    this.outputFactory, {
    this.idempotency,
  });
}

/// StreamType describes whether the client, server, neither, or both is
/// streaming.
enum StreamType { unary, client, server, bidi }

/// Is this method side-effect-free (or safe in HTTP parlance), or just
/// idempotent, or neither? HTTP based RPC implementation may choose GET verb
/// for safe methods, and PUT verb for idempotent methods instead of the
/// default POST.
///
/// This enum matches the protobuf enum google.protobuf.MethodOptions.IdempotencyLevel,
/// defined in the well-known type google/protobuf/descriptor.proto, but
/// drops UNKNOWN.
enum Idempotency {
  /// Idempotent, no side effects.
  noSideEffects,

  /// Idempotent, but may have side effects.
  idempotent
}
