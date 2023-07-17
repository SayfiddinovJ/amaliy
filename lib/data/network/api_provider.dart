import 'dart:convert';
import 'package:amaliy/data/models/valorant_model.dart';
import 'package:amaliy/data/models/universal_data.dart';
import 'package:http/http.dart' as http;
class ApiProvider {
  static Future<UniversalData> getPokemon() async {
    Uri uri = Uri.parse(
        "https://valorant-api.com/v1/agents");

    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        print('200-----------${jsonDecode(response.body)['data'][0]['backgroundGradientColors']}');
        return UniversalData(
            data: ValorantModel.fromJson(jsonDecode(response.body)['data'][0]));
      }
      print('Error-----------${jsonDecode(response.body)['data']}');
      return UniversalData(error: "Error!");
    } catch (err) {
      return UniversalData(error: err.toString());
    }
  }
}