import 'package:attendo/core/helpers/common.dart';
import 'package:attendo/core/router/app_routes.dart';
import 'package:attendo/intro/instructor/features/home/presentation/data/models/instructor_lectures_model.dart';
import 'package:attendo/intro/instructor/features/home/presentation/logic/home_instructor_cubit.dart';
import 'package:attendo/intro/instructor/features/home/presentation/view/widgets/skip_lecture_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class InstructorLectureCard extends StatelessWidget {
  const InstructorLectureCard(
      {super.key, required this.instructorLecturesModel});

  final InstructorLecturesModel instructorLecturesModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.w)),
      color: const Color(0xFFF0F3FF).withOpacity(0.5),
      elevation: 0,
      child: Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w, bottom: 15.h),
        child: Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            Text(
              instructorLecturesModel.name ?? "",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 36.sp),
            ),
            SizedBox(
              height: 9.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  instructorLecturesModel.instructorInfo?.name ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 22.sp),
                ),
                Text(
                  instructorLecturesModel.grade ?? "",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 22.sp),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  instructorLecturesModel.lectureStartTime
                          ?.split("T")[0] ??
                      "",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 18.sp),
                ),
                Text(
                  dateTime(instructorLecturesModel.lectureStartTime) ??
                      "",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontSize: 18.sp),
                ),
              ],
            ),
            SizedBox(
              height: 9.h,
            ),
            Text(
              instructorLecturesModel.lectureHall ?? "",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 25.sp),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    context.push(AppRoutes.editLectureInstructor,
                        extra: instructorLecturesModel).then((value) {
                      context
                          .read<HomeInstructorCubit>()
                          .getStudentLectures(data: {
                        "instructor": instructorLecturesModel
                            .instructorInfo?.name,
                        // "date":"2024-04-30T09:18:54"
                        "date": DateTime.now()
                            .toIso8601String()
                            .split(".")[0]
                      });
                    });
                  },
                  iconSize: 32,
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.green,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    context.push(AppRoutes.instructorLectureDetails,
                        extra: instructorLecturesModel);
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                      Size(215.w, 56.h),
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
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                  ),
                  child: Text(
                    getAppLocalizations(context)!.showDetails,
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SkipLectureDialog(instructorLecturesModel: instructorLecturesModel),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String? dateTime(String? dateTime) {
    var dateFormat = DateFormat.jm().format(DateTime.parse(dateTime ?? ""));
    return dateFormat;
  }
}

