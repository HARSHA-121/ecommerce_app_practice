import 'package:get/get.dart';
import 'package:my_app/models/category_items.dart'; // adjust to your file path

class Catitemcontroller extends GetxController {
  var selectedCategory = "All".obs;
  var catitem = <CategoryModel>[
    CategoryModel(
      title: "All",
      imageurl: "assets/images/apple 1.png",
      isActive: true,
    ),
    CategoryModel(title: "Beauty", imageurl: "assets/images/beauty.png"),

    CategoryModel(title: "Fashion", imageurl: "assets/images/fashion.png"),
    CategoryModel(title: "Kids", imageurl: "assets/images/kids.png"),
    CategoryModel(title: "Mens", imageurl: "assets/images/mens.png"),
    CategoryModel(title: "Womens", imageurl: "assets/images/womens.png"),
  ].obs;

  // 🔑 This is the missing method
  void selectCategory(int index) {
    for (int i = 0; i < catitem.length; i++) {
      catitem[i].isActive = i == index;
    }
    selectedCategory.value = catitem[index].title;
  }
}
