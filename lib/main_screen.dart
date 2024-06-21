import 'package:attendo/core/helpers/common.dart';
import 'package:attendo/core/utils/app_theme.dart';
import 'package:attendo/intro/auth/models/user_data_model.dart';
import 'package:attendo/intro/student/features/home/Presentation/view/home_screen_student.dart';
import 'package:attendo/intro/student/features/profile/Presentation/view/profile_screen_student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import 'core/app_images.dart';
import 'intro/settings/presentation/view/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.userData});

  final UserDataModel userData;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final iconList = [];
  late List<Widget> screens;

  int index = 0;

  @override
  void initState() {
    super.initState();
    screens = [
      HomeScreenStudent(
        userData: widget.userData,
      ),
      const ProfileScreenStudent(),
      const SettingsScreen()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: screens[index]),
      bottomNavigationBar: StylishBottomBar(
        items: [
          BottomBarItem(
              icon: SvgPicture.asset(
                AppImages.homeIcon,
              ),
              title: Text(
                getAppLocalizations(context)!.home,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              backgroundColor: AppTheme.mainBlue),
          BottomBarItem(
              icon: SvgPicture.asset(
                AppImages.profileIcon,
              ),
              title: Text(
                getAppLocalizations(context)!.profile,
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 12),
              ),
              backgroundColor: AppTheme.mainBlue),
          BottomBarItem(
              title: Text(
                getAppLocalizations(context)!.settings,
                style: GoogleFonts.poppins(color: Colors.white, fontSize: 12),
              ),
              icon: SvgPicture.asset(
                AppImages.settingsIcon,
              ),
              backgroundColor: AppTheme.mainBlue)
        ],
        option: BubbleBarOptions(
          barStyle: BubbleBarStyle.horizontal,
        ),
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
    );
  }
}
//bottomNavigationBar: Theme(
//   data: AppTheme.lightMode.copyWith(
//     splashColor: Colors.transparent,
//     highlightColor: Colors.transparent,
//   ),
//   child: BottomNavigationBar(
//     currentIndex: index,
//     iconSize: 32.w,
//     elevation: 2,
//     backgroundColor: Colors.white,
//     items: [
//       BottomNavigationBarItem(
//         icon: SvgPicture.asset(
//           AppImages.homeIcon,
//         ),
//         activeIcon: SvgPicture.asset(
//           AppImages.selectedHomeIcon,
//         ),
//         label: getAppLocalizations(context)!.home,
//       ),
//       BottomNavigationBarItem(
//         icon: SvgPicture.asset(
//           AppImages.profileIcon,
//         ),
//         activeIcon: SvgPicture.asset(
//           AppImages.selectedProfileIcon,
//         ),
//         label: getAppLocalizations(context)!.profile,
//       ),
//       BottomNavigationBarItem(
//         label: getAppLocalizations(context)!.settings,
//         icon: SvgPicture.asset(
//           AppImages.settingsIcon,
//         ),
//         activeIcon: SvgPicture.asset(
//           AppImages.selectedSettingsIcon,
//           fit: BoxFit.fill,
//         ),
//       ),
//     ],
//     onTap: (value) {
//       index = value;
//       setState(() {});
//     },
//   ),
