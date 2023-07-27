import 'package:flutter/material.dart';

class TabBoxProvider with ChangeNotifier {
  int _result;

  TabBoxProvider({required int count}) : _result = count;

  get getIndex => _result;

  set setCount(int count) {
    _result = count;
  }

  void setIndex(int index){
    _result = index;
    notifyListeners();
  }
}