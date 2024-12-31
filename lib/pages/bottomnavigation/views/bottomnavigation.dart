import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:budget_tracker/pages/bottomnavigation/controller/bottomnavigation_controller.dart';

class BottomNavigationPage extends StatelessWidget {
  const BottomNavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavigationController controller =
        Get.put(BottomNavigationController());
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        onPageChanged: (value) {
          controller.changeIndex(value);
        },
        children: const [
          Center(
            child: Text('Home'),
          ),
          Center(
            child: Text('Explore'),
          ),
          Center(
            child: Text('Profile'),
          ),
        ],
      ),
      bottomNavigationBar: Obx(() {
        return NavigationBar(
          selectedIndex: controller.currentIndex.value,
          onDestinationSelected: (index) {
            controller.changeIndex(index);
            controller.changePageIndex(index);
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home',
              selectedIcon: Icon(Icons.home),
            ),
            NavigationDestination(
              icon: Icon(Icons.explore),
              label: 'Explore',
              selectedIcon: Icon(Icons.explore),
            ),
            NavigationDestination(
              icon: Icon(Icons.person),
              label: 'Profile',
              selectedIcon: Icon(Icons.person),
            ),
          ],
        );
      }),
    );
  }
}
