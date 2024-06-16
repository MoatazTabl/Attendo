import 'package:attendo/core/app_images.dart';
import 'package:attendo/core/helpers/common.dart';
import 'package:attendo/core/utils/app_theme.dart';
import 'package:attendo/intro/auth/models/user_data_model.dart';
import 'package:attendo/intro/student/features/home/Presentation/view/home_screen_student.dart';
import 'package:attendo/intro/student/features/profile/Presentation/view/profile_screen_student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return SafeArea(
      child: Container(
        width: 1.sw,
        height: 1.sh,
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage(AppImages.backgroundImage), fit: BoxFit.fill),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: screens[index],
          bottomNavigationBar: Theme(
            data: AppTheme.lightMode.copyWith(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              currentIndex: index,
              iconSize: 32.w,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/images/svg/home_icon.svg",
                  ),
                  activeIcon: SvgPicture.asset(
                    "assets/images/svg/selected_home.svg",
                  ),
                  label: getAppLocalizations(context)!.home,
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/images/svg/profile_icon.svg",
                  ),
                  activeIcon: SvgPicture.asset(
                    "assets/images/svg/selected_profile.svg",
                  ),
                  label: getAppLocalizations(context)!.profile,
                ),
                BottomNavigationBarItem(
                  label: getAppLocalizations(context)!.settings,
                  icon: SvgPicture.asset(
                    "assets/images/svg/settings_icon.svg",
                  ),
                  activeIcon: SvgPicture.asset(
                    "assets/images/svg/selected_settings.svg",
                    fit: BoxFit.fill,
                  ),
                ),
              ],
              onTap: (value) {
                index = value;
                setState(() {});
              },
            ),
          ),
        ),
      ),
    );
  }
}
