import 'package:attendo/core/app_images.dart';
import 'package:attendo/core/helpers/common.dart';
import 'package:attendo/core/router/app_routes.dart';
import 'package:attendo/intro/auth/models/user_data_model.dart';
import 'package:attendo/intro/settings/presentation/view/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

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
          floatingActionButton: index == 0
              ? FloatingActionButton(
                  onPressed: () {
                    context
                        .push(AppRoutes.createLectureInstructor,
                            extra: widget.userData)
                        .then((value) {
                      context
                          .read<HomeInstructorCubit>()
                          .getStudentLectures(data: {
                        "instructor": widget.userData.name,
                        // "date":"2024-04-30T09:18:54"
                        "date": DateTime.now().toIso8601String().split(".")[0]
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
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            iconSize: 30.w,
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
                label: getAppLocalizations(context)?.home,
              ),
              BottomNavigationBarItem(
                label: getAppLocalizations(context)?.settings,
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
