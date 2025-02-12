import 'package:connectrpc/connect.dart';
import 'package:connectrpc/http2.dart' as io;

HttpClient createHttpClient() {
  return io.createHttpClient();
}
