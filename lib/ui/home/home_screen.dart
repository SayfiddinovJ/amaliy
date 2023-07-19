import 'package:amaliy/model/dog_model.dart';
import 'package:amaliy/sqlflite/sqlflite.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textEditingControllerName = TextEditingController();
  TextEditingController textEditingControllerAge = TextEditingController();
  List<Dog> dog = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sqflite'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20,),
            TextField(
              controller: textEditingControllerName,
              decoration: InputDecoration(
                hintText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
            const SizedBox(height: 20,),
            TextField(
              keyboardType: TextInputType.number,
              controller: textEditingControllerAge,
              decoration: InputDecoration(
                hintText: 'Age',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: (){
                if(textEditingControllerName.text.isNotEmpty && textEditingControllerAge.text.isNotEmpty){
                  dog.add(Dog(0,name: textEditingControllerName.text, age: int.parse(textEditingControllerAge.text),),);
                  List.generate(dog.length, (index)async{
                    await LocalDatabase.insertDog(dog[index]);
                  });
                  setState(() {});
                }
              },
              child: const Text('Enter'),
            ),
            const SizedBox(height: 20,),
            ...List.generate(dog.length, (index){
              return ListTile(
                title: Text(dog[index].name),
                subtitle: Text(dog[index].age.toString()),
                trailing: Text(dog[index].id.toString()),
              );
            }),
          ],
        ),
      ),
    );
  }
}
