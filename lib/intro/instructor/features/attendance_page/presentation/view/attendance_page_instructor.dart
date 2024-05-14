import 'package:attendo/core/helpers/common.dart';
import 'package:attendo/intro/instructor/features/attendance_page/presentation/view/widgets/attendent_student_item.dart';
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
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              AppImages.backgroundImage,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300.w,
                      height: 90.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.blue,
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(
                            25,
                          ),
                          bottomRight: Radius.circular(
                            25,
                          ),
                        ),
                      ),
                      child: Column(
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                formattedDate,
                                style: Theme.of(context).textTheme.titleSmall!,
                              ),
                              Text(
                                formattedTime,
                                style: Theme.of(context).textTheme.titleSmall!,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  getAppLocalizations(context)!.attendanceList,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 30.sp,
                      ),
                ),
                SizedBox(
                  height: 19.h,
                ),
                Container(
                  height: 500.h,
                  width: 340.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      25,
                    ),
                    border: Border.all(
                      color: Colors.black,
                    ),
                    color: const Color(
                      0xFFF0F3FF,
                    ),
                  ),
                  child: BlocBuilder<GetReportCubit, GetReportState>(
                    builder: (context, state) {
                      if (state is GetReportSuccess) {
                        return ListView.separated(
                          separatorBuilder: (context, index) {
                            return const Divider(
                              indent: 25,
                              endIndent: 25,
                              color: Color(0xFF707070),
                            );
                          },
                          itemBuilder: (context, index) {
                            return AttendentSrudentItem(
                                authorizationTime: state
                                    .getReportModel.authorizationTime![index],
                                studentName: state
                                    .getReportModel.studentsList![index].name!,
                                nationalId: state.getReportModel
                                    .studentsList![index].nationalId!);
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
                  onPressed: () {},
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                      Size(340.w, 56.h),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      const Color(
                        0xff3746CC,
                      ),
                    ),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(
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
                        fontSize: 25.sp,
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
