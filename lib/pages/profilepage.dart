import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/bottomnavbar/bottomnavbar.dart';
import 'package:my_app/utils/app_textstyles.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: AppTextstyles.h2),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.off(BottomNavBarExample());
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            SizedBox(height: 20),
            Column(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage(
                    'assets/images/appbarprofile.png',
                  ),
                ),
                SizedBox(height: 10),
                Text('Personal Details', style: AppTextstyles.h3),
                SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.lightBlueAccent,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text('Edit Profile ', style: AppTextstyles.bodyMedium),
                        Icon(Icons.edit),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text('Name', style: AppTextstyles.h3),
                SizedBox(height: 5),
                Text('Harsha Vardhan', style: AppTextstyles.bodyMedium),
                SizedBox(height: 10),
                Text('Email Address', style: AppTextstyles.h3),
                SizedBox(height: 5),
                Text(
                  'harsavardhan01@gmail.com',
                  style: AppTextstyles.bodyMedium,
                ),
                SizedBox(height: 10),
                Text('Date Of Birth', style: AppTextstyles.h3),
                SizedBox(height: 5),
                Text('18/10/2003', style: AppTextstyles.bodyMedium),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
