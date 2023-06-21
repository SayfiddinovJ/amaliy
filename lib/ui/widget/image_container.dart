import 'package:flutter/material.dart';
class ImageContainer extends StatelessWidget {
  ImageContainer({
    super.key,
    required this.on,
    required this.isSelect,
  });
  bool on;
  bool isSelect;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 5),
          width: (width/2)-20,
          height: (width/2)-20,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(on ? 'assets/images/one.jpg':'assets/images/two.jpg',fit: BoxFit.cover,),
          ),
        ),
        Positioned(
            child: Center(child: isSelect ? const Icon(Icons.safety_check,size: 50,) : const Text('')),
        )
      ],
    );
  }
}
