import 'dart:async';

import 'package:attendo/core/widgets/custom_snack_bar.dart';
import 'package:attendo/intro/instructor/features/attendance_page/presentation/view_model/cubits/get_report_cubit.dart';
import 'package:attendo/intro/instructor/features/attendance_page/presentation/view_model/models/instructor_details_report_model.dart';
import 'package:attendo/intro/instructor/features/lecture_details/presentation/view/widgets/show_students_list_pop_up_widget.dart';
import 'package:attendo/intro/instructor/features/lecture_details/presentation/view/widgets/students_attending_widget.dart';
import 'package:attendo/intro/instructor/features/lecture_details/presentation/view_model/cubits/generate_qr/generate_qr_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../view_model/cubits/start_report/start_report_cubit.dart';

class InstructorLectureDetails extends StatefulWidget {
  final InstructorDetailsReportModel instructorDetailsReportModel;

  @override
  State<InstructorLectureDetails> createState() =>
      _InstructorLectureDetailsState();

  const InstructorLectureDetails(
      {super.key, required this.instructorDetailsReportModel});
}

class _InstructorLectureDetailsState extends State<InstructorLectureDetails> {
  late Timer timer;
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
    context.read<GenerateQrCubit>().generateQrCode(
        lecturePk:
        widget.instructorDetailsReportModel.instructorLecturesModel.pk!);

    timer = Timer.periodic(const Duration(seconds: 6), (Timer timer) {
      context.read<GenerateQrCubit>().generateQrCode(
          lecturePk:
          widget.instructorDetailsReportModel.instructorLecturesModel.pk!);
    });

    // ---------------------
    dateTime = DateTime.parse(widget.instructorDetailsReportModel
        .instructorLecturesModel.lectureStartTime!);

    formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    //-----------------------------------------------------
    dateTimeDay = DateTime.parse(widget.instructorDetailsReportModel
        .instructorLecturesModel.lectureStartTime!);

    formattedTime = DateFormat('hh:mm:ss a').format(dateTime);
  }


  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool lectureStarted = false;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 16.sp, right: 16.sp, top: 105.sp, bottom: 50.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.instructorDetailsReportModel
                          .instructorLecturesModel.name ??
                          "",
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(
                        fontSize: 30.sp,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                     formattedDate ,
                      style: const TextStyle(color: Color(0xFF7A7A7A)),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      formattedTime,
                      style: const TextStyle(color: Color(0xFF7A7A7A)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                BlocBuilder<GenerateQrCubit, GenerateQrState>(
                  builder: (context, state) {
                    if (state is GenerateQrSuccess) {
                      return Card(
                        elevation: 5,
                        color: Colors.white,
                        child: QrImageView(
                          embeddedImage: const AssetImage(
                              "assets/logo/Attendo primary -no background.png"),
                          embeddedImageStyle:
                          const QrEmbeddedImageStyle(size: Size(40, 40)),
                          eyeStyle: const QrEyeStyle(
                              eyeShape: QrEyeShape.circle, color: Colors.black),
                          dataModuleStyle: const QrDataModuleStyle(
                              dataModuleShape: QrDataModuleShape.circle,
                              color: Colors.black),
                          data: state.qrCode,
                          version: QrVersions.auto,
                          size: 200,
                        ),
                      );
                    } else if (state is GenerateQrLoading) {
                      return SizedBox(
                          height: 200.h,
                          width: 200.w,
                          child: const Center(
                              child: CircularProgressIndicator()));
                    } else {
                      return Container(
                        color: Colors.white,
                        height: 200.h,
                        width: 200.w,
                        child: const Center(
                          child: Text(
                            "Error 404",
                          ),
                        ),
                      );
                    }
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                BlocConsumer<StartReportCubit, StartReportState>(
                  listener: (context, state) {
                    if (state is StartReportSuccess) {
                      GlobalSnackBar.show(context, state.reportMessage.message);
                    } else if (state is StartReportFailure) {
                      GlobalSnackBar.show(context, state.errMessage);
                    }
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            state is StartReportSuccess ||
                                state is StartReportFailure
                                ? Colors.grey
                                : const Color(0xFF0066FF)),
                        padding: const WidgetStatePropertyAll(EdgeInsets.zero),
                        fixedSize: WidgetStatePropertyAll(
                          Size(
                            250.w,
                            73.h,
                          ),
                        ),
                        shape: WidgetStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              22.w,
                            ),
                          ),
                        ),

                      ),
                      onPressed: () {
                        state is StartReportSuccess
                            ? !lectureStarted
                            : context.read<StartReportCubit>().startReport(
                            lecturePk: widget.instructorDetailsReportModel
                                .instructorLecturesModel.pk!);
                        !lectureStarted;

                      },
                      child: state is StartReportSuccess ||
                          state is StartReportFailure
                          ? Text(
                        "Attendance Started",
                        style: TextStyle(fontSize: 24.sp),
                      )
                          : Text("Take Attendance",
                          style: TextStyle(fontSize: 24.sp)),
                    );
                  },
                ),
                SizedBox(
                  height: 30.h,
                ),
                const Spacer(),
                const StudentsAttendingWidget(),
                const SizedBox(height: 35,),
                ShowStudentsListPopUpWidget(
                  instructorDetailsReportModel:
                  widget.instructorDetailsReportModel,
                ),
              ],
            ),
          )
        ],
      )
      ,
    );
  }
}
