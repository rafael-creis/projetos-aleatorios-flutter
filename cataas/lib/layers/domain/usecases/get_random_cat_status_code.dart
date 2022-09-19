import 'package:http/http.dart' as http;

class GetRandomCatStatusCode {
  static int execute(http.Response response) {
    return response.statusCode;
  }
}
