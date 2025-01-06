import 'package:flutter/services.dart';

class CategoryModel {
  int id;
  String name;
  Uint8List image;
  int imageIndex;
  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    required this.imageIndex,
  });

  factory CategoryModel.fromMap(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['categoryID'],
      name: json['categoryName'],
      image: json['categoryImage'],
      imageIndex: json['categoryImageIndex'],
    );
  }
}
