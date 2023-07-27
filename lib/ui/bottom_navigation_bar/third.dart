import 'package:flutter/material.dart';
class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third'),
      ),
      body: const Center(
        child: Text('3',style: TextStyle(fontSize: 50),),
      ),
    );
  }
}
