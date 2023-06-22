import 'package:flutter/material.dart';

class Screen extends StatefulWidget {
  Screen({
    super.key,
    required this.name,
    required this.surname,
  });
  String name;
  String surname;
  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.name),
            Text(widget.surname),
            ElevatedButton(onPressed: (){setState(() {
              Navigator.pop(context);
            });}, child: const Text('Back'),),
          ],
        ),
      ),
    );
  }
}
