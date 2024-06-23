import 'package:attendo/core/router/app_routes.dart';
import 'package:attendo/intro/instructor/features/attendance_page/presentation/view_model/models/instructor_details_report_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../core/helpers/common.dart';

class ShowStudentsListPopUpWidget extends StatelessWidget {
  final InstructorDetailsReportModel instructorDetailsReportModel;

  const ShowStudentsListPopUpWidget(
      {super.key, required this.instructorDetailsReportModel});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.push(AppRoutes.attendancePageInstructor,
            extra: instructorDetailsReportModel);
      },
      style: ButtonStyle(
        fixedSize: WidgetStateProperty.all(
          Size(170.w, 32.h),
        ),
        padding: WidgetStateProperty.all(EdgeInsets.zero),
      ),
      child: Text(
        getAppLocalizations(context)!.clickToShowStudents,
        style:
            Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 15.sp),
      ),
    );
  }
}
