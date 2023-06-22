import 'package:amaliy/main.dart';
import 'package:amaliy/ui/login_screen.dart';
import 'package:amaliy/ui/main_screen.dart';
import 'package:amaliy/ui/splash_screen.dart';
import 'package:flutter/material.dart';
class RouteNames{
  static const String initial = "/";
  static const String home = "/home";
  static const String screen = "/screen";
}


class AppRoutes{
  static Route generateRoute(RouteSettings settings){
    switch (settings.name){
      case RouteNames.initial:
        return MaterialPageRoute(builder: (context)=>SplashScreen());
      case RouteNames.home:
        return MaterialPageRoute(builder: (context)=>HomeScreen());
      case RouteNames.screen:
        return MaterialPageRoute(builder: (context)=>Screen(name: preferences.getString('name') ?? '', surname: preferences.getString('surname') ?? ''));
      default:
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(child: Text('Route mavjud emas'),),
          );
        });
    }
  }
}