import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_shop_app/controllers/cartcontroller.dart';
import 'package:stylish_shop_app/models/product.dart';

class Cartbutton extends StatefulWidget {
  final Product product;
  const Cartbutton({super.key, required this.product});

  @override
  State<Cartbutton> createState() => _CartbuttonState();
}

class _CartbuttonState extends State<Cartbutton> {
  final CartController cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: Colors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40,
                width: 123,

                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text('-', style: TextStyle(color: Colors.white)),
                    ),

                    Text('1', style: TextStyle(color: Colors.white)),

                    TextButton(
                      onPressed: () {},
                      child: Text('+', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  cartController.addToCart(widget.product);
                },
                child: Container(
                  height: 50,
                  width: 140,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      'Add to Cart',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
