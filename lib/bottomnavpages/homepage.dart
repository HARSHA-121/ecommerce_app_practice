import 'package:flutter/material.dart';
import 'package:stylish_shop_app/models/category_model.dart';
import 'package:stylish_shop_app/models/productmodel.dart';
import 'package:stylish_shop_app/my_widgets/appbarwidget.dart';
import 'package:stylish_shop_app/my_widgets/searchbarwidget.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          child: Column(
            spacing: 10,
            children: [
              Appbarwidget(),
              Searchbarwidget(),
              Row(
                children: [
                  Text(
                    'All Featured',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ],
              ),
              SizedBox(height: 110, child: CategoryModel()),
              Row(
                children: [
                  Text(
                    'New Arrival',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                ],
              ),
              SizedBox(height: 500, child: Productmodel()),
            ],
          ),
        ),
      ),
    );
  }
}
