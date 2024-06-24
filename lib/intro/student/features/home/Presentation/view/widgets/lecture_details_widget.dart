import 'package:attendo/core/app_images.dart';
import 'package:attendo/intro/student/features/home/data/models/students_lectures_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class LectureDetailsWidget extends StatelessWidget {
  const LectureDetailsWidget({super.key, required this.lectures});

  final StudentsLecturesModel lectures;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
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
              dateTime(lectures.lectureStartTime) ?? "",
              style: GoogleFonts.poppins(
                  fontSize: 20.sp, fontWeight: FontWeight.w600),
            ),
          ],
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
              lectures.lectureHall ?? "",
              style: GoogleFonts.poppins(
                  fontSize: 20.sp, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    );
  }

  String? dateTime(String? dateTime) {
    var dateFormat = DateFormat.jm().format(DateTime.parse(dateTime ?? ""));
    return dateFormat;
  }
}
