import 'package:attendo/core/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class UserInfoItem extends StatelessWidget {
  const UserInfoItem({
    super.key,
    required this.fieldName,
    required this.fieldDetail,
    required this.iconPath,
  });

  final String fieldName;
  final String fieldDetail;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49.h,
      width: 363.w,
      margin: EdgeInsets.only(bottom: 41.h),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            15,
          ),
          side: const BorderSide(
            color: AppTheme.boxStrokeColor,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 30.h,
            width: 30.h,
            child: SvgPicture.asset(
              iconPath,
              colorFilter: const ColorFilter.mode(
                AppTheme.mainBlue,
                BlendMode.srcIn,
              ),
            ),
          ),
          SizedBox(
            width: 12.w,
          ),
          Text(
            fieldName,
            style: GoogleFonts.poppins(fontSize: 20.sp),
          ),
          const Spacer(),
          Text(
            fieldDetail,
            style: GoogleFonts.poppins(fontSize: 16.sp),
          ),
        ],
      ),
    );
  }
}
