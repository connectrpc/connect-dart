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
//  source: status.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/any.pb.dart' as $0;

///  The `Status` type defines a logical error model that is suitable for different
///  programming environments, including REST APIs and RPC APIs. It is used by
///  [gRPC](https://github.com/grpc). The error model is designed to be:
///
///  - Simple to use and understand for most users
///  - Flexible enough to meet unexpected needs
///
///  # Overview
///
///  The `Status` message contains three pieces of data: error code, error message,
///  and error details. The error code should be an enum value of
///  [google.rpc.Code][google.rpc.Code], but it may accept additional error codes if needed.  The
///  error message should be a developer-facing English message that helps
///  developers *understand* and *resolve* the error. If a localized user-facing
///  error message is needed, put the localized message in the error details or
///  localize it in the client. The optional error details may contain arbitrary
///  information about the error. There is a predefined set of error detail types
///  in the package `google.rpc` which can be used for common error conditions.
///
///  # Language mapping
///
///  The `Status` message is the logical representation of the error model, but it
///  is not necessarily the actual wire format. When the `Status` message is
///  exposed in different client libraries and different wire protocols, it can be
///  mapped differently. For example, it will likely be mapped to some exceptions
///  in Java, but more likely mapped to some error codes in C.
///
///  # Other uses
///
///  The error model and the `Status` message can be used in a variety of
///  environments, either with or without APIs, to provide a
///  consistent developer experience across different environments.
///
///  Example uses of this error model include:
///
///  - Partial errors. If a service needs to return partial errors to the client,
///      it may embed the `Status` in the normal response to indicate the partial
///      errors.
///
///  - Workflow errors. A typical workflow has multiple steps. Each step may
///      have a `Status` message for error reporting purpose.
///
///  - Batch operations. If a client uses batch request and batch response, the
///      `Status` message should be used directly inside batch response, one for
///      each error sub-response.
///
///  - Asynchronous operations. If an API call embeds asynchronous operation
///      results in its response, the status of those operations should be
///      represented directly using the `Status` message.
///
///  - Logging. If some API errors are stored in logs, the message `Status` could
///      be used directly after any stripping needed for security/privacy reasons.
class Status extends $pb.GeneratedMessage {
  factory Status({
    $core.int? code,
    $core.String? message,
    $core.Iterable<$0.Any>? details,
  }) {
    final $result = create();
    if (code != null) {
      $result.code = code;
    }
    if (message != null) {
      $result.message = message;
    }
    if (details != null) {
      $result.details.addAll(details);
    }
    return $result;
  }
  Status._() : super();
  factory Status.fromBuffer($core.List<$core.int> i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(i, r);
  factory Status.fromJson($core.String i,
          [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Status',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'google.rpc'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'code', $pb.PbFieldType.O3)
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..pc<$0.Any>(3, _omitFieldNames ? '' : 'details', $pb.PbFieldType.PM,
        subBuilder: $0.Any.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
      'Will be removed in next major version')
  Status clone() => Status()..mergeFromMessage(this);
  @$core.Deprecated('Using this can add significant overhead to your binary. '
      'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
      'Will be removed in next major version')
  Status copyWith(void Function(Status) updates) =>
      super.copyWith((message) => updates(message as Status)) as Status;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Status create() => Status._();
  Status createEmptyInstance() => create();
  static $pb.PbList<Status> createRepeated() => $pb.PbList<Status>();
  @$core.pragma('dart2js:noInline')
  static Status getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Status>(create);
  static Status? _defaultInstance;

  /// The status code, which should be an enum value of [google.rpc.Code][google.rpc.Code].
  @$pb.TagNumber(1)
  $core.int get code => $_getIZ(0);
  @$pb.TagNumber(1)
  set code($core.int v) {
    $_setSignedInt32(0, v);
  }

  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => clearField(1);

  /// A developer-facing error message, which should be in English. Any
  /// user-facing error message should be localized and sent in the
  /// [google.rpc.Status.details][google.rpc.Status.details] field, or localized by the client.
  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) {
    $_setString(1, v);
  }

  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);

  /// A list of messages that carry the error details.  There will be a
  /// common set of message types for APIs to use.
  @$pb.TagNumber(3)
  $core.List<$0.Any> get details => $_getList(2);
}

const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
