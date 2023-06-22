import 'package:amaliy/main.dart';
import 'package:amaliy/route.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late TextEditingController textEditingControllerName = TextEditingController();
  late TextEditingController textEditingControllerSurname = TextEditingController();

  @override
  void initState() {
    textEditingControllerName.text = preferences.getString('name')??'';
    textEditingControllerSurname.text = preferences.getString('surname')??'';
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: textEditingControllerName,
              decoration: const InputDecoration(
                hintText: 'Name',
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: textEditingControllerSurname,
              decoration: const InputDecoration(
                hintText: 'Surname',
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: (){setState(() {
              if(textEditingControllerName.text=='' || textEditingControllerSurname.text==''){
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Maydonlar to'ldirilmadi",),),);
              }else{
                preferences.setString('name', textEditingControllerName.text);
                preferences.setString('surname', textEditingControllerSurname.text);
                Navigator.pushNamed(context, RouteNames.screen);
              }
            });}, child: const Text('Save'),),
          ],
        ),
      ),
    );
  }

}
