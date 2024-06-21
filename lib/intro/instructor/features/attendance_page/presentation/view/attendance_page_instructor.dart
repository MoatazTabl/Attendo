import 'package:attendo/core/helpers/common.dart';
import 'package:attendo/core/widgets/custom_snack_bar.dart';
import 'package:attendo/intro/instructor/features/attendance_page/presentation/view/widgets/attendent_student_item.dart';
import 'package:attendo/intro/instructor/features/attendance_page/presentation/view/widgets/excell_functions.dart';
import 'package:attendo/intro/instructor/features/attendance_page/presentation/view_model/models/GetReportModel.dart';
import 'package:attendo/intro/instructor/features/attendance_page/presentation/view_model/models/instructor_details_report_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../../../core/app_images.dart';
import '../view_model/cubits/get_report_cubit.dart';

class AttendancePageInstructor extends StatefulWidget {
  final InstructorDetailsReportModel instructorDetailsReportModel;

  const AttendancePageInstructor(
      {super.key, required this.instructorDetailsReportModel});

  @override
  State<AttendancePageInstructor> createState() =>
      _AttendancePageInstructorState();
}

class _AttendancePageInstructorState extends State<AttendancePageInstructor> {
  late String formattedDate;
  late String formattedTime;
  late DateTime dateTime;
  late DateTime dateTimeDay;

  @override
  void initState() {
    super.initState();
    context.read<GetReportCubit>().getReport(
        widget.instructorDetailsReportModel.instructorLecturesModel.pk!,
        widget.instructorDetailsReportModel.date);

    dateTime = DateTime.parse(widget.instructorDetailsReportModel
        .instructorLecturesModel.lectureStartTime!);

    formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    //-----------------------------------------------------
    dateTimeDay = DateTime.parse(widget.instructorDetailsReportModel
        .instructorLecturesModel.lectureStartTime!);

    formattedTime = DateFormat('hh:mm:ss a').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    late List<StudentsList> students;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          widget.instructorDetailsReportModel
                              .instructorLecturesModel.name!,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                fontSize: 28.sp,
                              ),
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        Text(
                          formattedDate,
                          style: Theme.of(context).textTheme.titleSmall!,
                        ),
                        Text(
                          formattedTime,
                          style: Theme.of(context).textTheme.titleSmall!,
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Container(
                  height: 584.h,
                  width: 340.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      25,
                    ),
                    color: const Color(
                      0xFFF1F1F1,
                    ),
                  ),
                  child: BlocBuilder<GetReportCubit, GetReportState>(
                    builder: (context, state) {
                      if (state is GetReportSuccess) {
                        students = state.getReportModel.studentsList!;
                        return ListView.builder(
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: AttendentSrudentItem(
                                  authorizationTime: state
                                      .getReportModel.authorizationTime![index],
                                  studentName: state
                                      .getReportModel.studentsList![index].name!,
                                  nationalId: state.getReportModel
                                      .studentsList![index].nationalId!),
                            );
                          },
                          itemCount: state.getReportModel.studentsList!.length,
                        );
                      } else if (state is GetReportFailure) {
                        return Center(child: Text(state.errMessage));
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await createExcelFile(students);
                    ScaffoldMessenger.of(context).showSnackBar(
                      GlobalSnackBar.show(
                          context, 'Excel file created successfully! , saved to downloads'),
                    );
                    print(students[1].name);
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
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          22.w,
                        ),
                      ),
                    ),
                  ),
                  child: Text(
                    getAppLocalizations(context)!.downloadFullList,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
