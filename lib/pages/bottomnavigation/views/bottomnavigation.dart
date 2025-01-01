import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../category/views/category.dart';
import '../../allcategory/views/allcategory.dart';
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
          AllCategoryPage(),
          CategoryPage(),
        ],
      ),
      bottomNavigationBar: Obx(
        () {
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
                icon: Icon(Icons.category),
                label: 'Explore',
                selectedIcon: Icon(Icons.explore),
              ),
              NavigationDestination(
                icon: Icon(Icons.category),
                label: 'Profile',
                selectedIcon: Icon(Icons.person),
              ),
            ],
          );
        },
      ),
    );
  }
}
