import 'dart:convert';

import 'package:amaliy/models/region_model.dart';
import 'package:http/http.dart';

class Api{
  static Future<RegionModel> getR()async{
    Uri uri = Uri.parse('https://islomapi.uz/api/present/day?region=Toshkent');
      Response response = await get(uri);
      if(response.statusCode==200) return RegionModel.fromJson(jsonDecode(response.body));
    return RegionModel.fromJson(jsonDecode(response.body));
  }
}