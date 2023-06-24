import 'package:amaliy/main.dart';
import 'package:amaliy/ui/login_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isSecure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile screen'),
      ),
      body: Column(
        children: [
          ListTile(
            leading: const Text('Name:'),
            title: Text(preferences.getString('name') ?? ''),
          ),
          ListTile(
            leading: const Text('Password:'),
            title: Text(isSecure ? '***':preferences.getString('password') ?? ''),
            trailing: IconButton(onPressed: (){setState(() {
              isSecure ? isSecure=false : isSecure=true;
            });}, icon: Icon(isSecure ? Icons.remove_red_eye_sharp : Icons.hide_source),),
          ),
          Center(
            child: ElevatedButton(
              onPressed: (){setState(() {
                preferences.remove('name');
                preferences.remove('password');
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return const LoginScreen();
                }));
              });},
              child: const Text('Log out'),
            ),
          )
        ],
      ),
    );
  }
}
