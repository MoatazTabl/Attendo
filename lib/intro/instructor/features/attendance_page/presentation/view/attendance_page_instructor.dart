import 'package:attendo/core/helpers/common.dart';
import 'package:attendo/core/utils/app_theme.dart';
import 'package:attendo/core/widgets/custom_snack_bar.dart';
import 'package:attendo/intro/instructor/features/attendance_page/presentation/view/widgets/attendent_student_item.dart';
import 'package:attendo/intro/instructor/features/attendance_page/presentation/view/widgets/excell_functions.dart';
import 'package:attendo/intro/instructor/features/attendance_page/presentation/view/widgets/manual_add_students.dart';
import 'package:attendo/intro/instructor/features/attendance_page/presentation/view_model/models/get_report_model.dart';
import 'package:attendo/intro/instructor/features/attendance_page/presentation/view_model/models/instructor_details_report_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

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

    formattedTime = DateFormat('hh:mm: a').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    late List<StudentsList> students;

    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
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
                                  fontSize: 30.sp,
                                ),
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
                  Container(
                    height: 405.h,
                    width: 328.w,
                    margin: EdgeInsets.only(top: 10.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        23,
                      ),
                      color: const Color(
                        0xFFF1F1F1,
                      ),
                    ),
                    child: Column(
                      children: [
                        BlocBuilder<GetReportCubit, GetReportState>(
                          builder: (context, state) {
                            if (state is GetReportSuccess) {
                              students = state.getReportModel.studentsList!;
                              return Expanded(
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 8.0),
                                      child: AttendanceStudentItem(
                                        authorizationTime: state.getReportModel
                                            .authorizationTime![index],
                                        studentName: state.getReportModel
                                            .studentsList![index].name!,
                                        nationalId: state.getReportModel
                                            .studentsList![index].nationalId!,
                                        photo: state.getReportModel
                                            .studentsList![index].photo!,
                                      ),
                                    );
                                  },
                                  itemCount:
                                      state.getReportModel.studentsList!.length,
                                ),
                              );
                            } else if (state is GetReportFailure) {
                              return Center(child: Text(state.errMessage));
                            } else {
                              return const SizedBox(
                                height: 200,
                                child:
                                    Center(child: CircularProgressIndicator()),
                              );
                            }
                          },
                        ),
                        ManualAppendStudent(
                          lecturePk: widget.instructorDetailsReportModel
                              .instructorLecturesModel.pk!,
                          instructorDetailsReportModel:
                              widget.instructorDetailsReportModel,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 155.h,
                    width: 328.w,
                    margin: EdgeInsets.only(top: 25.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        23,
                      ),
                      color: const Color(
                        0xFFF1F1F1,
                      ),
                    ),
                    child: BlocBuilder<GetReportCubit, GetReportState>(
                      builder: (context, state) {
                        if (state is GetReportSuccess) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    getAppLocalizations(context)!
                                        .attendedStudents,
                                    style: GoogleFonts.poppins(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(state.getReportModel.attendingStudents
                                      .toString()),
                                ],
                              ),
                              AnalyticsWidget(
                                value: state.getReportModel.attendancePercentage
                                    as double,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    getAppLocalizations(context)!
                                        .absentStudents,
                                    style: GoogleFonts.poppins(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(state.getReportModel.absentStudents
                                      .toString()),
                                ],
                              ),
                            ],
                          );
                        } else if (state is GetReportFailure) {
                          return Text(state.errMessage);
                        } else {
                          return const Text("Error");
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await createExcelFile(students,  widget.instructorDetailsReportModel
                          .instructorLecturesModel.name!,formattedDate);
                        ScaffoldMessenger.of(context).showSnackBar(
                          GlobalSnackBar.show(context,
                              'Excel file created successfully! , saved to downloads'),
                        );

                    },
                    style: ButtonStyle(
                      fixedSize: WidgetStateProperty.all(
                        Size(246.w, 53.h),
                      ),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            16.w,
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
            ),
          )
        ],
      ),
    );
  }
}

class AnalyticsWidget extends StatelessWidget {
  const AnalyticsWidget({
    super.key,
    required this.value,
  });

  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: SfRadialGauge(
        enableLoadingAnimation: true,
        title: GaugeTitle(
          text: getAppLocalizations(context)!.attendancePercentage,
          textStyle:
              GoogleFonts.poppins(fontSize: 17.sp, fontWeight: FontWeight.w500),
        ),
        axes: [
          RadialAxis(
            labelOffset: 0,
            pointers: [
              RangePointer(
                value: value,
                cornerStyle: CornerStyle.bothCurve,
                color: AppTheme.mainBlue,
                width: 10,
              ),
            ],
            annotations: [
              GaugeAnnotation(widget: Text(value.toInt().toString()))
            ],
            axisLineStyle: const AxisLineStyle(thickness: 10),
            showLabels: false,
            showTicks: false,
            startAngle: 90,
            endAngle: 90,
          )
        ],
      ),
    );
  }
}
