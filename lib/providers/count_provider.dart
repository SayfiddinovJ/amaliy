import 'package:flutter/material.dart';

class CountProvider with ChangeNotifier {
  int _result;

  CountProvider({required int count}) : _result = count;

  get getResult => _result;

  set setModel(int count) {
    _result = count;
  }
  void add() async {
    _result++;
    notifyListeners();
  }
  void sub() async {
    _result--;
    notifyListeners();
  }
}
