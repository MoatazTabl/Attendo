import 'package:attendo/core/app_images.dart';
import 'package:attendo/core/helpers/common.dart';
import 'package:attendo/core/router/app_routes.dart';
import 'package:attendo/core/utils/app_theme.dart';
import 'package:attendo/intro/auth/models/user_data_model.dart';
import 'package:attendo/intro/settings/presentation/view/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import 'features/home/logic/home_instructor_cubit.dart';
import 'features/home/presentation/view/home_instructor.dart';

class InstructorMainScreen extends StatefulWidget {
  const InstructorMainScreen({super.key, required this.userData});

  final UserDataModel userData;

  @override
  State<InstructorMainScreen> createState() => _InstructorMainScreenState();
}

class _InstructorMainScreenState extends State<InstructorMainScreen> {
  final iconList = [];
  late List<Widget> screens;
  int index = 0;

  @override
  void initState() {
    super.initState();
    screens = [
      HomeInstructor(
        userData: widget.userData,
      ),
      const SettingsScreen()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      child: Scaffold(
        // body: screens[index],

        bottomNavigationBar: PersistentTabView(
          tabs: [
            PersistentTabConfig(
              screen: HomeInstructor(
                userData: widget.userData,
              ),
              item: ItemConfig(
                activeColorSecondary: AppTheme.mainBlue,
                activeForegroundColor: Colors.white,
                inactiveIcon: SvgPicture.asset(
                  AppImages.homeIcon,
                ),
                icon: SvgPicture.asset(
                  AppImages.homeIcon,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
                title: getAppLocalizations(context)!.home,
              ),
            ),
            // PersistentTabConfig(
            //   screen: const ProfileScreenStudent(),
            //   item: ItemConfig(
            //       activeColorSecondary: AppTheme.mainBlue,
            //       activeForegroundColor: Colors.white,
            //       inactiveIcon: SvgPicture.asset(
            //         AppImages.profileIcon,
            //       ),
            //       icon: SvgPicture.asset(
            //         AppImages.profileIcon,
            //         colorFilter:
            //             const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            //       ),
            //       title: getAppLocalizations(context)!.profile),
            // ),
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
          onTabChanged: (value) {
            index = value;
            setState(() {});
          },
          floatingActionButton: index == 0
              ? FloatingActionButton(
                  onPressed: () {
                    context
                        .push(AppRoutes.createLectureInstructor,
                            extra: widget.userData)
                        .then((value) {
                      context
                          .read<HomeInstructorCubit>()
                          .getInstructorLectures(data: {
                        "instructor": widget.userData.name,
                        // "date":"2024-04-30T09:18:54"
                        "date": context
                            .read<HomeInstructorCubit>()
                            .dateTime
                            .toIso8601String()
                            .split(".")[0]
                      });
                    });
                  },
                  backgroundColor: const Color(0xff3746CC),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      36,
                    ),
                  ),
                  child: const Icon(
                    Icons.add,
                    size: 32,
                  ),
                )
              : null,
          navBarBuilder: (NavBarConfig navBarConfig) => Style2BottomNavBar(
            navBarConfig: navBarConfig,
          ),
        ),
      ),
    );
  }
}
