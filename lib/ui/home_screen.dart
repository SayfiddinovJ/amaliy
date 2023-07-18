import 'package:amaliy/data/model/translate_model.dart';
import 'package:amaliy/data/model/universal_data.dart';
import 'package:amaliy/data/network/api_provider.dart';
import 'package:amaliy/main.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController textEditingController = TextEditingController();

  bool isLoading = false;

  List<ResponseData> responseData = [];

  _fetchResult() async {
    setState(() {
      isLoading = true;
    });
    UniversalData universalData = await ApiProvider.getWord(word: 'word', lang: '${lan[0]}|${lan[1]}');

    setState(() {
      isLoading = false;
    });

    if (universalData.error.isEmpty) {
      ResponseData responseData =
      universalData.data as ResponseData;
      setState(() {});
    }
  }

  @override
  void initState() {
    _fetchResult();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Translate'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
            child: TextField(
              controller: textEditingController,
              onSubmitted: (v){
                textEditingController.text = v;
                setState(() {});
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 100,
            margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(''),
          ),
        ],
      ),
    );
  }
}
