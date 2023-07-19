import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.black),
    ),
    iconTheme: const IconThemeData(color: Colors.grey),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(color: Colors.white, fontSize: 14),
      titleSmall: TextStyle(color: Colors.white, fontSize: 12),
    ),
    popupMenuTheme: const PopupMenuThemeData(
        color: Colors.black,
        textStyle: TextStyle(
          color: Colors.white,
          fontSize: 12,
        )),
  );
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white),
    ),
    popupMenuTheme: const PopupMenuThemeData(
        color: Colors.white,
        textStyle: TextStyle(color: Colors.black, fontSize: 12)),
    iconTheme: const IconThemeData(color: Colors.grey),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      titleMedium: TextStyle(color: Colors.black, fontSize: 14),
      titleSmall: TextStyle(color: Colors.black, fontSize: 12),
    ),
  );
}