import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MyListTile extends StatefulWidget {
  MyListTile({
    super.key,
    required this.name,
    required this.isSelect,
    required this.onTap
  });
  String name;
  bool isSelect;
  VoidCallback onTap;
  @override
  State<MyListTile> createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile>{
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: widget.onTap,
      leading: Icon(widget.isSelect ? Icons.radio_button_checked : Icons.radio_button_off,),
      title: Text(widget.name),
    );
  }
}
