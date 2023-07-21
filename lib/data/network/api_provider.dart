import 'dart:convert';
import 'package:amaliy/data/models/data_model.dart';
import 'package:amaliy/data/models/universal_data.dart';
import 'package:http/http.dart' as http;
import 'network_utils.dart';

class ApiProvider {

  static Future<UniversalData> getProducts(int page) async   {
    Uri uri = Uri.parse("https://api.instantwebtools.net/v1/passenger?page=$page&size=20");

    try {
      http.Response response = await http.get(uri);
      if (response.statusCode == 200) {
        return UniversalData(
          data: DataModel.fromJson((jsonDecode(response.body))),
        );
      }
      handleHttpErrors(response);
    } catch (error) {
      UniversalData(error: "mavjud error");
    }
    return UniversalData(error: "return mavjud error");
  }

}
