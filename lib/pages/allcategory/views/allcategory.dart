import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../model/category_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:budget_tracker/pages/category/controller/category_controller.dart';

class AllCategoryPage extends StatelessWidget {
  const AllCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    CategoryController controller = Get.put(CategoryController());

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(
            height: 60.h,
          ),
          TextField(
            onChanged: (val) {
              controller.searchCategoryData(val);
            },
            decoration: const InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              prefixIcon: Icon(Icons.search),
              hintText: "Search",
            ),
          ),
          Expanded(
            child: GetBuilder<CategoryController>(
              builder: (context) {
                return FutureBuilder(
                  future: controller.categoryList,
                  builder: (context, snpShot) {
                    List<CategoryModel> categoryListData = snpShot.data ?? [];
                    return ListView.builder(
                      itemCount: categoryListData.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            textController.text = categoryListData[index].name;
                            controller.clearCategoryIndex();

                            Get.bottomSheet(
                              BottomSheet(
                                onClosing: () {},
                                builder: (context) {
                                  return Container(
                                    padding: const EdgeInsets.all(16),
                                    child: Form(
                                      key: formKey,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          Text(
                                            "Edit Category",
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
                                            validator: (value) => value!.isEmpty
                                                ? "Enter Category"
                                                : null,
                                            decoration: InputDecoration(
                                              labelText: "Category Name",
                                              prefixIcon:
                                                  const Icon(Icons.search),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: ListView.builder(
                                              itemCount:
                                                  controller.categoryMap.length,
                                              itemBuilder: (context, i) {
                                                return GetBuilder<
                                                    CategoryController>(
                                                  builder: (context) {
                                                    return GestureDetector(
                                                      onTap: () {
                                                        controller
                                                            .getCategoryIndex(
                                                                i);
                                                      },
                                                      child: Card(
                                                        color: (controller
                                                                    .categoryIndex !=
                                                                null)
                                                            ? (controller
                                                                        .categoryIndex ==
                                                                    i)
                                                                ? Colors.green
                                                                : Colors
                                                                    .transparent
                                                            : (i ==
                                                                    categoryListData[
                                                                            index]
                                                                        .imageIndex)
                                                                ? Colors.green
                                                                : Colors
                                                                    .transparent,
                                                        child: ListTile(
                                                          leading: CircleAvatar(
                                                            backgroundImage:
                                                                AssetImage(
                                                              controller
                                                                      .categoryMap[
                                                                  i]['images'],
                                                            ),
                                                          ),
                                                          title: Text(
                                                            controller
                                                                    .categoryMap[
                                                                i]['name'],
                                                            style: TextStyle(
                                                              fontSize: 16.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                          trailing: controller
                                                                      .categoryIndex ==
                                                                  i
                                                              ? const Icon(
                                                                  Icons.check,
                                                                  color: Colors
                                                                      .green,
                                                                )
                                                              : const Icon(
                                                                  Icons.check,
                                                                  color: Colors
                                                                      .transparent,
                                                                ),
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
                                            child:
                                                FloatingActionButton.extended(
                                              onPressed: () async {
                                                if (formKey.currentState!
                                                    .validate()) {
                                                  String name =
                                                      textController.text;

                                                  String assetPath = controller
                                                              .categoryMap[
                                                          controller
                                                              .categoryIndex!]
                                                      ['images'];

                                                  ByteData data =
                                                      await rootBundle
                                                          .load(assetPath);
                                                  Uint8List image =
                                                      data.buffer.asUint8List();
                                                  CategoryModel model =
                                                      CategoryModel(
                                                    id: categoryListData[index]
                                                        .id,
                                                    name: name,
                                                    image: image,
                                                    imageIndex: index,
                                                  );
                                                  controller
                                                      .editCategoryData(model);
                                                  controller
                                                      .clearCategoryIndex();
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
                                },
                              ),
                            );
                          },
                          onLongPress: () {
                            controller
                                .deleteCategoryData(categoryListData[index].id);
                          },
                          child: Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage:
                                    MemoryImage(categoryListData[index].image),
                              ),
                              title: Text(categoryListData[index].name),
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
