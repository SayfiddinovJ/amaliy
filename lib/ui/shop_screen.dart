import 'package:amaliy/ui/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10,),
            listWidget.isEmpty? const Align(child: Text('Nothing to show'),):listWidget.reduce((value, element) => Slidable(
              key: const ValueKey(0),

              startActionPane: ActionPane(
                motion: const StretchMotion(),

                dismissible: DismissiblePane(onDismissed: () {}),

                children: [
                  SlidableAction(
                    onPressed: (c){},
                    backgroundColor: const Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                  SlidableAction(
                    onPressed: (c){},
                    backgroundColor: const Color(0xFF21B7CA),
                    foregroundColor: Colors.white,
                    icon: Icons.share,
                    label: 'Share',
                  ),
                ],
              ),

              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    flex: 2,
                    onPressed: (c){},
                    backgroundColor: const Color(0xFF7BC043),
                    foregroundColor: Colors.white,
                    icon: Icons.archive,
                    label: 'Archive',
                  ),
                  SlidableAction(
                    onPressed: (c){},
                    backgroundColor: const Color(0xFF0392CF),
                    foregroundColor: Colors.white,
                    icon: Icons.save,
                    label: 'Save',
                  ),
                ],
              ),
              child: element,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
