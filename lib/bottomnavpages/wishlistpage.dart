import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_shop_app/controllers/cartcontroller.dart';
import 'package:stylish_shop_app/controllers/wishlistcontroller.dart';
import 'package:stylish_shop_app/pages/productdetailspage.dart';
import 'package:stylish_shop_app/models/product.dart'; // Make sure you have your Product model

class Wishlistpage extends StatefulWidget {
  const Wishlistpage({super.key});

  @override
  State<Wishlistpage> createState() => _WishlistpageState();
}

class _WishlistpageState extends State<Wishlistpage> {
  final WishlistController wishlistController = Get.find();
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: const Text("My Wishlist")),
      body: Obx(() {
        final products = wishlistController.wishlistItems.keys.toList();

        if (products.isEmpty) {
          return const Center(child: Text('Your Wishlist is empty'));
        }

        return GridView.builder(
          padding: EdgeInsets.all(screenWidth * 0.03),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.65,
            crossAxisSpacing: screenWidth * 0.03,
            mainAxisSpacing: screenHeight * 0.02,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            return WishlistCard(
              product: product,
              cartController: cartController,
              wishlistController: wishlistController,
            );
          },
        );
      }),
    );
  }
}

class WishlistCard extends StatelessWidget {
  final Product product;
  final CartController cartController;
  final WishlistController wishlistController;

  const WishlistCard({
    super.key,
    required this.product,
    required this.cartController,
    required this.wishlistController,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double cardWidth = constraints.maxWidth;
        double imageHeight = constraints.maxHeight * 0.45;
        double buttonHeight = constraints.maxHeight * 0.12;

        return Stack(
          children: [
            Container(
              width: cardWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 5,
                    offset: const Offset(2, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ✅ Product Image
                    SizedBox(
                      height: imageHeight,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => Productdetailspage(product: product));
                        },
                        child: Center(
                          child: Image.asset(
                            product.imageUrl,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 5),

                    // ✅ Product Name
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        product.name,
                        style: TextStyle(
                          fontSize: cardWidth * 0.08,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // ✅ Description
                    Text(
                      product.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: cardWidth * 0.07,
                        fontWeight: FontWeight.normal,
                      ),
                    ),

                    const Spacer(),

                    // ✅ Price + Cart Button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '₹${product.price.toString()}',
                          style: TextStyle(
                            fontSize: cardWidth * 0.1,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Obx(() {
                          final isInCart = cartController.isInCart(product);
                          final quantity =
                              cartController.cartItems[product] ?? 1;

                          return isInCart
                              ? Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        cartController.decrement(product);
                                      },
                                      icon: const Icon(Icons.remove),
                                    ),
                                    Text(quantity.toString()),
                                    IconButton(
                                      onPressed: () {
                                        cartController.increment(product);
                                      },
                                      icon: const Icon(Icons.add),
                                    ),
                                  ],
                                )
                              : SizedBox(
                                  height: buttonHeight,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    onPressed: () {
                                      cartController.addToCart(product);
                                    },
                                    child: const Row(
                                      children: [
                                        Text(
                                          'Add',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SizedBox(width: 5),
                                        Icon(
                                          Icons.shopping_cart,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                        }),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // ✅ Wishlist Toggle Button
            Positioned(
              top: 5,
              right: 5,
              child: IconButton(
                onPressed: () {
                  wishlistController.toggleWishlist(product);
                },
                icon: Icon(Icons.close),
              ),
            ),
          ],
        );
      },
    );
  }
}
