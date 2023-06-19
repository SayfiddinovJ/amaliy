import 'package:amaliy/buttons.dart';
import 'package:amaliy/select.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int a = -1;
  static List<String> buttonsList = ['Flutter','.NET','Golang','JAVA','Frontend','PHP'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Home Screen')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 10,),
            const Center(
              child: Text("Ma'lumotlaringizni kiriting"),
            ),
            SizedBox(
              height: 50,
              child: Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...List.generate(buttonsList.length, (index) => Buttons(
                        text: buttonsList[index],
                        color: index==a ? Colors.grey:Colors.blue,
                        onTap: ()=>setState(() {
                          a=index;
                        }),)),
                    ],
                  ),
              ),
            ),
            SizedBox(height: 10,),
            Text('18 yoshdan kattamisiz?'),
            Select(tex: 'Ha'),
            Select(tex: 'Yo\'q'),
            SizedBox(height: 10,),
            ExpansionTile(title: Text('Ishlash turingizni tanlang'),children: [
              Text('Office'),
              SizedBox(height: 10,),
              Text('Home'),
              SizedBox(height: 10,),
            ],)
          ],
        ),
      ),
    );
  }
}
