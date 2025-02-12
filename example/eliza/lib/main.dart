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

import './gen/eliza.pb.dart';
import './gen/eliza.connect.client.dart';

import 'package:flutter/material.dart';
import 'package:connectrpc/connect.dart';
import 'package:connectrpc/protobuf.dart';
import 'package:connectrpc/protocol/connect.dart' as protocol;
// Conditionally import `createHttpClient` function.
//
// This way each platform can configure the client as needed
// in their respective files.
import './http.dart'
    if (dart.library.io) './http_io.dart'
    if (dart.library.js_interop) './http_web.dart';

final transport = protocol.Transport(
  baseUrl: "https://demo.connectrpc.com",
  codec: const ProtoCodec(), // Or JsonCodec()
  httpClient: createHttpClient(),
);

void main() {
  runApp(const ElizaApp());
}

class ElizaApp extends StatelessWidget {
  const ElizaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eliza',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: ChatPage(transport: transport),
    );
  }
}

class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required this.transport});
  final Transport transport;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final messages = List<({String sentence, bool byUser})>.empty(growable: true);
  final currentSentence = TextEditingController();

  void addMessage(String sentence, bool byUser) {
    setState(() => messages.add((sentence: sentence, byUser: byUser)));
  }

  void send(String sentence) async {
    addMessage(sentence, true);
    final response = await ElizaServiceClient(widget.transport).say(
      SayRequest(sentence: sentence),
    );
    addMessage(response.sentence, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: [
                    for (final message in messages)
                      Column(
                        key: ObjectKey(message),
                        children: [
                          if (message.byUser) ...[
                            const Row(
                              children: [
                                Spacer(),
                                Text(
                                  "You",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                const Spacer(),
                                Text(
                                  message.sentence,
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            )
                          ] else ...[
                            const Row(
                              children: [
                                Text(
                                  "Eliza",
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Spacer(),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  message.sentence,
                                  textAlign: TextAlign.left,
                                ),
                                const Spacer(),
                              ],
                            )
                          ]
                        ],
                      )
                  ],
                ),
              ),
              Row(
                children: [
                  Flexible(
                    child: TextField(
                      controller: currentSentence,
                      decoration: const InputDecoration(
                        hintText: 'Write your message...',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      final sentence = currentSentence.text;
                      if (sentence.isEmpty) {
                        return;
                      }
                      send(sentence);
                      currentSentence.clear();
                    },
                    child: const Text(
                      'Send',
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
