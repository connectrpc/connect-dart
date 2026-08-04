//
//  Generated code. Do not modify.
//  source: wkt.proto
//

import "package:connectrpc/connect.dart" as connect;
import "package:protobuf/well_known_types/google/protobuf/any.pb.dart" as googleprotobufany;
import "package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart" as googleprotobuftimestamp;
import "package:protobuf/well_known_types/google/protobuf/wrappers.pb.dart" as googleprotobufwrappers;
import "package:protobuf/well_known_types/google/protobuf/struct.pb.dart" as googleprotobufstruct;
import "package:protobuf/well_known_types/google/protobuf/field_mask.pb.dart" as googleprotobuffield_mask;
import "package:protobuf/well_known_types/google/protobuf/duration.pb.dart" as googleprotobufduration;
import "package:protobuf/well_known_types/google/protobuf/api.pb.dart" as googleprotobufapi;
import "package:protobuf/well_known_types/google/protobuf/type.pb.dart" as googleprotobuftype;
import "package:protobuf/well_known_types/google/protobuf/source_context.pb.dart" as googleprotobufsource_context;
import "package:protobuf/well_known_types/google/protobuf/empty.pb.dart" as googleprotobufempty;
import "google/protobuf/compiler/plugin.pb.dart" as googleprotobufcompilerplugin;
import "google/protobuf/descriptor.pb.dart" as googleprotobufdescriptor;
import "google/protobuf/go_features.pb.dart" as googleprotobufgo_features;
import "google/protobuf/cpp_features.pb.dart" as googleprotobufcpp_features;
import "google/protobuf/java_features.pb.dart" as googleprotobufjava_features;

abstract final class WktService {
  /// Fully-qualified name of the WktService service.
  static const name = 'wkt.WktService';

  static const anyTimestamp = connect.Spec(
    '/$name/AnyTimestamp',
    connect.StreamType.unary,
    googleprotobufany.Any.new,
    googleprotobuftimestamp.Timestamp.new,
  );

  static const stringValueStruct = connect.Spec(
    '/$name/StringValueStruct',
    connect.StreamType.unary,
    googleprotobufwrappers.StringValue.new,
    googleprotobufstruct.Struct.new,
  );

  static const fieldMaskDuration = connect.Spec(
    '/$name/FieldMaskDuration',
    connect.StreamType.unary,
    googleprotobuffield_mask.FieldMask.new,
    googleprotobufduration.Duration.new,
  );

  static const apiType = connect.Spec(
    '/$name/ApiType',
    connect.StreamType.unary,
    googleprotobufapi.Api.new,
    googleprotobuftype.Type.new,
  );

  static const sourceContextEmpty = connect.Spec(
    '/$name/SourceContextEmpty',
    connect.StreamType.unary,
    googleprotobufsource_context.SourceContext.new,
    googleprotobufempty.Empty.new,
  );

  static const codeGeneratorRequestCodeGeneratorResponse = connect.Spec(
    '/$name/CodeGeneratorRequestCodeGeneratorResponse',
    connect.StreamType.unary,
    googleprotobufcompilerplugin.CodeGeneratorRequest.new,
    googleprotobufcompilerplugin.CodeGeneratorResponse.new,
  );

  static const fileDescriptorProtoGoFeatures = connect.Spec(
    '/$name/FileDescriptorProtoGoFeatures',
    connect.StreamType.unary,
    googleprotobufdescriptor.FileDescriptorProto.new,
    googleprotobufgo_features.GoFeatures.new,
  );

  static const cppFeaturesJavaFeatures = connect.Spec(
    '/$name/CppFeaturesJavaFeatures',
    connect.StreamType.unary,
    googleprotobufcpp_features.CppFeatures.new,
    googleprotobufjava_features.JavaFeatures.new,
  );
}
