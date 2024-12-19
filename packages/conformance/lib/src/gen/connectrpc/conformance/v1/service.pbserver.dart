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
//  source: connectrpc/conformance/v1/service.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'service.pb.dart' as $2;
import 'service.pbjson.dart';

export 'service.pb.dart';

abstract class ConformanceServiceBase extends $pb.GeneratedService {
  $async.Future<$2.UnaryResponse> unary(
      $pb.ServerContext ctx, $2.UnaryRequest request);
  $async.Future<$2.ServerStreamResponse> serverStream(
      $pb.ServerContext ctx, $2.ServerStreamRequest request);
  $async.Future<$2.ClientStreamResponse> clientStream(
      $pb.ServerContext ctx, $2.ClientStreamRequest request);
  $async.Future<$2.BidiStreamResponse> bidiStream(
      $pb.ServerContext ctx, $2.BidiStreamRequest request);
  $async.Future<$2.UnimplementedResponse> unimplemented(
      $pb.ServerContext ctx, $2.UnimplementedRequest request);
  $async.Future<$2.IdempotentUnaryResponse> idempotentUnary(
      $pb.ServerContext ctx, $2.IdempotentUnaryRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'Unary':
        return $2.UnaryRequest();
      case 'ServerStream':
        return $2.ServerStreamRequest();
      case 'ClientStream':
        return $2.ClientStreamRequest();
      case 'BidiStream':
        return $2.BidiStreamRequest();
      case 'Unimplemented':
        return $2.UnimplementedRequest();
      case 'IdempotentUnary':
        return $2.IdempotentUnaryRequest();
      default:
        throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx,
      $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'Unary':
        return this.unary(ctx, request as $2.UnaryRequest);
      case 'ServerStream':
        return this.serverStream(ctx, request as $2.ServerStreamRequest);
      case 'ClientStream':
        return this.clientStream(ctx, request as $2.ClientStreamRequest);
      case 'BidiStream':
        return this.bidiStream(ctx, request as $2.BidiStreamRequest);
      case 'Unimplemented':
        return this.unimplemented(ctx, request as $2.UnimplementedRequest);
      case 'IdempotentUnary':
        return this.idempotentUnary(ctx, request as $2.IdempotentUnaryRequest);
      default:
        throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json =>
      ConformanceServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
      get $messageJson => ConformanceServiceBase$messageJson;
}
