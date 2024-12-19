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

import 'dart:io';

const license = """
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
""";

void main(List<String> args) async {
  if (args.length != 1) {
    throw 'Exactly one positional argument is expected';
  }
  await for (final fsEntity in Directory(args.first).list(recursive: true)) {
    if (!const [".dart", ".proto"].any(fsEntity.path.endsWith)) {
      continue;
    }
    final file = File(fsEntity.path);
    final lines = await file.readAsLines();
    var lastCommentLine = 0;
    for (; lastCommentLine < lines.length; lastCommentLine++) {
      if (!lines[lastCommentLine].startsWith("//")) {
        break;
      }
    }
    final foundHeader = lines
        .sublist(0, lastCommentLine)
        .any((line) => line.toLowerCase().contains('copyright'));
    if (!foundHeader) {
      lastCommentLine = 0;
    }
    final content = lines.sublist(lastCommentLine).join("\n").trimLeft();
    final writer = file.openWrite();
    writer.writeln(license);
    writer.writeln(content);
    await writer.close();
  }
}
