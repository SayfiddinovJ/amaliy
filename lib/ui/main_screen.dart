import 'package:amaliy/service/notificaion_service.dart';
import 'package:amaliy/ui/detail/detail_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      body: ListTile(
        title: const Text('Home screen'),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const DetailScreen()));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          NotificationService.instance.showNotification();
        },
      ),
    );
  }
}
