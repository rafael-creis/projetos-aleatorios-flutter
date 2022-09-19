import 'convert_json.dart';
import 'get_random_cat_json.dart';
import 'get_random_cat_status_code.dart';

class GetRandomCat {
  Future<Map<String, dynamic>> execute(String query) async {
    late Map<String, dynamic> jsonResponse;
    late int statusCode;
    await GetRandomCatJson.execute(query).then((value) => {
          jsonResponse = ConvertJson.execute(value),
          statusCode = GetRandomCatStatusCode.execute(value)
        });
    return {"statusCode": statusCode, "body": jsonResponse};
  }
}
