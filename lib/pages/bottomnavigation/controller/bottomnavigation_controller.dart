import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  RxInt currentIndex = 0.obs;

  PageController pageController = PageController();

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  void changePageIndex(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
    update();
  }
}
