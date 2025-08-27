import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_shop_app/pages/profilepage.dart';

class Appbarwidget extends StatelessWidget {
  const Appbarwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: Image.asset('assets/images/appbarmenuicon.png'),
      centerTitle: true,
      title: Image.asset('assets/images/appbartitle.png'),
      actions: [
        GestureDetector(
          onTap: () => Get.to(Profilepage()),
          child: Image.asset('assets/images/appbarprofile.png'),
        ),
      ],
    );
  }
}
