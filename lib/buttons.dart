import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';
class Buttons extends StatefulWidget {
  Buttons({super.key,required this.text,required this.color,required this.onTap});
  String text;
  Color color;
  VoidCallback onTap;
  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: widget.color,
          ),
          child: ZoomTapAnimation(
            onTap: widget.onTap,
            child: Center(child: Text(widget.text),),),),
    );
  }
}
