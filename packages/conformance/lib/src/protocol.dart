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

import 'package:connectrpc/connect.dart' as connect;

import 'gen/connectrpc/conformance/v1/client_compat.pb.dart';
import 'gen/connectrpc/conformance/v1/config.pb.dart';
import 'gen/connectrpc/conformance/v1/service.pb.dart';
import 'gen/google/protobuf/any.pb.dart';

void addProtoHeaders(
  connect.Headers headers,
  List<Header> protoHeaders,
) {
  for (final header in protoHeaders) {
    for (final value in header.value) {
      headers.add(header.name, value);
    }
  }
}

List<Header> convertToProtoHeaders(connect.Headers headers) {
  final headerTable = <String, Header>{};
  for (final entry in headers.entries) {
    final header = headerTable[entry.name];
    if (header == null) {
      headerTable[entry.name] = Header(name: entry.name, value: [entry.value]);
    } else {
      header.value.add(entry.value);
    }
  }
  return headerTable.values.toList();
}

Error? convertToProtoError(connect.ConnectException? err) {
  if (err == null) {
    return null;
  }
  final details = List<Any>.empty(growable: true);
  for (final detail in err.details) {
    details.add(
      Any(
        typeUrl: "type.googleapis.com/${detail.type}",
        value: detail.value,
      ),
    );
  }
  return Error(
    code: Code.valueOf(err.code.value),
    message: err.message,
    details: details,
  );
}

Future<void> wait(int ms) => Future<void>.delayed(Duration(milliseconds: ms));

connect.AbortSignal? getSignalForRequest(
  ClientCompatRequest req, [
  connect.AbortSignal? parent,
]) {
  if (!req.hasTimeoutMs()) return parent;
  return connect.TimeoutSignal(
    Duration(milliseconds: req.timeoutMs),
    parent: parent,
  );
}

class CancellationTiming {
  final bool beforeCloseSend;
  final int afterCloseSendMs;
  final int afterNumResponses;

  factory CancellationTiming.forRequest(ClientCompatRequest req) =>
      switch (req.cancel.whichCancelTiming()) {
        ClientCompatRequest_Cancel_CancelTiming.beforeCloseSend =>
          CancellationTiming._(
            beforeCloseSend: true,
          ),
        ClientCompatRequest_Cancel_CancelTiming.afterCloseSendMs =>
          CancellationTiming._(
            afterCloseSendMs: req.cancel.afterCloseSendMs,
          ),
        ClientCompatRequest_Cancel_CancelTiming.afterNumResponses =>
          CancellationTiming._(
            afterNumResponses: req.cancel.afterNumResponses,
          ),
        _ => CancellationTiming._(),
      };

  CancellationTiming._({
    this.beforeCloseSend = false,
    this.afterCloseSendMs = -1,
    this.afterNumResponses = -1,
  });
}
