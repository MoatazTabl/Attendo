import 'package:attendo/core/app_images.dart';
import 'package:attendo/intro/admin/features/home/presentation/view/home_admin.dart';
import 'package:attendo/intro/settings/presentation/view/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class AdminMainScreen extends StatefulWidget {
  const AdminMainScreen({super.key});

  @override
  State<AdminMainScreen> createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends State<AdminMainScreen> {
  final List<Widget> screens = [
    const HomeAdmin(),
    const SettingsScreen(),
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
          body: screens[index],
          floatingActionButton: index == 0
              ? FloatingActionButton(
                  onPressed: () {
                    context.push("/createLectureAdmin");
                  },
                  backgroundColor: const Color(0xff3746CC),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      36,
                    ),
                  ),
                  child: const Icon(Icons.add),
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
                label: "Home",
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
