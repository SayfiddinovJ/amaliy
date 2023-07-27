import 'package:amaliy/providers/count_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 3'),
      ),
      body: Column(
        children: [
          const SizedBox(height: 50,),
          Consumer<CountProvider>(
            builder: (context,counterProvider,child){
              return Column(
                children: [
                  Center(
                    child: Text(
                      counterProvider.getResult.toString(),
                      style: const TextStyle(fontSize: 45),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: (){
                          counterProvider.sub();
                        },
                        child: const Text('-'),
                      ),
                      const SizedBox(width: 20,),
                      ElevatedButton(
                        onPressed: (){
                          counterProvider.add();
                        },
                        child: const Text('+'),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
