import 'package:amaliy/data/models/data_model.dart';
import 'package:amaliy/data/models/universal_data.dart';
import 'package:amaliy/data/network/api_provider.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late DataModel dataModel;
  bool isLoading = true;

  _getInitialData() async {
    setState(() {
      isLoading = true;
    });
    List<UniversalData> results = await Future.wait([
      ApiProvider.getProducts(10)
    ]);

    if (results[0].error.isEmpty) {
      dataModel = results[0].data as DataModel;
    }
    print(dataModel.data.length);
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    _getInitialData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ...List.generate(dataModel.data.length, (index) => Text(dataModel.data[index].name)),
        ],
      ),
    );
  }
}
