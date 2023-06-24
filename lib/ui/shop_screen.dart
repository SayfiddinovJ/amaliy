import 'package:amaliy/ui/storage.dart';
import 'package:flutter/material.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              listWidget.isEmpty? const Center(child: Text('Nothing to show'),):listWidget.reduce((value, element) => element),
            ],
          ),
        ),
      ),
    );
  }
}
