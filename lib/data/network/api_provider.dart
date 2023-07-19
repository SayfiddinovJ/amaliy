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
      'randomuser.me',
      "/api",
    );

    try {
      http.Response response = await http.get(uri);

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
