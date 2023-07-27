import 'package:amaliy/ui/3_screen/screen_1.dart';
import 'package:amaliy/ui/3_screen/screen_2.dart';
import 'package:amaliy/ui/3_screen/screen_3.dart';
import 'package:flutter/material.dart';
class Screen extends StatelessWidget {
  const Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Screen1()));
              },
              child: const Text('Screen 1'),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Screen2()));
              },
              child: const Text('Screen 2'),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Screen3()));
              },
              child: const Text('Screen 3'),
            ),
          ],
        ),
      ),
    );
  }
}
