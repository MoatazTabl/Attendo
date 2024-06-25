import 'package:attendo/intro/instructor/features/attendance_page/presentation/view_model/models/instructor_details_report_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/helpers/common.dart';

class StudentsAttendingWidget extends StatelessWidget {
  const StudentsAttendingWidget({
    super.key,
    required this.instructorDetailsReportModel,
  });

  final InstructorDetailsReportModel instructorDetailsReportModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 9.h,
        ),
        Text(
          getAppLocalizations(context)!.studentsAttended,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 20.sp,
              ),
        ),
        // StreamBuilder(
        //   stream: GetReportCubit().getStudentNumbersStream(
        //      lecturePk:  instructorDetailsReportModel.instructorLecturesModel.pk!,
        //       ),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return const Center(child: CircularProgressIndicator());
        //     } else if (snapshot.hasData) {
        //
        //       return Text(
        //         '${snapshot.data?.attendingStudents}',
        //         style: TextStyle(
        //           color: Colors.black,
        //           fontSize: 30.sp,
        //         ),
        //       );
        //     } else if (snapshot.hasError) {
        //       return const Text("Error");
        //     } else {
        //       return Text(
        //         "0",
        //         style: TextStyle(
        //           color: Colors.black,
        //           fontSize: 30.sp,
        //         ),
        //       );
        //     }
        //   },
        // ),
        // BlocBuilder<GetReportCubit, GetReportState>(
        //   builder: (context, state) {
        //     if (state is GetReportSuccess) {
        //       return Text(
        //         '${state.getReportModel.studentsList!.length}',
        //         style: TextStyle(
        //           color: Colors.black,
        //           fontSize: 30.sp,
        //         ),
        //       );
        //     } else if (state is GetReportLoading) {
        //       return const Center(child: CircularProgressIndicator());
        //     } else {
        //       return Text(
        //         "0",
        //         style: TextStyle(
        //           color: Colors.black,
        //           fontSize: 30.sp,
        //         ),
        //       );
        //     }
        //   },
        // ),
      ],
    );
  }
}
