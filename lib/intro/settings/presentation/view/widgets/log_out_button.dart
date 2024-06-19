import 'package:attendo/core/helpers/common.dart';
import 'package:attendo/core/router/app_routes.dart';
import 'package:attendo/core/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.go(AppRoutes.signInScreen);
      },
      style: ButtonStyle(
        fixedSize: WidgetStateProperty.all(
          Size(265.w, 44.h),
        ),
        backgroundColor: WidgetStateProperty.all(AppTheme.mainBlue),
        foregroundColor: WidgetStateProperty.all(
          Colors.white,
        ),
        shadowColor: WidgetStateProperty.all(Colors.transparent),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              16,
            ),
          ),
        ),
      ),
      child: Text(
        getAppLocalizations(context)!.logOut,
        style: GoogleFonts.poppins(
          textStyle: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
