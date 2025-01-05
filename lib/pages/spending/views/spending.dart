import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../../model/category_model.dart';
import '../../category/controller/category_controller.dart';
import '../../category/views/category.dart';

class SpendingPage extends StatelessWidget {
  const SpendingPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    CategoryController controller = Get.put(CategoryController());
    controller.fetchCategoryData();
    return Scaffold();
  }
}
