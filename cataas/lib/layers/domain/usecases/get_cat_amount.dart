import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class GetCatAmount {
  Future<int> execute() async {
    final url = Uri.parse('https://cataas.com/api/cats?limit=100000');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;
      return jsonResponse.length;
    } else {
      throw ("_getCatAmount request failed. Status code: ${response.statusCode}");
    }
  }
}
