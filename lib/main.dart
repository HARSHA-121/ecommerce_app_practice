import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/bottomnavbar/bottomnavbar.dart';
import 'package:my_app/controllers/cartcontroller.dart';
import 'package:my_app/controllers/catitemcontroller.dart';
import 'package:my_app/controllers/productcontroller.dart';
import 'package:my_app/controllers/wishlistcontroller.dart';

void main() {
  Get.put(Productcontroller());
  Get.put(Catitemcontroller());
  Get.put(CartController());
  Get.put(WishlistController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: BottomNavBarExample(),
    );
  }
}
