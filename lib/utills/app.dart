import 'package:budget_tracker/utills/get_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BudgetTracker extends StatelessWidget {
  const BudgetTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, child) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        getPages: GetPages.getPages,
      );
    });
  }
}
