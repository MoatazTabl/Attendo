import 'package:attendo/core/app_images.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF12192E),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    context.push('/SignInScreenStudent');
                  },
                  child: Image.asset(AppImages.studentIntro)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    context.push("/SignInScreenInstructor");
                  },
                  child: Image.asset(AppImages.instructorIntro)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(onTap: () {
                context.push("/signInScreenAdmin");
              },child: Image.asset(AppImages.adminIntro)),
            ],
          ),
        ],
      ),
    );
  }
}
