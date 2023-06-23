import 'package:amaliy/main.dart';
import 'package:amaliy/ui/login_screen.dart';
import 'package:amaliy/utils/app_utils.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(10),
        children: [
          ...List.generate(AppImages.myList.length, (index){
            return GestureDetector(
              onTap: (){
                setState(() {
                  String a = preferences.getString('name') ?? '';
                  if(a==''){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return LoginScreen();
                    }));
                  }else{
                    print(index);
                  }
                });
              },

              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Image.asset(AppImages.myList[index]),
              ),
            );
          },),
        ],
      ),
    );
  }
}
