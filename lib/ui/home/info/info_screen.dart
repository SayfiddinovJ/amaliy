import 'package:amaliy/models/product_model/product_model.dart';
import 'package:amaliy/ui/storage.dart';
import 'package:flutter/material.dart';

import '../../../data/local/db/local_database.dart';

// ignore: must_be_immutable
class InfoScreen extends StatefulWidget {
  InfoScreen({
    super.key,
    required this.name,
    required this.img,
    required this.price,
    required this.price2,
  });
  String name;
  String img;
  String price;
  String price2;

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            setState(() {
              LocalDatabase.insertProduct(ProductModelSql(image: widget.img, name: widget.name, count: 1));
              listWidget.add(Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(vertical: 40,horizontal: 10),
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 20,),
                    child: Image.asset(widget.img,height: 150,),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RichText(text: TextSpan(children: [
                        const TextSpan(text: 'Name - ',style: TextStyle(
                          color: Colors.white,
                        ),),
                        TextSpan(text: widget.name,style: const TextStyle(
                          color: Colors.yellow,
                        ),),
                      ],),),
                      RichText(text: TextSpan(children: [
                        const TextSpan(text: 'Price - ',style: TextStyle(
                            color: Colors.white,
                            inherit: true
                        ),),
                        TextSpan(text: '${widget.price} so\'m',style: const TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.red,
                        ),),
                      ],),),
                      Text(widget.price2,style: const TextStyle(
                          color: Colors.yellow
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              );
            },);
            }, icon: const Icon(Icons.save_alt,color: Colors.black,),),
          const SizedBox(width: 10,),
        ],
        leading: IconButton(onPressed: (){setState(() {
          Navigator.pop(context);
          });}, icon: const Icon(Icons.arrow_back,color: Colors.black,),),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(widget.name,style: const TextStyle(color: Colors.black),),),


      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                height: 200,
                child: Image.asset(widget.img),
              ),
            ),
            const SizedBox(height: 30),
            const Text('Nomi',style: TextStyle(color: Colors.blue),),
            Text(widget.name),
            const Text('Ba\'tafsil',style: TextStyle(color: Colors.blue),),
            const Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
          ],
        ),
      ),
    );
  }
}