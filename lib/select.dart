import 'package:flutter/material.dart';
class Select extends StatefulWidget {
  Select({super.key,required this.tex});
  String tex;
  @override
  State<Select> createState() => _SelectState();
}

class _SelectState extends State<Select> {
  bool isSelect = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){setState(() {
        isSelect=true;
      });},
      child: Row(
        children: [
          Icon(isSelect ? Icons.circle : Icons.circle_outlined),
          Text(widget.tex),
        ],
      ),
    );
  }
}
