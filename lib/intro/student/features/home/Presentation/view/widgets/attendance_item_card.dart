import 'package:attendo/core/app_images.dart';
import 'package:attendo/core/helpers/common.dart';
import 'package:attendo/core/utils/local_auth.dart';
import 'package:attendo/intro/student/features/home/data/models/students_lectures_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../../scan_qr/presentation/view/scan_qr.dart';

class AttendanceCard extends StatelessWidget {
  const AttendanceCard({
    super.key,
    required this.isActive,
    required this.lectures,
    required this.studentName
  });

  final bool isActive;
  final Duration animationTime = const Duration(milliseconds: 300);

  final StudentsLecturesModel lectures;
  final String studentName;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedScale(
        scale: isActive ? 1.0 : 0.8,
        duration: animationTime,
        child: AnimatedContainer(
          height: 250.h,
          width: 340.w,
          margin: EdgeInsets.symmetric(vertical: 10.h),
          decoration: ShapeDecoration(
            image: const DecorationImage(
                image: AssetImage(
                  AppImages.attendanceCardBackground,
                ),
                fit: BoxFit.fill),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          duration: animationTime,
          curve: Curves.easeIn,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedDefaultTextStyle(
                      style: TextStyle(
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 2
                          ..color = Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: constraints.maxWidth / 10,
                      ),
                      duration: animationTime,
                      child: Text(
                        lectures.name ?? "",
                      ),
                    ),
                    AnimatedDefaultTextStyle(
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: constraints.maxWidth / 10,
                      ),
                      duration: animationTime,
                      child: Text(
                        lectures.name ?? "",
                      ),
                    ),
                  ],
                );
              }),
              AnimatedDefaultTextStyle(
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500),
                ),
                duration: animationTime,
                child: Text(
                  lectures.instructorInfo?.name ?? "",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  AnimatedDefaultTextStyle(
                    style: GoogleFonts.roboto(
                      textStyle:
                          Theme.of(context).textTheme.labelMedium!.copyWith(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                    duration: animationTime,
                    child: Text(
                      lectures.lectureHall ?? "",
                    ),
                  ),
                  AnimatedDefaultTextStyle(
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500),
                    ),
                    duration: animationTime,
                    child: Text(
                      dateTime(lectures.lectureStartTime) ?? "",
                    ),
                  ),
                ],
              ),
              AnimatedContainer(
                  duration: animationTime,
                  curve: Curves.easeIn,
                  height: 89.h,
                  width: 258.w,
                  margin: EdgeInsets.only(
                    top: 9.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Colors.transparent,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.7),
                        blurStyle: BlurStyle.outer,
                        offset: const Offset(0, 0),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () async{
                      // context.push("/fingerPrintScanScreen");
                      bool localAuth=await LocalAuth().authenticateWithBiometrics();
                      print(localAuth);
                      if(localAuth){
                    final generatedCode = await QrCodeFunctions().getLectureCode(lectures.pk!);
                      QrCodeFunctions.scan(context,generatedCode,lectures.pk!,studentName);}
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            32,
                          ),
                        ),
                      ),
                      enableFeedback: true,
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.transparent),
                      shadowColor:
                          MaterialStateProperty.all(Colors.transparent),
                      elevation: MaterialStateProperty.all(0),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.zero,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: 7.h,
                          ),
                          child: SvgPicture.asset(
                            "assets/images/svg/scan_qr.svg",
                            height: 50,
                            width: 47,
                          ),
                        ),
                        AnimatedDefaultTextStyle(
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 40.sp,
                          ),
                          duration: animationTime,
                          child: Text(getAppLocalizations(context)!.scanQR),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  String? dateTime(String? dateTime) {
    var dateFormat = DateFormat.jm().format(DateTime.parse(dateTime ?? ""));
    return dateFormat;
  }
}
