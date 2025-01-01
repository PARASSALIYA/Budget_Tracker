import 'package:flutter/material.dart';

List<Map<String, dynamic>> categoryList = [
  {
    "name": "beauty",
    "images": "assets/images/beauty.webp",
  },
  {
    "name": "bills",
    "images": "assets/images/bills.png",
  },
  {
    "name": "car",
    "images": "assets/images/car.png",
  },
  {
    "name": "clothing",
    "images": "assets/images/clothing.png",
  },
  {
    "name": "education",
    "images": "assets/images/education.png",
  },
  {
    "name": "electronics",
    "images": "assets/images/electronics.png",
  },
  {
    "name": "sports",
    "images": "assets/images/sport.png",
  },
  {
    "name": "food",
    "images": "assets/images/food.jpg",
  },
  {
    "name": "health",
    "images": "assets/images/health.jpg",
  },
  {
    "name": "home",
    "images": "assets/images/home.png",
  },
  {
    "name": "insurance",
    "images": "assets/images/insurance.jpg",
  },
  {
    "name": "movie",
    "images": "assets/images/movie.jpg",
  },
  {
    "name": "refund",
    "images": "assets/images/refund.webp",
  },
  {
    "name": "salary",
    "images": "assets/images/salary.png",
  },
  {
    "name": "shopping",
    "images": "assets/images/shopping.png",
  },
  {
    "name": "social",
    "images": "assets/images/social.webp",
  },
  {
    "name": "sport",
    "images": "assets/images/sport.png",
  },
  {
    "name": "tax",
    "images": "assets/images/tax.png",
  },
  {
    "name": "telephone",
    "images": "assets/images/telephone.webp",
  },
  {
    "name": "transport",
    "images": "assets/images/transportation.png",
  },
];

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        itemCount: categoryList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (context, index) {
          return Column(
            children: [
              Image.asset(categoryList[index]['images']),
              Text(
                categoryList[index]['name'],
              ),
            ],
          );
        },
      ),
    );
  }
}
