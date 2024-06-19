import 'package:attendo/core/app_images.dart';
import 'package:attendo/core/helpers/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DarkModeWidget extends StatefulWidget {
  const DarkModeWidget({super.key});

  @override
  State<DarkModeWidget> createState() => _DarkModeWidgetState();
}

class _DarkModeWidgetState extends State<DarkModeWidget> {
  bool themeMode = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 47.h,
      child: Row(
        children: [
          SvgPicture.asset(AppImages.lightBulbIcon),
          const SizedBox(
            width: 2,
          ),
          Text(
            getAppLocalizations(context)!.darkMode,
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
              ),
            ),
          ),
          const Spacer(),
          Switch(
            value: themeMode,
            onChanged: (value) {
              themeMode = !themeMode;
              setState(() {});
            },
            activeColor: const Color(0xff444444),
            // trackColor: const Color(0xffEAECF0),
          ),
        ],
      ),
    );
  }
}
