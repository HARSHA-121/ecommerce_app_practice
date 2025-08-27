import 'package:flutter/material.dart';

class Searchbarwidget extends StatefulWidget {
  const Searchbarwidget({super.key});

  @override
  State<Searchbarwidget> createState() => _SearchbarwidgetState();
}

class _SearchbarwidgetState extends State<Searchbarwidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextFormField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            hintText: 'Search any Product..',
            hintStyle: TextStyle(color: Colors.grey),
            suffixIcon: Icon(Icons.mic_none_rounded, color: Colors.grey),
            border: OutlineInputBorder(borderSide: BorderSide.none),
          ),
        ),
      ),
    );
  }
}
