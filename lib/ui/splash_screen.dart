import 'package:amaliy/route.dart';
import 'package:amaliy/ui/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    _navigator(context);
    return const Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('New Application'),
          ],
        ),
      ),
    );
  }
  void _navigator(BuildContext context){
    Future.delayed(const Duration(seconds: 2),(){
        Navigator.pushReplacementNamed(context, RouteNames.home,);
    });
  }
}
