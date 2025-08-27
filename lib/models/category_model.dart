import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_shop_app/controllers/catitemcontroller.dart';

class CategoryModel extends StatefulWidget {
  const CategoryModel({super.key});

  @override
  State<CategoryModel> createState() => _CategoryModelState();
}

class _CategoryModelState extends State<CategoryModel> {
  final Catitemcontroller catitemcontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: catitemcontroller.catitem.length,
        itemBuilder: (context, index) {
          final catitem = catitemcontroller.catitem[index];
          final isSelected = catitem.isActive;

          return GestureDetector(
            onTap: () {
              setState(() {
                catitemcontroller.selectCategory(index);
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: isSelected
                        ? Colors.black
                        : Colors.grey[200],
                    child: CircleAvatar(
                      radius: 28,
                      backgroundImage: AssetImage(catitem.imageurl),
                    ),
                  ),
                  Text(
                    catitem.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: isSelected ? Colors.black : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
