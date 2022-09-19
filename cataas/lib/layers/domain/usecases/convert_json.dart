import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ConvertJson {
  static Map<String, dynamic> execute(http.Response response) {
    return convert.jsonDecode(response.body);
  }
}
