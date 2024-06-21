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
    return ElevatedButton(onPressed: () {
        context.push("/attendancePageInstructor",
            extra: instructorDetailsReportModel);
      },
      style: ButtonStyle(
        fixedSize: WidgetStateProperty.all(
          Size(246.w, 55.h),
        ),
        backgroundColor: WidgetStateProperty.all(
          const Color(
            0xFF0066FF,
          ),
        ),
        foregroundColor: WidgetStateProperty.all(Colors.white),
      ),child: Text(
      getAppLocalizations(context)!.clickToShowStudents,
      style: Theme.of(context)
          .textTheme
          .labelMedium
          ?.copyWith(fontSize: 18.sp),
    ),);
  }
}




