import 'package:attendo/core/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  void initState() {
    super.initState();
  }
  @override
  void didChangeDependencies() {
    precacheImage(const AssetImage("assets/images/background.png"), context);
    super.didChangeDependencies();
  }
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
                  child: SvgPicture.asset(AppImages.studentIntro)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    context.push("/SignInScreenInstructor");
                  },
                  child: SvgPicture.asset(AppImages.instructorIntro)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(onTap: () {
                context.push("/signInScreenAdmin");
              },child: SvgPicture.asset(AppImages.adminIntro)),
            ],
          ),
        ],
      ),
    );
  }
}
