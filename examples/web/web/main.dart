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

import 'dart:async';
import 'dart:js_interop';

import 'package:connectrpc/protobuf.dart';
import 'package:connectrpc/web.dart';
import 'package:web/web.dart' as web;
import 'package:connectrpc/protocol/grpc_web.dart' as grpc_web;
import 'gen/connectrpc/eliza/v1/eliza.pb.dart';
import 'gen/connectrpc/eliza/v1/eliza.connect.client.dart';

void main() async {
  final transport = grpc_web.Transport(
    baseUrl: "https://demo.connectrpc.com/",
    codec: ProtoCodec(), // or JsonCodec
    httpClient: createHttpClient(),
    statusParser: const StatusParser(),
  );
  final elizaClient = ElizaServiceClient(transport);
  for (;;) {
    final sentence = await prompt();
    print('> $sentence');
    final res = await elizaClient.say(SayRequest(sentence: sentence));
    print(res.sentence);
  }
}

void print(String text) {
  final p = web.document.createElement("p") as web.HTMLElement;
  p.innerText = text;
  p.scrollIntoView();
  web.document.querySelector("#root")?.append(p);
}

Future<String> prompt() {
  final input = web.document.createElement("input") as web.HTMLInputElement;
  input.value = "";
  web.document.querySelector("#root")?.append(input);
  input.focus();
  final completer = Completer<String>();
  input.onkeyup = (web.KeyboardEvent ev) {
    if (ev.key == "Enter" && input.value.isNotEmpty) {
      input.remove();
      input.onkeyup = null;
      completer.complete(input.value);
    }
  }.toJS;
  return completer.future;
}
