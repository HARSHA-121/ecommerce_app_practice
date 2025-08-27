import 'package:flutter/material.dart';
import 'package:my_app/my_widgets/searchbarwidget.dart';

class Searchpage extends StatelessWidget {
  const Searchpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(children: [SizedBox(height: 20), Searchbarwidget()]),
      ),
    );
  }
}
