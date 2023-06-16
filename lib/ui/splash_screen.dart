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
    return const Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            FlutterLogo(size: 100,),
          ],
        ),
      ),
    );
  }

  void navigator(BuildContext context){
    Future.delayed(const Duration(seconds: 2),(){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
    });
  }
}
