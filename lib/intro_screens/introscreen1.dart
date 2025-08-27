import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_shop_app/intro_screens/getstartedscreen.dart';
import 'package:stylish_shop_app/intro_screens/introscreen2.dart';

class Introscreen1 extends StatefulWidget {
  const Introscreen1({super.key});

  @override
  State<Introscreen1> createState() => _Introscreen1State();
}

class _Introscreen1State extends State<Introscreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '1',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        TextSpan(
                          text: '/3',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.off(Getstartedscreen()),
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset('assets/images/introscreen1img.png'),
                  SizedBox(height: 20),
                  Text(
                    'Choose Products',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 8,
                          width: 35,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Introscreen2()),
                      );
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(
                        color: Color(0xffF83758),
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
