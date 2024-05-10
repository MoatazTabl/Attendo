import 'package:attendo/core/widgets/custom_snack_bar.dart';
import 'package:attendo/intro/instructor/features/home/data/models/instructor_lectures_model.dart';
import 'package:attendo/intro/instructor/features/lecture_details/presentation/view/widgets/show_students_list_pop_up_widget.dart';
import 'package:attendo/intro/instructor/features/lecture_details/presentation/view/widgets/students_attending_widget.dart';
import 'package:attendo/intro/instructor/features/lecture_details/presentation/view_model/cubits/generate_qr/generate_qr_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../../../core/app_images.dart';
import '../view_model/cubits/start_report/start_report_cubit.dart';

class InstructorLectureDetails extends StatelessWidget {
  const InstructorLectureDetails(
      {super.key, required this.instructorLecturesModel});

  final InstructorLecturesModel instructorLecturesModel;

  @override
  Widget build(BuildContext context) {
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
                      instructorLecturesModel.name ?? "",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
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
                      context.read<GenerateQrCubit>().startLecture = true;
                      return Card(
                        color: Colors.white,
                        child: QrImageView(
                          data: state.qrCode,
                          version: 3,
                          size: 200,
                        ),
                      );
                    } else if (state is GenerateQrLoading) {
                      return const CircularProgressIndicator();
                    } else {
                      return InkWell(
                        onTap: () {
                          context.read<GenerateQrCubit>().generateQrCode(
                              lecturePk: instructorLecturesModel.pk!);
                          print("${instructorLecturesModel.students} doneeeeeeeeeeeeee");
                        },
                        child: Container(
                            color: Colors.white,
                            height: 200.h,
                            width: 200.w,
                            child: const Center(
                                child: Text("Click to Generate QR "))),
                      );
                    }
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                BlocBuilder<GenerateQrCubit, GenerateQrState>(
                  builder: (context, state) {
                    final startLecture = context
                        .select((GenerateQrCubit cubit) => cubit.startLecture);
                    return Visibility(
                      visible: startLecture ?? false,
                      child: BlocConsumer<StartReportCubit, StartReportState>(
                        listener: (context, state) {
                          if (state is StartReportSuccess) {
                            GlobalSnackBar.show(
                                context, state.reportMessage.message);
                          }
                          else if(state is StartReportFailure)
                            {
                              GlobalSnackBar.show(
                                  context, state.errMessage);
                            }
                        },
                        builder: (context, state) {
                          return ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  state is StartReportSuccess || state is StartReportFailure
                                      ? Colors.grey
                                      : const Color(0xff3746CC)),
                              fixedSize: MaterialStatePropertyAll(
                                Size(
                                  230.w,
                                  59.h,
                                ),
                              ),
                            ),
                            onPressed: () {
                              state is StartReportSuccess
                                  ? null
                                  : context
                                      .read<StartReportCubit>()
                                      .startReport(
                                          lecturePk:
                                              instructorLecturesModel.pk!);
                            },
                            child: state is StartReportSuccess || state is StartReportFailure
                                ? const Text("Report Started")
                                : const Text("Start Report"),
                          );
                        },
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 30.h,
                ),
                const StudentsAttendingWidget(),
                const ShowStudentsListPopUpWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
