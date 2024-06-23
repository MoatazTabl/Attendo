import 'dart:async';

import 'package:attendo/core/helpers/common.dart';
import 'package:attendo/core/utils/app_theme.dart';
import 'package:attendo/core/widgets/custom_snack_bar.dart';
import 'package:attendo/intro/instructor/features/attendance_page/presentation/view_model/cubits/get_report_cubit.dart';
import 'package:attendo/intro/instructor/features/attendance_page/presentation/view_model/models/instructor_details_report_model.dart';
import 'package:attendo/intro/instructor/features/lecture_details/presentation/view/widgets/show_students_list_pop_up_widget.dart';
import 'package:attendo/intro/instructor/features/lecture_details/presentation/view/widgets/students_attending_widget.dart';
import 'package:attendo/intro/instructor/features/lecture_details/presentation/view_model/cubits/generate_qr/generate_qr_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
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

    formattedTime = DateFormat('hh:mm a').format(dateTime);
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
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.instructorDetailsReportModel.instructorLecturesModel
                        .name ??
                    "",
                style: GoogleFonts.poppins(fontSize: 30.sp),
              ),
              Text(
                formattedDate,
                style: const TextStyle(color: Color(0xFF7A7A7A)),
              ),
              Text(
                formattedTime,
                style: const TextStyle(color: Color(0xFF7A7A7A)),
              ),
              SizedBox(
                height: 20.h,
              ),
              BlocBuilder<GenerateQrCubit, GenerateQrState>(
                builder: (context, state) {
                  if (state is GenerateQrSuccess) {
                    return Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          24,
                        ),
                      ),
                      color: Colors.white,
                      child: QrImageView(
                        embeddedImage: const AssetImage(
                            "assets/logo/Attendo primary -no background.png"),
                        embeddedImageStyle: const QrEmbeddedImageStyle(
                          size: Size(
                            40,
                            40,
                          ),
                        ),
                        eyeStyle: const QrEyeStyle(
                          eyeShape: QrEyeShape.circle,
                          color: Colors.black,
                        ),
                        dataModuleStyle: const QrDataModuleStyle(
                            dataModuleShape: QrDataModuleShape.circle,
                            color: Colors.black),
                        data: state.qrCode,
                        version: QrVersions.auto,
                        size: 250,
                      ),
                    );
                  } else if (state is GenerateQrLoading) {
                    return SizedBox(
                      height: 325.h,
                      width: 300.w,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
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
                              : AppTheme.mainBlue),
                      padding: const WidgetStatePropertyAll(EdgeInsets.zero),
                      fixedSize: WidgetStatePropertyAll(
                        Size(
                          315.w,
                          73.h,
                        ),
                      ),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            16.w,
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
                            getAppLocalizations(context)!.attendanceStarted,
                            style: TextStyle(
                              fontSize: 24.sp,
                            ),
                          )
                        : Text(
                            getAppLocalizations(context)!.takeAttendance,
                            style: TextStyle(
                              fontSize: 24.sp,
                            ),
                          ),
                  );
                },
              ),
              const Spacer(),
              const StudentsAttendingWidget(),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: ShowStudentsListPopUpWidget(
                  instructorDetailsReportModel:
                      widget.instructorDetailsReportModel,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
