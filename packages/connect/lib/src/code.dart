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

/// Connect represents categories of errors as codes, and each code maps to a
/// specific HTTP status code. The codes and their semantics were chosen to
/// match gRPC. Only the codes below are valid — there are no user-defined
/// codes.
///
/// See the specification at https://connectrpc.com/docs/protocol#error-codes
/// for details.
enum Code {
  /// Canceled, usually be the user
  canceled(1, 'canceled'),

  /// Unknown error
  unknown(2, 'unknown'),

  /// Argument invalid regardless of system state
  invalidArgument(3, 'invalid_argument'),

  /// Operation expired, may or may not have completed.
  deadlineExceeded(4, 'deadline_exceeded'),

  /// Entity not found.
  notFound(5, 'not_found'),

  /// Entity already exists.
  alreadyExists(6, 'already_exists'),

  /// Operation not authorized.
  permissionDenied(7, 'permission_denied'),

  /// Quota exhausted.
  resourceExhausted(8, 'resource_exhausted'),

  /// Argument invalid in current system state.
  failedPrecondition(9, 'failed_precondition'),

  /// Operation aborted.
  aborted(10, 'aborted'),

  /// Out of bounds, use instead of FailedPrecondition.
  outOfRange(11, 'out_of_range'),

  /// Operation not implemented or disabled.
  unimplemented(12, 'unimplemented'),

  /// Internal error, reserved for "serious errors".
  internal(13, 'internal'),

  /// Unavailable, client should back off and retry.
  unavailable(14, 'unavailable'),

  /// Unrecoverable data loss or corruption.
  dataLoss(15, 'data_loss'),

  /// Request isn't authenticated.
  unauthenticated(16, 'unauthenticated');

  const Code(this.value, this.name);

  /// Numerical value of the enum.
  final int value;
  // Name is the string value of the enum.
  final String name;
}
