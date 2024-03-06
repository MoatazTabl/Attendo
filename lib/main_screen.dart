import 'package:attendo/features/Home/Presentation/view/home_screen.dart';
import 'package:attendo/features/Profile/Presentation/view/profile_screen.dart';
import 'package:attendo/features/Settings/Presentation/view/settings_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final iconList = [
    const Icon(
      Icons.home_filled,
      color: Colors.white,
      size: 32,
    ),
    const Icon(
      Icons.person,
      color: Colors.white,
      size: 32,
    ),
    const Icon(
      Icons.settings,
      color: Colors.white,
      size: 32,
    )
  ];

  final List<Widget> screens = [
    const HomeScreen(),
    const ProfileScreen(),
    const SettingsScreen()
  ];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[index],
      bottomNavigationBar: CurvedNavigationBar(
        items: iconList,
        backgroundColor: Colors.transparent,
        color: const Color(0xff020665),
        animationCurve: Curves.decelerate,
        animationDuration: const Duration(milliseconds: 250),
        onTap: (value) {
          index = value;
          setState(() {});
        },
        index: index,
      ),
    );
  }
}
