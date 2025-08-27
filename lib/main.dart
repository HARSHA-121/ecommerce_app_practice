import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_shop_app/bottomnavbar/bottomnavbar.dart';
import 'package:stylish_shop_app/controllers/cartcontroller.dart';
import 'package:stylish_shop_app/controllers/catitemcontroller.dart';
import 'package:stylish_shop_app/controllers/productcontroller.dart';
import 'package:stylish_shop_app/controllers/wishlistcontroller.dart';
import 'package:stylish_shop_app/intro_screens/splashscreen.dart';

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

      home: Splashscreen(),
    );
  }
}
