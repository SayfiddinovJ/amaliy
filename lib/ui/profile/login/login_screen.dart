import 'package:amaliy/main.dart';
import 'package:amaliy/tab_bar.dart';
import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController textEditingControllerName = TextEditingController();
  late TextEditingController textEditingControllerPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: textEditingControllerName,
              decoration: const InputDecoration(
                hintText: 'Name'
              ),
            ),
            const SizedBox(height: 10,),
            TextField(
              controller: textEditingControllerPassword,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
            ),
            const SizedBox(height: 10,),
            Center(
              child: ElevatedButton(onPressed: (){setState(() {
                if(textEditingControllerName.text==''&&textEditingControllerPassword.text==''){
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Maydonlar to\'ldirilmagan')));
                }else{
                  preferences.setString('name', textEditingControllerName.text);
                  preferences.setString('password', textEditingControllerPassword.text);
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                    return const TabsBox();
                  }));
                }
                });}, child: const Text('Login'),),
            ),
          ],
        ),
      ),
    );
  }
}