import 'package:amaliy/ui/favorites_screen.dart';
import 'package:amaliy/ui/home_screen.dart';
import 'package:amaliy/ui/profile_screen.dart';
import 'package:amaliy/ui/shop_screen.dart';
import 'package:flutter/material.dart';

class TabsBox extends StatefulWidget {
  const TabsBox({Key? key}) : super(key: key);

  @override
  State<TabsBox> createState() => _TabsBoxState();
}

class _TabsBoxState extends State<TabsBox> {
  int currentTabIndex = 0;

  List<Widget> screens = [];

  @override
  void initState() {
    screens.add(HomeScreen());
    screens.add(ShopScreen());
    screens.add(FavoritesScreen());
    screens.add(ProfileScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentTabIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.blue,
        showSelectedLabels: false,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        onTap: (index) {
          setState(() {
            currentTabIndex = index;
          });
          print(index);
        },
        currentIndex: currentTabIndex,
        items: [
          getBottomNavItem(
            icon: Icons.home,
            label: "",
          ),
          getBottomNavItem(
            icon: Icons.shopping_cart,
            label: "",
          ),
          getBottomNavItem(
            icon: Icons.favorite,
            label: "",
          ),
          getBottomNavItem(
            icon: Icons.person_2,
            label: "",
          )
        ],
      ),
    );
  }

  BottomNavigationBarItem getBottomNavItem({
    required IconData icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      backgroundColor: Colors.blue,
      activeIcon: Icon(
        icon,
        color: Colors.yellow,
      ),
      icon: Icon(icon),
      label: label,
    );
  }
}
