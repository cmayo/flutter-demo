class HttpResponse {
  final int statusCode;
  final Map<String, String> headers;
  final String body;

  HttpResponse(this.body, this.statusCode, this.headers);
}