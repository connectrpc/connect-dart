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

/// DartLibrary describes a dart library that can be imported.
final class DartLibrary {
  /// Path used in the `import` statements.
  String path;

  /// Identifier for the path.
  ///
  /// ```dart
  ///   import "package:connectrpc/connect.dart" as connect;
  /// ```
  ///
  /// This denotes the identifier after `as`, in the example above
  /// this is `connect`.
  String ident;

  /// Produces an import symbol that can be passed to [GeneratedFile.p].
  ///
  /// Imported libraries are only added once.
  DartIdentifier import(String ident) {
    return DartIdentifier(this, ident);
  }

  DartLibrary(this.path, this.ident);
}

final class DartIdentifier {
  final DartLibrary library;
  final String ident;

  DartIdentifier(this.library, this.ident);

  @override
  String toString() {
    return '${library.ident}.$ident';
  }
}
