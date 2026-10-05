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

// This is a generated file - do not edit.
//
// Generated from nested.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'nested.pb.dart' as $0;
import 'nested.pbjson.dart';

export 'nested.pb.dart';

abstract class NestedServiceBase extends $pb.GeneratedService {
  $async.Future<$0.OuterFoo_Middle_Inner> foo(
      $pb.ServerContext ctx, $0.OuterFoo_Middle request);
  $async.Future<$0.OuterBar_Middle_Inner> bar(
      $pb.ServerContext ctx, $0.OuterBar_Middle request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'Foo':
        return $0.OuterFoo_Middle();
      case 'Bar':
        return $0.OuterBar_Middle();
      default:
        throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx,
      $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'Foo':
        return foo(ctx, request as $0.OuterFoo_Middle);
      case 'Bar':
        return bar(ctx, request as $0.OuterBar_Middle);
      default:
        throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => NestedServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
      get $messageJson => NestedServiceBase$messageJson;
}
