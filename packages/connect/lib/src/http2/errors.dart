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

import 'package:http2/http2.dart' as http2;

import '../code.dart';
import '../exception.dart';

ConnectException errFromRstCode(
  int rstCode,
) {
  switch (rstCode) {
    case http2.ErrorCode.NO_ERROR:
    case http2.ErrorCode.PROTOCOL_ERROR:
    case http2.ErrorCode.INTERNAL_ERROR:
    case http2.ErrorCode.FLOW_CONTROL_ERROR:
    case http2.ErrorCode.SETTINGS_TIMEOUT:
    case http2.ErrorCode.FRAME_SIZE_ERROR:
    case http2.ErrorCode.COMPRESSION_ERROR:
    case http2.ErrorCode.CONNECT_ERROR:
      return ConnectException(
        Code.internal,
        'http/2 stream closed with error code ${_h2Codes[rstCode]} (0x${rstCode.toRadixString(16)})',
      );
    case http2.ErrorCode.REFUSED_STREAM:
      return ConnectException(
        Code.unavailable,
        'http/2 stream closed with error code ${_h2Codes[rstCode]} (0x${rstCode.toRadixString(16)})',
      );
    case http2.ErrorCode.CANCEL:
      return ConnectException(
        Code.canceled,
        'http/2 stream closed with error code ${_h2Codes[rstCode]} (0x${rstCode.toRadixString(16)})',
      );
    case http2.ErrorCode.ENHANCE_YOUR_CALM:
      return ConnectException(
        Code.resourceExhausted,
        'http/2 stream closed with error code ${_h2Codes[rstCode]} (0x${rstCode.toRadixString(16)})',
      );
    case http2.ErrorCode.HTTP_1_1_REQUIRED:
    case http2.ErrorCode.INADEQUATE_SECURITY:
      return ConnectException(
        Code.permissionDenied,
        'http/2 stream closed with error code ${_h2Codes[rstCode]} (0x${rstCode.toRadixString(16)})',
      );
    case http2.ErrorCode.STREAM_CLOSED:
    default:
      throw ConnectException(
        Code.unknown,
        'protocol error: http/2: unknown RST_STREAM code:$rstCode',
      );
  }
}

const _h2Codes = {
  http2.ErrorCode.NO_ERROR: "NO_ERROR",
  http2.ErrorCode.PROTOCOL_ERROR: "PROTOCOL_ERROR",
  http2.ErrorCode.INTERNAL_ERROR: "INTERNAL_ERROR",
  http2.ErrorCode.FLOW_CONTROL_ERROR: "FLOW_CONTROL_ERROR",
  http2.ErrorCode.SETTINGS_TIMEOUT: "SETTINGS_TIMEOUT",
  http2.ErrorCode.FRAME_SIZE_ERROR: "FRAME_SIZE_ERROR",
  http2.ErrorCode.COMPRESSION_ERROR: "COMPRESSION_ERROR",
  http2.ErrorCode.CONNECT_ERROR: "CONNECT_ERROR",
  http2.ErrorCode.REFUSED_STREAM: "REFUSED_STREAM",
  http2.ErrorCode.CANCEL: "CANCEL",
  http2.ErrorCode.ENHANCE_YOUR_CALM: "ENHANCE_YOUR_CALM",
  http2.ErrorCode.HTTP_1_1_REQUIRED: "HTTP_1_1_REQUIRED",
  http2.ErrorCode.INADEQUATE_SECURITY: "INADEQUATE_SECURITY",
  http2.ErrorCode.STREAM_CLOSED: "STREAM_CLOSED",
};
