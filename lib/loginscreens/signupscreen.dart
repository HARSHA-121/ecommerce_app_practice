import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:stylish_shop_app/loginscreens/loginscreen.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  final formkey = GlobalKey<FormState>();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController pwdcontroller = TextEditingController();
  TextEditingController repwdcontroller = TextEditingController();
  bool ispassvisible = false;
  bool isrepassvisible = false;

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
                'Create an',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              Text(
                'account',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              TextFormField(
                controller: emailcontroller,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: 'Email',
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(Icons.person),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This Field Required';
                  }
                  if (!RegExp(
                    r'^[\w\.-]+@gmail\.com$',
                    caseSensitive: false,
                  ).hasMatch(value)) {
                    return 'Please Enter Valid Email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              TextFormField(
                controller: pwdcontroller,
                obscureText: !ispassvisible,
                textInputAction: TextInputAction.next,
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
                      ispassvisible ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This Field Required';
                  }
                  if (value.length < 6) {
                    return 'Password Should atleast 6 Characters';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),

              TextFormField(
                controller: repwdcontroller,
                obscureText: !isrepassvisible,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  filled: true,
                  fillColor: Colors.grey[200],
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        isrepassvisible = !isrepassvisible;
                      });
                    },
                    icon: Icon(
                      isrepassvisible ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'This Field Required';
                  }
                  if (value != pwdcontroller.text) {
                    return 'Passwords do not match';
                  }
                  if (value.length < 6) {
                    return 'Password Should atleast 6 Characters';
                  }
                  return null;
                },
              ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(text: 'By clicking the '),
                        TextSpan(
                          text: 'Register ',
                          style: TextStyle(color: Color(0xfff83758)),
                        ),
                        TextSpan(
                          text: 'Button,you agree \nto the public offer',
                        ),
                      ],
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
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text('Signing Up')));
                    }
                  },
                  child: Text(
                    'Register',
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
                          text: 'I Already Have an Account ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: ' Login',
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Loginscreen(),
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
