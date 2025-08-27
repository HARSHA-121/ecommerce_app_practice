import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/controllers/cartcontroller.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();

    return Scaffold(
      appBar: AppBar(title: Text("My Cart")),
      body: Obx(() {
        final products = cartController.cartItems.keys.toList();
        if (products.isEmpty) {
          return Center(child: Text('Your Cart is empty'));
        } else {
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              final quantity = cartController.cartItems[product] ?? 1;

              return Card(
                child: Stack(
                  children: [
                    ListTile(
                      leading: Image.asset(
                        product.imageUrl,
                        width: 50,
                        height: 50,
                      ),
                      title: Text(product.name),
                      subtitle: Text('₹${product.price}'),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          cartController.removeFromCart(product);
                        },
                      ),
                    ),
                    Positioned(
                      right: 50,
                      top: 10,
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              cartController.decrement(product);
                            },
                            icon: Icon(Icons.remove),
                          ),
                          Text(quantity.toString()),
                          IconButton(
                            onPressed: () {
                              cartController.increment(product);
                            },
                            icon: Icon(Icons.add),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }
      }),
    );
  }
}
