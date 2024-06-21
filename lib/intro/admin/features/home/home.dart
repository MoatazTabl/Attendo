import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                children: [
                  const Text(
                    "Select Department",
                    style: TextStyle(fontSize: 26, color: Colors.black),
                  ),
                  SizedBox(
                    height: 68.h,
                  ),
                  GestureDetector(
                      onTap: () {
                        context.push("/csGrades");
                      }, child: Image.asset("assets/images/cs.png")),
                  const Text(
                    "Computer Science",
                    style: TextStyle(fontSize: 26, color: Colors.black),
                  ),
                  SizedBox(
                    height: 111.h,
                  ),
                  GestureDetector(
                      onTap: () {
                        context.push("/commerceGrades");
                      },
                      child: Image.asset("assets/images/commerce.png")),
                  const Text(
                    "Commerce",
                    style: TextStyle(fontSize: 26, color: Colors.black),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
