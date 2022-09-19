import 'package:http/http.dart' as http;

class GetRandomCatJson {
  static Future<http.Response> execute(String query) async {
    final url = Uri.parse("https://cataas.com/cat$query?json=true");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return response;
    } else {
      throw ("_getRandomCat request failed. Status code: ${response.statusCode}");
    }
  }
}
