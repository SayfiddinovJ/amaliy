import 'package:amaliy/data/model/main_model.dart';
import 'package:amaliy/providers/count_provider.dart';
import 'package:amaliy/providers/model_provider.dart';
import 'package:amaliy/providers/number_provider.dart';
import 'package:amaliy/providers/tab_box_provider.dart';
import 'package:amaliy/ui/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences preferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  preferences = await SharedPreferences.getInstance();
  runApp(MultiProvider(
    providers: [
      Provider(
        create: (context) => NumberProvider(),
        lazy: true,
      ),
      ChangeNotifierProvider(
        create: (context) => CountProvider(count: 0),
        lazy: true,
      ),
      ChangeNotifierProvider(
        create: (context) =>
            MainModelProvider(mainModel: MainModel(result: [])),
        lazy: true,
      ),
      ChangeNotifierProvider(
        create: (context) => TabBoxProvider(count: 0),
        lazy: true,
      ),
    ],
    child: const MyApp(),
  ));
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
      home: MainScreen(),
    );
  }
}
