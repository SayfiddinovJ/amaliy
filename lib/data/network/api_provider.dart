import 'dart:convert';
import 'dart:io';

import 'package:amaliy/data/model/translate_model.dart';
import 'package:amaliy/data/model/universal_data.dart';
import 'package:amaliy/data/network/network_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiProvider {
  static Future<UniversalData> getWord({
    required String word,
    required String lang,
  }) async {
    Uri uri = Uri.https(
      'api.mymemory.translated.net',
      "/get",
      {
        "q": word,
        "langpair": lang
      },
    );

    try {
      http.Response response = await http.post(uri, headers: {
        "q": word,
        "langpair": lang
      });

      if (response.statusCode == HttpStatus.ok) {
        return UniversalData(
            data: ResponseData.fromJson(jsonDecode(response.body)));
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
