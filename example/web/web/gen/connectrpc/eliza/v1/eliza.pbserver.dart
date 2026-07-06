// This is a generated file - do not edit.
//
// Generated from connectrpc/eliza/v1/eliza.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'eliza.pb.dart' as $0;
import 'eliza.pbjson.dart';

export 'eliza.pb.dart';

abstract class ElizaServiceBase extends $pb.GeneratedService {
  $async.Future<$0.SayResponse> say(
      $pb.ServerContext ctx, $0.SayRequest request);
  $async.Future<$0.ConverseResponse> converse(
      $pb.ServerContext ctx, $0.ConverseRequest request);
  $async.Future<$0.IntroduceResponse> introduce(
      $pb.ServerContext ctx, $0.IntroduceRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'Say':
        return $0.SayRequest();
      case 'Converse':
        return $0.ConverseRequest();
      case 'Introduce':
        return $0.IntroduceRequest();
      default:
        throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx,
      $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'Say':
        return say(ctx, request as $0.SayRequest);
      case 'Converse':
        return converse(ctx, request as $0.ConverseRequest);
      case 'Introduce':
        return introduce(ctx, request as $0.IntroduceRequest);
      default:
        throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => ElizaServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
      get $messageJson => ElizaServiceBase$messageJson;
}
