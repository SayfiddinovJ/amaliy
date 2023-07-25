import 'package:amaliy/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
          },
          child: const Text('Click',style: TextStyle(fontSize: 30),),
        ),
      ),
    );
  }
}
