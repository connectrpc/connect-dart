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

import 'dart:io';

import 'package:args/args.dart';

void main(List<String> args) async {
  final parser = ArgParser();
  parser.addOption('port', abbr: 'p');
  final flags = parser.parse(args);
  final port = int.parse(flags.option('port') ?? '');
  final socket = await Socket.connect(InternetAddress.loopbackIPv4, port);
  await Future.wait(
    [stdin.pipe(socket), socket.cast<List<int>>().pipe(stdout)],
  );
}
