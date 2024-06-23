import 'package:attendo/core/app_images.dart';
import 'package:attendo/core/helpers/common.dart';
import 'package:attendo/core/utils/app_theme.dart';
import 'package:attendo/intro/auth/models/user_data_model.dart';
import 'package:attendo/intro/instructor/features/create_lecture/presentation/view/create_lecture_instructor.dart';
import 'package:attendo/intro/instructor/features/home/logic/home_instructor_cubit.dart';
import 'package:attendo/intro/instructor/features/profile/presentation/view/profile_screen_instructor.dart';
import 'package:attendo/intro/settings/presentation/view/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

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
          backgroundColor: Colors.white,
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
            PersistentTabConfig(
              screen: const ProfileScreenInstructor(),
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
          onTabChanged: (value) {
            index = value;
            setState(() {});
          },
          floatingActionButton: CustomFloatingButton(
            userData: widget.userData,
          ),
          navBarBuilder: (NavBarConfig navBarConfig) => Style2BottomNavBar(
            navBarConfig: navBarConfig,
          ),
        ),
      ),
    );
  }
}

class CustomFloatingButton extends StatefulWidget {
  const CustomFloatingButton({super.key, required this.userData});

  final UserDataModel userData;

  @override
  State<CustomFloatingButton> createState() => _CustomFloatingButtonState();
}

class _CustomFloatingButtonState extends State<CustomFloatingButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const ShapeDecoration(
        shape: CircleBorder(),
        gradient: LinearGradient(
          colors: [
            Color(0xff6B73FF),
            Color(0xff000DFF),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              backgroundColor: Colors.white,
              isScrollControlled: true,
              showDragHandle: true,
              builder: (context) {
                return CreateLectureBottomSheet(
                  userDataModel: widget.userData,
                );
              }).then((value) {
            context.read<HomeInstructorCubit>().getInstructorLectures(data: {
              "instructor": widget.userData.name,
              // "date":"2024-04-30T09:18:54"
              "date": context
                  .read<HomeInstructorCubit>()
                  .dateTime
                  .toIso8601String()
                  .split(".")[0]
            });
            setState(() {});
          });
        },
        backgroundColor: Colors.transparent,
        enableFeedback: true,
        elevation: 0,
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
      ),
    );
  }
}
