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

import '../codec.dart';
import '../compression.dart';
import '../headers.dart';
import '../http.dart';
import '../interceptor.dart';
import '../spec.dart';
import '../transport.dart';

/// Protocol is common abstraction of an RPC protocol over HTTP.
abstract interface class Protocol {
  /// Protocol specific request headers for an RPC.
  Headers requestHeaders<I, O>(
    Spec<I, O> spec,
    Codec codec,
    Compression? sendCompression,
    List<Compression> acceptCompressions,
    CallOptions? options,
  );

  /// Performs a unary request using the given [client] according
  /// the underlying protocol.
  Future<UnaryResponse<I, O>> unary<I extends Object, O extends Object>(
    UnaryRequest<I, O> req,
    Codec codec,
    HttpClient client,
    Compression? sendCompression,
    List<Compression> acceptCompressions,
  );

  /// Performs a stream request using the given [client] according
  /// the underlying protocol.
  Future<StreamResponse<I, O>> stream<I extends Object, O extends Object>(
    StreamRequest<I, O> req,
    Codec codec,
    HttpClient client,
    Compression? sendCompression,
    List<Compression> acceptCompressions,
  );
}
