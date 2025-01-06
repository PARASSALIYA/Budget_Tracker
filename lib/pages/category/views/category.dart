import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:budget_tracker/pages/category/controller/category_controller.dart';

GlobalKey<FormState> formKey = GlobalKey<FormState>();

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});
  @override
  Widget build(BuildContext context) {
    CategoryController controller = Get.put(CategoryController());
    TextEditingController textController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80.h,
            ),
            Text(
              "Category",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            TextFormField(
              controller: textController,
              validator: (value) => value!.isEmpty ? "Enter Category" : null,
              decoration: InputDecoration(
                hintText: "Enter Category",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.categoryMap.length,
                itemBuilder: (context, index) {
                  return GetBuilder<CategoryController>(
                    builder: (context) {
                      return GestureDetector(
                        onTap: () {
                          controller.getCategoryIndex(index);
                        },
                        child: controller.categoryIndex == index
                            ? Card(
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage: AssetImage(
                                      controller.categoryMap[index]['images'],
                                    ),
                                  ),
                                  title: Text(
                                    controller.categoryMap[index]['name'],
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  trailing: controller.categoryIndex == index
                                      ? const Icon(
                                          Icons.check,
                                          color: Colors.green,
                                        )
                                      : const Icon(
                                          Icons.check,
                                          color: Colors.transparent,
                                        ),
                                ),
                              )
                            : ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: AssetImage(
                                    controller.categoryMap[index]['images'],
                                  ),
                                ),
                                title: Text(
                                  controller.categoryMap[index]['name'],
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                trailing: controller.categoryIndex == index
                                    ? const Icon(
                                        Icons.check,
                                        color: Colors.green,
                                      )
                                    : const Icon(
                                        Icons.check,
                                        color: Colors.transparent,
                                      ),
                              ),
                      );
                    },
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton.extended(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    String name = textController.text;

                    String assetPath = controller
                        .categoryMap[controller.categoryIndex!]['images'];

                    ByteData data = await rootBundle.load(assetPath);
                    Uint8List image = data.buffer.asUint8List();
                    controller.insertCategoryData(name, image);
                    controller.fetchCategoryData();
                    controller.clearCategoryIndex();
                    textController.clear();
                  }
                },
                icon: const Icon(
                  Icons.add,
                ),
                label: const Text("Add Category"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
