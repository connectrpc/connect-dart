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

import 'dart:async';

import 'code.dart';
import 'exception.dart';

/// Notifies when an operation is aborted.
abstract interface class AbortSignal {
  /// An optional deadline, if signal is time bound.
  DateTime? get deadline;

  /// The future that completes when the signal is aborted.
  ///
  /// The returned value is the reason.
  Future<ConnectException> get future;
}

/// An [AbortSignal] that is triggered by calling the [cancel] method.
///
/// The signal is also trigerred when the [parent] gets cancelled.
final class CancelableSignal with _AbortSignal {
  final _completer = Completer<ConnectException>();

  /// Cancels the signal. [reason] is used to dereive
  /// the result of the [future], using [ConnectException.from].
  ///
  /// Noop after the first call.
  void cancel([Object? reason]) {
    if (_completer.isCompleted) return;
    _completer.complete(
      super.errorFromReason(
        reason,
        Code.canceled,
        'operation canceled',
      ),
    );
  }

  CancelableSignal({AbortSignal? parent}) {
    _deadline = parent?.deadline;
    _future = parent == null
        ? _completer.future
        : Future.any(
            [parent.future, _completer.future],
          );
  }
}

/// An [AbortSignal] that aborts at a specific time.
///
/// The signal will be trigerred before the deadline if the
/// [parent] aborts.
final class DeadlineSignal with _AbortSignal {
  DeadlineSignal(
    DateTime deadline, {
    AbortSignal? parent,
    Object? reason,
  }) {
    _deadline = switch (parent?.deadline) {
      final pDeadline? when pDeadline.isBefore(deadline) => pDeadline,
      _ => deadline,
    };
    final future = Future.delayed(
      deadline.difference(DateTime.now()),
      () => super.errorFromReason(
        reason,
        Code.deadlineExceeded,
        "operation exceeded deadline",
      ),
    );
    _future = parent == null ? future : Future.any([parent.future, future]);
  }
}

/// An [AbortSignal] that aborts after a certain duration has elapsed.
///
/// The signal will be trigerred before the deadline if the
/// [parent] aborts.
final class TimeoutSignal with _AbortSignal {
  TimeoutSignal(Duration timeout, {AbortSignal? parent, Object? reason}) {
    final deadline = DateTime.now().add(timeout);
    _deadline = switch (parent?.deadline) {
      final pDeadline? when pDeadline.isBefore(deadline) => pDeadline,
      _ => deadline,
    };
    final future = Future.delayed(
      timeout,
      () => super.errorFromReason(
        reason,
        Code.deadlineExceeded,
        'operation timed out',
      ),
    );
    _future = parent == null ? future : Future.any([parent.future, future]);
  }
}

mixin class _AbortSignal implements AbortSignal {
  late final DateTime? _deadline;
  late final Future<ConnectException> _future;

  @override
  DateTime? get deadline => _deadline;
  @override
  Future<ConnectException> get future => _future;

  ConnectException errorFromReason(Object? reason, Code code, String message) {
    return reason != null
        ? ConnectException.from(reason, code)
        : ConnectException(code, message);
  }
}
