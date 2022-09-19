import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class GetTags {
  Future<List<dynamic>> execute() async {
    final url = Uri.parse("https://cataas.com/api/tags");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return convert.jsonDecode(response.body) as List<dynamic>;
    } else {
      throw ("_getTags request failed. Status code: ${response.statusCode}");
    }
  }
}
