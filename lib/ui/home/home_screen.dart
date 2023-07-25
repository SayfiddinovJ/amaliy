import 'dart:math';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
  late Animation<double> animationLogo;
  bool isTap = false;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(seconds: 5));

    animation = Tween<double>(begin: 0, end: 4*pi).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.linear,
      reverseCurve: Curves.linear,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {

      });
    animationLogo = Tween<double>(begin: 4*pi, end: 0).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.linear,
      reverseCurve: Curves.linear,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {

      });
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation"),
      ),
      body: Center(
        child: Transform.rotate(
          angle: animation.value,
          child: SizedBox(
            height: 250,
            width: 250,
            child: Stack(
              children: [
                const SizedBox(
                  height: 250,
                  width: 250,
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Transform.rotate(
                      angle: animationLogo.value,
                      child: const FlutterLogo(size: 100,)
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Transform.rotate(
                      angle: animationLogo.value,
                      child: const FlutterLogo(size: 100,)
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Transform.rotate(
                      angle: animationLogo.value,
                      child: const FlutterLogo(size: 100,)
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Transform.rotate(
                      angle: animationLogo.value,
                      child: const FlutterLogo(size: 100,)
                  ),
                ),
              ],
            ),
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
          onPressed: () {
          setState(() {
            isTap != isTap;
          });
          },
          child: const Icon(Icons.not_started_outlined)
      ),
    );
  }
}
