import 'package:attendo/intro/instructor/features/attendance_page/presentation/view_model/models/instructor_details_report_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../core/app_images.dart';
import '../../../../../../../core/helpers/common.dart';

class ShowStudentsListPopUpWidget extends StatelessWidget {
  final InstructorDetailsReportModel instructorDetailsReportModel;

  const ShowStudentsListPopUpWidget(
      {super.key, required this.instructorDetailsReportModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push("/attendancePageInstructor",
            extra: instructorDetailsReportModel);
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
