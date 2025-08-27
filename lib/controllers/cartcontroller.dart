import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_shop_app/models/product.dart';

class CartController extends GetxController {
  // store products with their quantities
  var cartItems = <Product, int>{}.obs;

  void addToCart(Product product) {
    if (cartItems.containsKey(product)) {
      cartItems[product] = cartItems[product]! + 1;
    } else {
      cartItems[product] = 1;
      Get.snackbar(
        "Added to Cart",
        "${product.name} has been added",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: const Duration(seconds: 1),
      );
    }
    cartItems.refresh();
  }

  void removeFromCart(Product product) {
    cartItems.remove(product);
    Get.snackbar(
      "Removed",
      "${product.name} has been removed",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: const Duration(seconds: 1),
    );
  }

  void increment(Product product) {
    cartItems[product] = (cartItems[product] ?? 0) + 1;
    cartItems.refresh();

    Get.snackbar(
      "Cart Updated",
      "${product.name} quantity increased",
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 1),
    );
  }

  void decrement(Product product) {
    if (cartItems[product] != null && cartItems[product]! > 1) {
      cartItems[product] = cartItems[product]! - 1;
      Get.snackbar(
        "Cart Updated",
        "${product.name} quantity decreased",
        snackPosition: SnackPosition.BOTTOM,

        duration: const Duration(seconds: 1),
      );
    } else {
      cartItems.remove(product);
      Get.snackbar(
        "Removed",
        "${product.name} has been removed",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: const Duration(seconds: 1),
      );
    }
    cartItems.refresh();
  }

  bool isInCart(Product product) {
    return cartItems.containsKey(product);
  }
}
