import 'package:amaliy/ui/main_screen.dart';
import 'package:flutter/material.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    _navigate(context);
    return const Scaffold(
      body: Center(
        child: Text('My last app'),
      ),
    );
  }
  _navigate(BuildContext context){
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return MainScreen();
      },),);
    });
  }
}
