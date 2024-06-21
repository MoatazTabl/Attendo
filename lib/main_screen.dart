import 'package:attendo/core/helpers/common.dart';
import 'package:attendo/core/utils/app_theme.dart';
import 'package:attendo/intro/auth/models/user_data_model.dart';
import 'package:attendo/intro/student/features/home/Presentation/view/home_screen_student.dart';
import 'package:attendo/intro/student/features/profile/Presentation/view/profile_screen_student.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

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
    return ScaffoldMessenger(
      child: Scaffold(
        bottomNavigationBar: PersistentTabView(
          tabs: [
            PersistentTabConfig(
              screen: HomeScreenStudent(
                userData: widget.userData,
              ),
              item: ItemConfig(
                activeColorSecondary: AppTheme.mainBlue,
                activeForegroundColor: Colors.white,
                inactiveIcon: SvgPicture.asset(
                  AppImages.homeIcon,
                  // colorFilter: const ColorFilter.mode(AppTheme.boxStrokeColor, BlendMode.srcIn),
                ),
                icon: SvgPicture.asset(
                  AppImages.homeIcon,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
                title: getAppLocalizations(context)!.home,
              ),
            ),
            PersistentTabConfig(
              screen: const ProfileScreenStudent(),
              item: ItemConfig(
                  activeColorSecondary: AppTheme.mainBlue,
                  activeForegroundColor: Colors.white,
                  inactiveIcon: SvgPicture.asset(
                    AppImages.profileIcon,
                  ),
                  icon: SvgPicture.asset(
                    AppImages.profileIcon,
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                  title: getAppLocalizations(context)!.profile),
            ),
            PersistentTabConfig(
              screen: const SettingsScreen(),
              item: ItemConfig(
                activeColorSecondary: AppTheme.mainBlue,
                activeForegroundColor: Colors.white,
                inactiveIcon: SvgPicture.asset(
                  AppImages.settingsIcon,
                ),
                icon: SvgPicture.asset(
                  AppImages.settingsIcon,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
                title: getAppLocalizations(context)!.settings,
              ),
            ),
          ],
          navBarBuilder: (NavBarConfig navBarConfig) => Style2BottomNavBar(
            navBarConfig: navBarConfig,
          ),
        ),
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
