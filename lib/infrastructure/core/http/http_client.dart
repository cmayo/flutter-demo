import 'package:demo/application/core/http/http_client_interface.dart';
import 'package:demo/domain/core/http/http_response.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

@Injectable(as: HttpClientInterface)
class HttpClient implements HttpClientInterface {
  @override
  Future<HttpResponse> get(String url) async {
    final result = await http.get(Uri.parse(url));
    final HttpResponse response = new HttpResponse(
        result.body,
        result.statusCode,
        result.headers
    );

    return response;
  }
}