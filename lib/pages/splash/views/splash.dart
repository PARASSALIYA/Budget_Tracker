import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../utills/get_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 6),
      () => Get.offNamed(GetPages.bottomNavigation),
    );
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/gif/splash.gif',
          height: 200.h,
        ),
      ),
    );
  }
}
