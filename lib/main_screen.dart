import 'package:attendo/core/app_images.dart';
import 'package:attendo/features/Home/Presentation/view/home_screen.dart';
import 'package:attendo/features/Profile/Presentation/view/profile_screen.dart';
import 'package:attendo/features/Settings/Presentation/view/settings_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final iconList = [
    const Icon(
      Icons.home_filled,
      color: Color(0xff3746CC),
      size: 32,
    ),
    const Icon(
      Icons.person,
      color: Color(0xff3746CC),
      size: 32,
    ),
    const ImageIcon(
      AssetImage(
        "assets/images/settings_icon.png",
      ),
      size: 32,
      color: Color(0xff3746CC),
    ),
  ];

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
              image: AssetImage(AppImages.backgroundImage),
              fit: BoxFit.fill),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          extendBody: true,
          extendBodyBehindAppBar: true,
          body: screens[index],
          bottomNavigationBar: CurvedNavigationBar(
            items: iconList,
            backgroundColor: Colors.transparent,
            color: Colors.white,
            animationCurve: Curves.decelerate,
            animationDuration: const Duration(milliseconds: 250),
            onTap: (value) {
              index = value;
              setState(() {});
            },
            index: index,
          ),
        ),
      ),
    );
  }
}
