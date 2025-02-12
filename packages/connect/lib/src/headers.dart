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

/// Headers and Trailers for HTTP requests and responses.
///
/// Names are always in lowercase.
abstract interface class Headers {
  /// Creates an empty [Headers] instance.
  ///
  /// The instance's [get] returns an efficient [Iterable] with a view
  /// of the values at the time it was called.
  factory Headers() = _Headers;

  /// Creates a new [Headers] instance copying all the headers from [other].
  factory Headers.from(Headers other) {
    return _Headers()..addAll(other);
  }

  /// Gets the values of a header.
  ///
  /// Returns null if it doesn't find the header matching [name].
  Iterable<String>? get(String name);

  /// Sets a header.
  ///
  /// Makes a copy of [values].
  void set(String name, Iterable<String> values);

  /// Adds a value to the header with [name]
  ///
  /// [name] will be lowered before adding.
  void add(String name, String value);

  /// Removes the header matching [name].
  void remove(String name);

  /// Name value pairs of headers.
  Iterable<({String name, String value})> get entries;
}

/// Covenient extensions for headers.
extension HeadersExtension on Headers {
  /// Gets the first value of the header with [name].
  String? operator [](String name) {
    if (this is _Headers) {
      return (this as _Headers).table[name.toLowerCase()]?.firstOrNull;
    }
    return get(name)?.firstOrNull;
  }

  /// Sets the header [name] to [value].
  void operator []=(String name, String value) {
    if (this is _Headers) {
      (this as _Headers).table[name.toLowerCase()] = [value];
      return;
    }
    set(name, [value]);
  }

  /// Whether named header is in the [Headers].
  bool contains(String name) {
    if (this is _Headers) {
      return (this as _Headers).table.containsKey(name.toLowerCase());
    }
    return get(name) != null;
  }

  /// Copies all values from [other]
  void addAll(Headers other) {
    if (this is _Headers) {
      final table = (this as _Headers).table;
      if (other is _Headers) {
        for (final entry in other.table.entries) {
          final values = table[entry.key];
          if (values != null) {
            values.addAll(entry.value);
          } else {
            table[entry.key] = List.of(entry.value);
          }
        }
        return;
      }
      for (final header in other.entries) {
        final values = table[header.name];
        if (values != null) {
          values.add(header.value);
        } else {
          table[header.name] = [header.value];
        }
      }
      return;
    }
    for (final header in other.entries) {
      add(header.name, header.value);
    }
  }
}

class _Headers implements Headers {
  /// Holds the headers.
  ///
  /// **Value list must be append only, we rely on this behavior
  /// to return a view of the list in [get].**
  final table = <String, List<String>>{};

  @override
  void add(String name, String value) {
    final lower = name.toLowerCase();
    final values = table[lower];
    if (values != null) {
      values.add(value);
    } else {
      table[lower] = [value];
    }
  }

  @override
  Iterable<String>? get(String name) {
    final values = table[name.toLowerCase()];
    if (values == null) return null;
    return Iterable.generate(
      values.length,
      (i) => values[i],
    );
  }

  @override
  void remove(String name) {
    table.remove(name.toLowerCase());
  }

  @override
  void set(String name, Iterable<String> values) {
    table[name.toLowerCase()] = List.from(values);
  }

  @override
  Iterable<({String name, String value})> get entries sync* {
    for (final entry in table.entries) {
      for (final value in entry.value) {
        yield (name: entry.key, value: value);
      }
    }
  }
}
