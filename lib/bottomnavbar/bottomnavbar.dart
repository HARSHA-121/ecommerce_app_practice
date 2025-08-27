import 'package:flutter/material.dart';
import 'package:stylish_shop_app/bottomnavpages/cartpage.dart';
import 'package:stylish_shop_app/bottomnavpages/homepage.dart';
import 'package:stylish_shop_app/bottomnavpages/searchpage.dart';
import 'package:stylish_shop_app/bottomnavpages/settingspage.dart';
import 'package:stylish_shop_app/bottomnavpages/wishlistpage.dart';

class BottomNavBarExample extends StatefulWidget {
  const BottomNavBarExample({super.key});

  @override
  State<BottomNavBarExample> createState() => _BottomNavBarExampleState();
}

class _BottomNavBarExampleState extends State<BottomNavBarExample> {
  int currentIndex = 0;

  final List<Widget> pages = [
    Homepage(),
    Wishlistpage(),
    CartPage(),
    Searchpage(),
    Settingspage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            currentIndex = 2;
          });
        },
        backgroundColor: Colors.white,
        shape: CircleBorder(),
        elevation: 8,
        child: const Icon(Icons.shopping_cart, color: Colors.black),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  _buildNavItem(Icons.home, "Home", 0),
                  const SizedBox(width: 50),
                  _buildNavItem(Icons.favorite_border, "Wishlist", 1),
                ],
              ),

              Row(
                children: [
                  _buildNavItem(Icons.search, "Search", 3),
                  const SizedBox(width: 50),
                  _buildNavItem(Icons.settings, "Setting", 4),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: isSelected ? Colors.red : Colors.black),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? Colors.red : Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
