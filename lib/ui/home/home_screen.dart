import 'package:amaliy/main.dart';
import 'package:amaliy/sqlflite/sqlflite.dart';
import 'package:amaliy/ui/home/info/info_screen.dart';
import 'package:amaliy/ui/profile/login/login_screen.dart';
import 'package:amaliy/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool like = false;
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
        childAspectRatio: 0.85,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(10),
        children: [
          _container(AppImages.airpods, 'Airpods', '340000', '339000',0),
          _container(AppImages.iphone, 'Iphone', '12000000', '119000000',1),
          _container(AppImages.keyboardMouse, 'Keyboard and mouse', '450000', '449000',2),
          _container(AppImages.mac, 'Mac', '14000000', '13009000',3),
          _container(AppImages.pc, 'PC', '17900000', '16900000',4),
          _container(AppImages.speaker, 'Speaker', '300000', '209000',5),
        ],
      ),
    );
  }
  _container(String img,String name,String price,String price2,int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          String name1 = preferences.getString('name') ?? '';
          String password = preferences.getString('password') ?? '';
          if(name1=='' && password==''){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
              return const LoginScreen();
            }));
          }else{
            switch(index){
              case 0:
                Navigator.push(context, MaterialPageRoute(builder: (context)=>InfoScreen(name: name, img: img, price: price, price2: price2,),),);
              case 1:
                Navigator.push(context, MaterialPageRoute(builder: (context)=>InfoScreen(name: name, img: img, price: price, price2: price2,),),);
              case 2:
                Navigator.push(context, MaterialPageRoute(builder: (context)=>InfoScreen(name: name, img: img, price: price, price2: price2,),),);
              case 3:
                Navigator.push(context, MaterialPageRoute(builder: (context)=>InfoScreen(name: name, img: img, price: price, price2: price2,),),);
              case 4:
                Navigator.push(context, MaterialPageRoute(builder: (context)=>InfoScreen(name: name, img: img, price: price, price2: price2,),),);
              case 5:
                Navigator.push(context, MaterialPageRoute(builder: (context)=>InfoScreen(name: name, img: img, price: price, price2: price2,),),);
            }
          }
        });
      },

      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                      height: 105,
                      child: Image.asset(img),
                  ),
                ),
                const Spacer(),
                RichText(text: TextSpan(children: [
                  const TextSpan(text: 'Name - ',style: TextStyle(
                    color: Colors.white,
                  ),),
                  TextSpan(text: name,style: const TextStyle(
                    color: Colors.yellow,
                  ),),
                ],),),
                RichText(text: TextSpan(children: [
                  const TextSpan(text: 'Price - ',style: TextStyle(
                    color: Colors.white,
                    inherit: true
                  ),),
                  TextSpan(text: '$price so\'m',style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.red,
                  ),),
                ],),),
                Text(price2,style: const TextStyle(
                  color: Colors.yellow
                ),),
                const SizedBox(height: 5,),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: LikeButton(
                onTap: (like)async{
                  LocalDatabase.insertTodo(img, name, price);
                  like==false;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
