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

import 'package:path/path.dart' show Context, Style;

import 'gen/google/protobuf/descriptor.pb.dart';
import 'generated_file.dart';
import 'run.dart';
import 'symbol.dart';

/// Entry point for the generation code.
Iterable<GeneratedFile> generate(Schema schema) sync* {
  final p = Context(style: Style.posix);
  for (final file in schema.files) {
    if (!schema.keepEmptyFiles && file.service.isEmpty) {
      continue;
    }
    // foo/v1/foo.proto -> foo/v1/foo.connect
    final baseName = p.normalize(
      p.join(
        p.dirname(file.name),
        '${p.basenameWithoutExtension(file.name)}.connect',
      ),
    );
    final specsFile = GeneratedFile("$baseName.spec.dart", schema, file);
    final clientFile = GeneratedFile("$baseName.client.dart", schema, file);
    for (final service in file.service) {
      specsFile.printSpecs(service);
      clientFile.printClient(service);
    }
    yield specsFile;
    yield clientFile;
  }
}

extension on GeneratedFile {
  static final connect = DartLibrary(
    'package:connectrpc/connect.dart',
    "connect",
  );
  static final path = Context(style: Style.posix);

  void printSpecs(ServiceDescriptorProto service) {
    pServiceDoc(service);
    p(["abstract final class ", service.name, " {"]);
    p(["  /// Fully-qualified name of the ", service.name, " service."]);
    p(
      ["  static const name = '", proto.package, ".", service.name, "';"],
    );
    for (final method in service.method) {
      p([]);
      pMethodDoc(service, method);
      pMethodSpec(method);
    }
    p(["}"]);
  }

  void printClient(ServiceDescriptorProto service) {
    pServiceDoc(service);
    p([
      "extension type ",
      service.name,
      "Client (",
      connect.import('Transport'),
      " _transport) {"
    ]);
    var first = true;
    for (final method in service.method) {
      if (!first) {
        p([]);
      }
      first = false;
      pMethod(service, method);
    }
    p(["}"]);
  }

  void pServiceDoc(ServiceDescriptorProto service) {
    pDartDoc([
      FileDescriptorProto().info_.byName["service"]!.tagNumber,
      proto.service.indexOf(service),
    ]);
  }

  void pMethod(
    ServiceDescriptorProto service,
    MethodDescriptorProto method,
  ) {
    final specsLib = DartLibrary(
      "${path.basenameWithoutExtension(proto.name)}.connect.spec.dart",
      "specs",
    );
    pMethodDoc(service, method);
    if (method.options.deprecated) {
      p(['@deprecated']);
    }
    final returnType = [
      method.serverStreaming ? "Stream" : "Future",
      "<",
      importMsg(method.outputType),
      ">"
    ];
    final inputType = method.clientStreaming
        ? ["Stream", "<", importMsg(method.inputType), ">"]
        : [importMsg(method.inputType)];
    p(["  ", ...returnType, " ", method.localName, "("]);
    p(["    ", ...inputType, " input, {"]);
    pMethodOptions();
    p(["  }) {"]);
    p([
      "    return ",
      connect.import("Client"),
      "(_transport).",
      method.streamType,
      "("
    ]);
    p(["      ", specsLib.import(service.name), ".", method.localName, ","]);
    p(["      input,"]);
    p(["      signal: signal,"]);
    p(["      headers: headers,"]);
    p(["      onHeader: onHeader,"]);
    p(["      onTrailer: onTrailer,"]);
    p(["    );"]);
    p(["  }"]);
  }

  void pMethodDoc(
    ServiceDescriptorProto service,
    MethodDescriptorProto method,
  ) {
    pDartDoc(
      [
        FileDescriptorProto().info_.byName["service"]!.tagNumber,
        proto.service.indexOf(service),
        ServiceDescriptorProto().info_.byName["method"]!.tagNumber,
        service.method.indexOf(method),
      ],
      "  ",
    );
  }

  void pMethodOptions() {
    p(["    ", connect.import("Headers"), "? headers,"]);
    p(["    ", connect.import("AbortSignal"), "? signal,"]);
    p(["    Function(", connect.import("Headers"), ")? onHeader,"]);
    p(["    Function(", connect.import("Headers"), ")? onTrailer,"]);
  }

  void pMethodSpec(MethodDescriptorProto method) {
    p([
      "  static const ",
      method.localName,
      " = ",
      connect.import("Spec"),
      "("
    ]);
    p(["    '/\$name/", method.name, "',"]);
    p(["    ", connect.import("StreamType"), ".", method.streamType, ","]);
    p(["    ", importMsg(method.inputType), ".new,"]);
    p(["    ", importMsg(method.outputType), ".new,"]);
    final idempotency = switch (method.options.idempotencyLevel) {
      MethodOptions_IdempotencyLevel.IDEMPOTENT => "idempotent",
      MethodOptions_IdempotencyLevel.NO_SIDE_EFFECTS => "noSideEffects",
      _ => null,
    };
    if (idempotency != null) {
      p(["    idempotency: ", connect.import("Idempotency"), ".$idempotency,"]);
    }
    p(["  );"]);
  }

  DartIdentifier importMsg(String typeName) {
    for (final file in schema.file.values) {
      if (!typeName.startsWith(".${file.package}")) {
        continue;
      }
      if (!file.messageType.hasMessage(
        typeName.substring(file.package.length + 1),
      )) {
        continue;
      }
      return DartLibrary(
        "${path.withoutExtension(
          path.relative(file.name, from: path.dirname(proto.name)),
        )}.pb.dart",
        path.withoutExtension(file.name).replaceAll("/", ""),
      ).import(typeName.split(".").last);
    }
    throw "Message: $typeName not found";
  }

  void pDartDoc(List<int> path, [String indentation = ""]) {
    final comments = findComments(path);
    if (comments == null) {
      return;
    }
    var text = "";
    if (comments.hasLeadingComments()) {
      text += comments.leadingComments.withoutLn;
    }
    if (comments.hasTrailingComments()) {
      if (text.isNotEmpty) {
        text += "\n\n";
      }
      text += comments.trailingComments.withoutLn;
    }
    text
        .split("\n")
        .map((l) => l.startsWith("/*") ? l.substring(2) : l)
        .map((l) => l.startsWith("//") ? l.substring(2) : l)
        .map((l) => l.startsWith(" ") ? l.substring(1) : l)
        .where((l) => l.trim().isNotEmpty)
        .map((l) => '$indentation/// $l'.trimRight())
        .forEach((l) => p([l]));
  }

  SourceCodeInfo_Location? findComments(List<int> path) {
    locations:
    for (final location in proto.sourceCodeInfo.location) {
      if (location.path.length != path.length) {
        continue;
      }
      for (var i = 0; i < path.length; i++) {
        if (location.path[i] != path[i]) {
          continue locations;
        }
      }
      return location;
    }
    return null;
  }
}

extension on List<DescriptorProto> {
  bool hasMessage(String typeName) {
    if (typeName.startsWith(".")) {
      typeName = typeName.substring(1);
    }
    if (!typeName.contains(".")) {
      // Can only be at this level
      return any(
        (msg) => msg.name == typeName,
      );
    }
    // Can only be a sub message.
    final outerType = typeName.split(".").first;
    for (final msg in this) {
      if (msg.name == outerType) {
        return msg.nestedType.hasMessage(
          typeName.substring(outerType.length),
        );
      }
    }
    return false;
  }
}

extension on MethodDescriptorProto {
  String get localName =>
      (name.substring(0, 1).toLowerCase() + name.substring(1))
          .sanitizeIdentifier;

  /// Runtime function name on the Client.
  String get streamType {
    return switch (true) {
      true when !clientStreaming && !serverStreaming => "unary",
      true when clientStreaming && serverStreaming => "bidi",
      true when serverStreaming => "server",
      _ => "client",
    };
  }
}

extension on String {
  String get withoutLn => endsWith("\n") ? substring(0, length - 1) : this;

  // Ref: https://dart.dev/language/keywords
  static const _disallowedIdentifiers = {
    'assert',
    'break',
    'case',
    'catch',
    'class',
    'const',
    'continue',
    'default',
    'do',
    'else',
    'enum',
    'extends',
    'false',
    'final',
    'finally',
    'for',
    'if',
    'in',
    'is',
    'new',
    'null',
    'rethrow',
    'return',
    'super',
    'switch',
    'this',
    'throw',
    'true',
    'try',
    'var',
    'void',
    'with',
    'while',
  };

  String get sanitizeIdentifier =>
      _disallowedIdentifiers.contains(this) ? this + r'$' : this;
}
