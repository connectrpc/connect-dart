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

import 'dart:async';

import 'exception.dart';

/// A wrapper around [Completer] that can be used to track cancellations.
extension type Sentinel(Completer<ConnectException> _) {
  /// Creates a new sentinel.
  factory Sentinel.create() {
    return Sentinel(Completer<ConnectException>());
  }

  /// Rejects the sentinel.
  ///
  /// As soon as this is called all active and future
  /// [race] calls will throw the [err].
  ///
  /// Rejecting multiple times is a no-op.
  void reject(ConnectException err) {
    if (_.isCompleted) {
      return;
    }
    _.complete(err);
  }

  /// Throws if the sentinel is rejected ([reject]) before [other] is complete.
  /// Otherwise returns the value/error of [other].
  Future<T> race<T extends Object>(Future<T> other) async {
    final result = await Future.any([_.future, other]);
    if (_.isCompleted) {
      throw await _.future;
    }
    return result as T;
  }
}
