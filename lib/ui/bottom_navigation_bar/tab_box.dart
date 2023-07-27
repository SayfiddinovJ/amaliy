import 'package:amaliy/providers/tab_box_provider.dart';
import 'package:amaliy/ui/bottom_navigation_bar/first.dart';
import 'package:amaliy/ui/bottom_navigation_bar/second.dart';
import 'package:amaliy/ui/bottom_navigation_bar/third.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabBox extends StatelessWidget {
  const TabBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TabBoxProvider>(context,listen: true);
    List<Widget> screens = [
      const FirstScreen(),
      const SecondScreen(),
      const ThirdScreen()
    ];
    return Scaffold(
      body: Consumer<TabBoxProvider>(
        builder: (context,tabBoxProvider,child){
          return screens[tabBoxProvider.getIndex];
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              topLeft: Radius.circular(16),
            ),
            boxShadow: [
              BoxShadow(
                spreadRadius: 20,
                blurRadius: 25,
                color: Colors.grey.shade200,
              ),
            ]),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(16),
            topLeft: Radius.circular(16),
          ),
          child: BottomNavigationBar(
            elevation: 20,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.black,
            iconSize: 36,
            onTap: (index) {
              provider.setIndex(index);
            },
            items: [
              getBottomNavItem(
                icon: Icons.home,
                label: "Home",
              ),
              getBottomNavItem(
                icon: Icons.settings,
                label: "Settings",
              ),
              getBottomNavItem(
                icon: Icons.person,
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem getBottomNavItem({
    required IconData icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      backgroundColor: Colors.red,
      activeIcon: Icon(
        icon,
      ),
      icon: Icon(icon),
      label: label,
    );
  }
}
