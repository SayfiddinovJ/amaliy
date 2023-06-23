import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login screen'),
      ),
      body: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
              hintText: 'Name'
            ),
          ),
          const SizedBox(height: 10,),
          const TextField(
            decoration: InputDecoration(
                hintText: 'Sure name'
            ),
          ),
          const SizedBox(height: 10,),
          Center(
            child: ElevatedButton(onPressed: (){setState(() {
              Navigator.pop(context);
            });}, child: const Text('Login'),),
          ),
        ],
      ),
    );
  }
}
