import 'package:flutter/material.dart';
class InfoScreen extends StatefulWidget {
  InfoScreen({
    super.key,
    required this.name,
    required this.img,
  });
  String name;
  String img;

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
