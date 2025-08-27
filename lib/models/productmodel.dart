import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_shop_app/controllers/cartcontroller.dart';
import 'package:stylish_shop_app/controllers/productcontroller.dart';
import 'package:stylish_shop_app/controllers/wishlistcontroller.dart';
import 'package:stylish_shop_app/pages/productdetailspage.dart';

class Productmodel extends StatefulWidget {
  const Productmodel({super.key});

  @override
  State<Productmodel> createState() => _ProductmodelState();
}

class _ProductmodelState extends State<Productmodel> {
  @override
  Widget build(BuildContext context) {
    final Productcontroller productcontroller = Get.find();
    final WishlistController wishlistController = Get.find();

    return Obx(() {
      return GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: productcontroller.products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          final product = productcontroller.products[index];
          final CartController cartController = Get.find();

          return LayoutBuilder(
            builder: (context, constraints) {
              // Responsive sizes based on available grid cell
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
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: imageHeight,
                            child: GestureDetector(
                              onTap: () {
                                Get.to(
                                  () => Productdetailspage(product: product),
                                );
                              },
                              child: Center(
                                child: Image.asset(
                                  product.imageUrl,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.005,
                          ),

                          //Product Name
                          Text(
                            product.name,
                            style: TextStyle(
                              fontSize: cardWidth * 0.08, // scale with width
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          //Description
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

                          // ✅ Price + Add to Cart
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
                                final isInCart = cartController.isInCart(
                                  product,
                                );
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
                                              borderRadius:
                                                  BorderRadiusGeometry.circular(
                                                    8,
                                                  ),
                                            ),
                                          ),
                                          onPressed: () {
                                            cartController.addToCart(product);
                                          },
                                          child: Row(
                                            children: const [
                                              Text(
                                                'Add',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
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

                  // Wishlist Button (Responsive)
                  Positioned(
                    top: 5,
                    right: 5,

                    child: Obx(() {
                      final isInWishlist = wishlistController.isInWishlist(
                        product,
                      );
                      return IconButton(
                        onPressed: () {
                          wishlistController.toggleWishlist(product);
                        },
                        icon: Icon(
                          isInWishlist ? Icons.favorite : Icons.favorite_border,
                          color: isInWishlist ? Colors.red : Colors.grey,
                          size: cardWidth * 0.12, // responsive size
                        ),
                      );
                    }),
                  ),
                ],
              );
            },
          );
        },
      );
    });
  }
}
