import 'package:amaliy/tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
late SharedPreferences preferences;
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  preferences= await SharedPreferences.getInstance();
  runApp(MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabsBox(),
    );
  }
}
