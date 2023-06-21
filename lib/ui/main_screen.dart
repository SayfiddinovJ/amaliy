import 'package:amaliy/ui/widget/image_container.dart';
import 'package:amaliy/ui/widget/list_tile.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MainScreen extends StatefulWidget{
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();

}

class _MainScreenState extends State<MainScreen> {
  late SharedPreferences preferences;
  @override
  void initState() async{
    preferences = await SharedPreferences.getInstance();
    super.initState();
  }
  int a = -1;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Home Screen'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('About me'),
          ),
          Row(
            children: [
              const SizedBox(width: 10,),
              SizedBox(
                width: (width/2)-20,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10,),
              SizedBox(
                width: (width/2)-20,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Padding(
                      padding: EdgeInsets.all(15.0),
                      child:  Text('+998'),
                    ),
                    hintText: 'Phone number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              Expanded(child: MyListTile(name: 'Ishlayman', isSelect: a==1,onTap: (){setState(() {
                a=1;
              });},)),
              Expanded(child: MyListTile(name: "O'qiyman", isSelect: a==2,onTap: (){setState(() {
                a=2;
              });},)),
              Expanded(child: MyListTile(name: 'Vaqtincha ishsizman', isSelect: a==3,onTap: (){setState(() {
                a=3;
              });},)),
            ],
          ),
          const SizedBox(height: 10,),
          Expanded(
              child: GridView.count(
                physics: const BouncingScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  ImageContainer(on: true,isSelect: true,),
                  ImageContainer(on: false,isSelect: false,),
                ],
              ),
          ),
          Container(
            padding: EdgeInsets.all(10),
              width: double.infinity,
              height: 70,
              child: ElevatedButton(onPressed: (){}, child: const Text('SAVE',),),),
        ],
      ),
    );
  }
}