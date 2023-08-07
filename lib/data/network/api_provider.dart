import 'dart:convert';
import 'dart:io';

import 'package:amaliy/data/model/main_model.dart';
import 'package:amaliy/data/model/universal_data.dart';
import 'package:amaliy/data/network/network_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  static Future<UniversalData> getUser() async {
    Uri uri = Uri.https(
      'api.restful-api.dev',
      "/objects",
    );

    try {
      http.Response response = await http.post(
        uri,
        body: {
          "name": "1202UltraMaxPhone",
          "data": {
            "year": 2050,
            "price": 9999.99,
            "CPU model": "Eplab bo'miydigan cpu",
            "Hard disk size": "Cheksiz"
          }
        },
      );

      if (response.statusCode == HttpStatus.ok) {
        return UniversalData(
            data: MainModel.fromJson(jsonDecode(response.body)));
      }
      return handleHttpErrors(response);
    } on SocketException {
      return UniversalData(error: "Internet Error!");
    } on FormatException {
      return UniversalData(error: "Format Error!");
    } catch (err) {
      debugPrint("ERROR:$err. ERROR TYPE: ${err.runtimeType}");
      return UniversalData(error: err.toString());
    }
  }
}
