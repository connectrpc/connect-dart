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

/// Conformance runner args.
final class ConformanceArgs {
  /// Path to the config file in YAML format with supported features.
  final String? config;

  /// Patterns indicating the name of test cases that are known to fail.
  ///
  /// These test cases will be required to fail for the run to be successful.
  final List<String>? knownFailing;

  /// Patterns indicating the name of test cases to run
  ///
  /// When absent, all tests are run (other than indicated by [skip]);
  final List<String>? run;

  /// Patterns indicating the name of test cases to skip.
  ///
  /// When absent, no tests are skipped.
  final List<String>? skip;

  /// If true, full HTTP traces will be captured and shown alongside failing test cases.
  final bool? trace;

  /// Enables verbose output
  final bool? verbose;

  ConformanceArgs({
    this.run,
    this.skip,
    this.config,
    this.trace,
    this.verbose,
    this.knownFailing,
  });

  List<String> toList() {
    return [
      if (config != null) ...['--conf', config!],
      if (run != null) ...['--run', ...run!],
      if (skip != null) ...['--skip', ...skip!],
      if (knownFailing != null) ...['--known-failing', ...knownFailing!],
      if (trace == true) '--trace',
      if (verbose == true) '--verbose',
    ];
  }
}
