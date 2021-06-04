import 'package:demo/domain/core/http/http_response.dart';

abstract class HttpClientInterface {
  Future<HttpResponse> get(String url);
}