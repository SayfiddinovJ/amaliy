import 'package:amaliy/data/network/api.dart';
import 'package:amaliy/models/region_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  late final RegionModel regionModel;
  getRegion()async{
    setState(() {
      isLoading=true;
    });
    regionModel = await Api.getR();
    setState(() {
      isLoading=false;
    });
  }

  @override
  void initState() {
    getRegion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isLoading? const Center(child: CircularProgressIndicator()) : Text(regionModel.region),
        ],
      ),
    );
  }
}
