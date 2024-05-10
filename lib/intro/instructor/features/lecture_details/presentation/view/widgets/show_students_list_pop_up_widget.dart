import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../core/app_images.dart';
import '../../../../../../../core/helpers/common.dart';

class ShowStudentsListPopUpWidget extends StatelessWidget {
  final int lecturePk;

  const ShowStudentsListPopUpWidget({super.key, required this.lecturePk});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push("/attendancePageInstructor",extra: lecturePk);
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            AppImages.studentAttendingPopUp,
            width: 232.w,
          ),
          Text(
            getAppLocalizations(context)!.clickToShowStudents,
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(fontSize: 18.sp),
          ),
        ],
      ),
    );
  }
}
