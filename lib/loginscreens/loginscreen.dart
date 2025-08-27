import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_shop_app/bottomnavbar/bottomnavbar.dart';
import 'package:stylish_shop_app/loginscreens/forgotpassword.dart';
import 'package:stylish_shop_app/loginscreens/signupscreen.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController pwdcontroller = TextEditingController();
  bool ispassvisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Text(
                'WELCOME',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              Text(
                'BACK!',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              TextFormField(
                controller: emailcontroller,
                decoration: InputDecoration(
                  hintText: 'Username or Email',
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field Required';
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: pwdcontroller,
                obscureText: !ispassvisible,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  hintText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        ispassvisible = !ispassvisible;
                      });
                    },
                    icon: Icon(
                      ispassvisible ? Icons.visibility : Icons.visibility_off,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This field Required';
                  }
                  if (value.length < 6) {
                    return 'Pssword should contain 6 characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Forgotpassword(),
                        ),
                      );
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: Color(0xfff83758)),
                    ),
                  ),
                ],
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
                    if (formkey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Logging in'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                      Get.offAll(BottomNavBarExample());
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '-OR Continue With-',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xfff83758),

                    radius: 30,
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: Color(0xffFCF3F6),
                      child: Image.asset('assets/images/Frame 4.png'),
                    ),
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
                    backgroundColor: Color(0xfff83758),
                    radius: 30,
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: Color(0xffFCF3F6),
                      child: Image.asset('assets/images/apple 1.png'),
                    ),
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
                    backgroundColor: Color(0xfff83758),
                    radius: 30,
                    child: CircleAvatar(
                      radius: 28,
                      backgroundColor: Color(0xffFCF3F6),
                      child: Image.asset('assets/images/Group.png'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 18),
                      children: [
                        TextSpan(
                          text: 'Create An Account ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: ' Sign Up',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Signupscreen(),
                                ),
                              );
                            },
                          style: TextStyle(
                            color: Color(0xfff83758),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
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
