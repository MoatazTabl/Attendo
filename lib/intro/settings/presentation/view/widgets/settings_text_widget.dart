import 'package:attendo/core/helpers/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsTextWidget extends StatelessWidget {
  const SettingsTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      getAppLocalizations(context)!.settings,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          fontSize: 25.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
