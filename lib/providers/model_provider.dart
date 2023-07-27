import 'package:amaliy/data/model/main_model.dart';
import 'package:amaliy/data/model/universal_data.dart';
import 'package:amaliy/data/network/api_provider.dart';
import 'package:flutter/material.dart';

class MainModelProvider with ChangeNotifier {
  MainModel _mainModel;
  bool isLoading = true;

  MainModelProvider({required MainModel mainModel}) : _mainModel = mainModel;

  get getModel => _mainModel;

  set setModel(MainModel mainModel) {
    _mainModel = mainModel;
  }
  void getInitialData() async {
    isLoading = true;
    List<UniversalData> results = await Future.wait([
      ApiProvider.getUser(),
    ]);

    if (results[0].error.isEmpty) {
      _mainModel = results[0].data as MainModel;
    }
    isLoading = false;
  }
}
