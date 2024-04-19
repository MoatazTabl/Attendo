import 'package:attendo/core/app_images.dart';
import 'package:attendo/intro/student/features/Profile/Presentation/view/profile_screen.dart';
import 'package:attendo/intro/student/features/settings/presentation/view/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'intro/student/features/Home/Presentation/view/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final iconList = [];

  final List<Widget> screens = [
    const HomeScreen(),
    const ProfileScreen(),
    const SettingsScreen()
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 1.sw,
        height: 1.sh,
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage(AppImages.backgroundImageStudent),
              fit: BoxFit.fill),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: IndexedStack(index: index,children: screens,),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            iconSize: 32.w,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            selectedItemColor: const Color(0xff001076),
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/svg/home_icon.svg",
                ),
                activeIcon: SvgPicture.asset(
                  "assets/images/svg/selected_home.svg",
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/images/svg/profile_icon.svg",
                ),
                activeIcon: SvgPicture.asset(
                  "assets/images/svg/selected_profile.svg",
                ),
                label: "Profile",
              ),
              BottomNavigationBarItem(
                label: "Settings",

                icon: SvgPicture.asset(
                  "assets/images/svg/settings_icon.svg",
                ),
                activeIcon: SvgPicture.asset(
                  "assets/images/svg/selected_settings.svg",

                  fit: BoxFit.fill,
                ),
              ),
            ],
            backgroundColor: Colors.transparent,
            onTap: (value) {
              index = value;
              setState(() {});
            },
          ),
        ),
      ),
    );
  }
}
