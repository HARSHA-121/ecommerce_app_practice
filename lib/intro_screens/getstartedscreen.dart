import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_shop_app/loginscreens/loginscreen.dart';

class Getstartedscreen extends StatelessWidget {
  const Getstartedscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(Colors.black, BlendMode.screen),
                image: AssetImage('assets/images/getstartbackground.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.4),
            child: Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'You want',
                    style: TextStyle(
                      height: 1,
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  Text(
                    'Authentic here',
                    style: TextStyle(
                      height: 1,
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'you go',
                    style: TextStyle(
                      height: 1,
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 40),
                  Text(
                    '  Find it here, buy it now',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 1,
                      wordSpacing: 2,
                    ),
                  ),
                  SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xfff83758),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      onPressed: () {
                        Get.off(Loginscreen());
                      },
                      child: Text(
                        'Get Started',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
