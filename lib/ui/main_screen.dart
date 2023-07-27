import 'package:amaliy/ui/3_screen/screen.dart';
import 'package:amaliy/ui/bottom_navigation_bar/tab_box.dart';
import 'package:amaliy/ui/home/home_screen1.dart';
import 'package:flutter/material.dart';
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Home screen'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
          ListTile(
            title: const Text('Three screens'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Screen()));
            },
          ),
          ListTile(
            title: const Text('Tab box screen'),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const TabBox()));
            },
          ),
        ],
      ),
    );
  }
}
