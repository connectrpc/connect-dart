import 'package:connectrpc/connect.dart';
import 'package:connectrpc/web.dart' as web;

HttpClient createHttpClient() {
  return web.createHttpClient();
}
