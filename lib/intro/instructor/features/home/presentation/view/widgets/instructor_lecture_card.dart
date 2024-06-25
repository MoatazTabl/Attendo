import 'package:attendo/core/app_images.dart';
import 'package:attendo/core/helpers/common.dart';
import 'package:attendo/core/router/app_routes.dart';
import 'package:attendo/core/utils/app_theme.dart';
import 'package:attendo/intro/instructor/features/attendance_page/presentation/view_model/models/instructor_details_report_model.dart';
import 'package:attendo/intro/instructor/features/edit_lecture/presentation/view/edit_lecture_instructor.dart';
import 'package:attendo/intro/instructor/features/home/data/models/instructor_lectures_model.dart';
import 'package:attendo/intro/instructor/features/home/logic/home_instructor_cubit.dart';
import 'package:attendo/intro/instructor/features/home/presentation/view/widgets/skip_lecture_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class InstructorLectureCard extends StatefulWidget {
  const InstructorLectureCard(
      {super.key, required this.instructorLecturesModel});

  final InstructorLecturesModel instructorLecturesModel;

  @override
  State<InstructorLectureCard> createState() => _InstructorLectureCardState();
}

class _InstructorLectureCardState extends State<InstructorLectureCard> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 232.h,
        width: 312.w,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              47.w,
            ),
            side: BorderSide.lerp(
              const BorderSide(color: Color(0xffd1dafa), width: 4),
              const BorderSide(
                color: Color(0xffcacff3),
                width: 4,
              ),
              .5,
            ),
          ),
          gradient: LinearGradient(
            colors: [
              const Color(0xffc2cff8).withOpacity(0.5),
              const Color(0xffeef0f6).withOpacity(0.5),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Text(
              widget.instructorLecturesModel.name ?? "",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontSize: 30.sp, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      AppImages.timeIcon,
                      width: 18,
                      height: 18,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      dateTime(widget
                              .instructorLecturesModel.lectureStartTime) ??
                          "",
                      style: GoogleFonts.poppins(
                          fontSize: 20.sp, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.w,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppImages.locationIcon,
                      width: 18,
                      height: 18,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      widget.instructorLecturesModel.lectureHall ?? "",
                      style: GoogleFonts.poppins(
                          fontSize: 20.sp, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            ElevatedButton(
              onPressed: () async {
                String formattedDateTime = DateFormat("yyyy-MM-dd HH:mm:ss")
                    .format(context.read<HomeInstructorCubit>().dateTime);

                formattedDateTime = formattedDateTime.replaceFirst(' ', 'T');
                InstructorDetailsReportModel instructorDetailsReportModel =
                    InstructorDetailsReportModel(
                        instructorLecturesModel: widget.instructorLecturesModel,
                        date: formattedDateTime);
                context.push(AppRoutes.instructorLectureDetails,
                    extra: instructorDetailsReportModel);
              },
              style: ButtonStyle(
                fixedSize: WidgetStateProperty.all(
                  Size(170.w, 43.h),
                ),
                backgroundColor: WidgetStateProperty.all(
                  AppTheme.mainBlue,
                ),
                shadowColor: WidgetStateProperty.all(Colors.transparent),
                foregroundColor: WidgetStateProperty.all(Colors.white),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      16.w,
                    ),
                  ),
                ),
                enableFeedback: true,
                padding: WidgetStateProperty.all(EdgeInsets.zero),
              ),
              child: Text(
                getAppLocalizations(context)!.showDetails,
                style: GoogleFonts.inter(
                  textStyle: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 30.h,
                    child: IconButton(
                      onPressed: () async {
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.white,
                          isScrollControlled: true,
                          showDragHandle: true,
                          builder: (context) {
                            return EditLectureInstructor(
                              instructorLecturesModel:
                                  widget.instructorLecturesModel,
                            );
                          },
                        ).then((value) {
                          context
                              .read<HomeInstructorCubit>()
                              .getInstructorLectures(data: {
                            "instructor": widget
                                .instructorLecturesModel.instructorInfo?.name,
                            // "date":"2024-04-30T09:18:54"
                            "date": context
                                .read<HomeInstructorCubit>()
                                .dateTime
                                .toIso8601String()
                                .split(".")[0]
                          });
                        });
                      },
                      padding: EdgeInsets.zero,
                      // iconSize: 24,
                      icon: SvgPicture.asset(
                        AppImages.editButton,
                        height: 30.h,
                        width: 30.h,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                    child: SkipLectureDialog(
                        instructorLecturesModel:
                            widget.instructorLecturesModel),
                  ),
                ],
              ),
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

class EditLectureBottomSheet extends StatelessWidget {
  const EditLectureBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
