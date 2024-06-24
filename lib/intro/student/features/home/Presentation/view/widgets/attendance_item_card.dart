import 'package:attendo/intro/student/features/home/Presentation/view/widgets/lecture_details_widget.dart';
import 'package:attendo/intro/student/features/home/Presentation/view/widgets/scan_qr_button.dart';
import 'package:attendo/intro/student/features/home/data/models/students_lectures_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class AttendanceCard extends StatefulWidget {
  const AttendanceCard(
      {super.key,
      required this.isActive,
      required this.lectures,
      required this.studentName});

  final bool isActive;
  final StudentsLecturesModel lectures;
  final String studentName;

  @override
  State<AttendanceCard> createState() => _AttendanceCardState();
}

class _AttendanceCardState extends State<AttendanceCard>
    with WidgetsBindingObserver {
  final Duration animationTime = const Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedScale(
        scale: widget.isActive ? 1.0 : 0.8,
        duration: animationTime,
        child: AnimatedContainer(
          height: 222.h,
          width: 312.w,
          // padding: EdgeInsets.only(bottom: 10.h),
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
          duration: animationTime,
          curve: Curves.easeIn,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.lectures.name ?? "",
                style: GoogleFonts.poppins(
                    fontSize: 28.sp, fontWeight: FontWeight.w700),
              ),
              Text(
                widget.lectures.instructorInfo?.name ?? "",
                style: GoogleFonts.poppins(
                    fontSize: 20.sp, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10.h,
              ),
              LectureDetailsWidget(lectures: widget.lectures),
              ScanQrButton(
                  animationTime: animationTime,
                  lectures: widget.lectures,
                  studentName: widget.studentName)
            ],
          ),
        ),
      ),
    );
  }

}
