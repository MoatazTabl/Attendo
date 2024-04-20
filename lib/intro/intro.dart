import 'package:attendo/core/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void didChangeDependencies() async {
    await precacheImage(
        const AssetImage("assets/images/background.png"), context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0B0E3B),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              context.push('/SignInScreenStudent');
            },
            child: SvgPicture.asset(
              AppImages.studentIntro,
              height: 206.h,
            ),
          ),
          InkWell(
            onTap: () {
              context.push("/SignInScreenInstructor");
            },
            child: SvgPicture.asset(
              AppImages.instructorIntro,
              height: 240.h,
            ),
          ),
          InkWell(
            onTap: () {
              context.push("/signInScreenAdmin");
            },
            child: SvgPicture.asset(
              AppImages.adminIntro,
              height: 220.h,
              width: 234.w,

            ),
          ),
        ],
      ),
    );
  }
}
