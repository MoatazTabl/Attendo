import 'dart:async';

import 'package:attendo/core/widgets/custom_snack_bar.dart';
import 'package:attendo/intro/instructor/features/attendance_page/presentation/view_model/cubits/get_report_cubit.dart';
import 'package:attendo/intro/instructor/features/attendance_page/presentation/view_model/models/instructor_details_report_model.dart';
import 'package:attendo/intro/instructor/features/lecture_details/presentation/view/widgets/show_students_list_pop_up_widget.dart';
import 'package:attendo/intro/instructor/features/lecture_details/presentation/view/widgets/students_attending_widget.dart';
import 'package:attendo/intro/instructor/features/lecture_details/presentation/view_model/cubits/generate_qr/generate_qr_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../../../core/app_images.dart';
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
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              AppImages.backgroundImage,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
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
                SizedBox(
                  height: 20.h,
                ),
                BlocBuilder<GenerateQrCubit, GenerateQrState>(
                  builder: (context, state) {
                    if (state is GenerateQrSuccess) {
                      // context.read<GenerateQrCubit>().startLecture = true;
                      return Card(
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
                          height: 245.h,
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
                        backgroundColor: MaterialStatePropertyAll(
                            state is StartReportSuccess ||
                                state is StartReportFailure
                                ? Colors.grey
                                : const Color(0xff3746CC)),
                        padding:
                        const MaterialStatePropertyAll(EdgeInsets.zero),
                        fixedSize: MaterialStatePropertyAll(
                          Size(
                            230.w,
                            59.h,
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
                const StudentsAttendingWidget(),
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
