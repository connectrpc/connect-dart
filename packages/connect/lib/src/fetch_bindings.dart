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

import 'dart:js_interop';
import 'dart:typed_data';

Future<Response> fetch(String url, [RequestInit? init]) {
  return _fetch(url, init).toDart;
}

@JS('fetch')
external JSPromise<Response> _fetch(String resource, [RequestInit? init]);

extension type RequestInit._(JSObject _) implements JSObject {
  external RequestInit({
    JSTypedArray? body,
    String method,
    String credentials,
    String redirect,
    String mode,
    Headers headers,
    AbortSignal signal,
  });
}

@JS()
extension type Headers._(JSObject _) implements JSObject {
  external factory Headers();

  external void append(String name, String value);

  @JS("entries")
  external JSAny _entries();

  Iterable<({String key, String value})> entries() {
    // Instread of creating bindings for the iterable, we opaquely pass the
    // iterbale to Array.from and convert that to a dart list.
    return _HeaderEntriesArray.from(_entries())
        .toDart
        .map((e) => e.toDart)
        .map((e) => (key: e.first.toDart, value: e.last.toDart));
  }
}

@JS()
extension type AbortSignal._(JSObject _) implements JSObject {}

@JS()
extension type AbortController._(JSObject _) implements JSObject {
  external factory AbortController();

  external AbortSignal get signal;

  external void abort();
}

@JS()
extension type ReadableStream._(JSObject _) implements JSObject {
  external ReadableStreamDefaultReader getReader();
}

@JS()
extension type ReadableStreamDefaultReader._(JSObject _) implements JSObject {
  @JS("read")
  external JSPromise<ReadableStreamReadResult> _read();
  Future<ReadableStreamReadResult> read() => _read().toDart;
}

extension type ReadableStreamReadResult._(JSObject _) implements JSObject {
  @JS('value')
  external JSUint8Array? get _value;
  external bool get done;

  Uint8List? get value => _value?.toDart;
}

@JS()
extension type Response._(JSObject _) implements JSObject {
  external ReadableStream get body;
  external Headers get headers;
  external int get status;
}

@JS("Array")
extension type _HeaderEntriesArray._(JSArray<JSArray<JSString>> _)
    implements JSArray<JSArray<JSString>> {
  external static _HeaderEntriesArray from(JSAny any);
}
