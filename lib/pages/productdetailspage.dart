import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/controllers/cartcontroller.dart';
import 'package:my_app/controllers/productcontroller.dart';
import 'package:my_app/models/product.dart';

class Productdetailspage extends StatefulWidget {
  final Product product;
  const Productdetailspage({super.key, required this.product});

  @override
  State<Productdetailspage> createState() => _ProductpageState();
}

class _ProductpageState extends State<Productdetailspage> {
  final CartController cartController = Get.put(CartController());
  final Productcontroller productcontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent),
      body: Stack(
        children: [
          SizedBox(height: 10),
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,

                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(widget.product.imageUrl),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.product.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                '₹${widget.product.price.toString()}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Container(
                                    width: 60,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      color: Colors.deepOrange.shade400,
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 6.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            size: 17,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            '4.5',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text('( ${widget.product.reviews} reviews)'),
                                ],
                              ),
                              SizedBox(height: 20),

                              Text(
                                'Color',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(backgroundColor: Colors.red),
                                  SizedBox(width: 20),

                                  CircleAvatar(backgroundColor: Colors.black),
                                  SizedBox(width: 20),
                                  CircleAvatar(backgroundColor: Colors.blue),
                                  SizedBox(width: 20),
                                  CircleAvatar(backgroundColor: Colors.brown),
                                  SizedBox(width: 20),
                                  CircleAvatar(),
                                ],
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Description',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                widget.product.description,
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                'Specifications',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                widget.product.specifications,
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                'Reviews',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                widget.product.reviews,
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 20),
                              SizedBox(
                                width: 150,
                                height: 40,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.black,
                                  ),
                                  onPressed: () {
                                    cartController.addToCart(widget.product);
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        'Add to Cart',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      SizedBox(width: 5),
                                      Icon(
                                        Icons.shopping_cart_checkout_outlined,
                                        color: Colors.white,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
