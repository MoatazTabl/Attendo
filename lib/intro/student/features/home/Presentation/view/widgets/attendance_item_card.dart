import 'package:attendo/core/app_images.dart';
import 'package:attendo/core/helpers/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class AttendanceCard extends StatelessWidget {
  const AttendanceCard({
    super.key,
    required this.isActive,
  });

  final bool isActive;
  final Duration animationTime = const Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        height: isActive == true ? 250.h : 210.h,
        width: isActive == true ? 375.w : 340.w,
        margin: EdgeInsets.symmetric(vertical: 10.h),
        decoration: ShapeDecoration(
          image: const DecorationImage(
            image: AssetImage(
              AppImages.attendanceCardBackground,
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.w),
          ),
        ),
        duration: animationTime,
        curve: Curves.easeIn,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                AnimatedDefaultTextStyle(
                  style: TextStyle(
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 1.5
                      ..color = Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: isActive == true ? 40.sp : 28.sp,
                  ),
                  duration: animationTime,
                  child: const Text(
                    "Oop Lecture",
                  ),
                ),
                AnimatedDefaultTextStyle(
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    fontSize: isActive == true ? 40.sp : 28.sp,
                  ),
                  duration: animationTime,
                  child: const Text(
                    "Oop Lecture",
                  ),
                ),
              ],
            ),
            AnimatedDefaultTextStyle(
              style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Colors.black,
                    fontSize: isActive == true ? 20.sp : 15.sp,
                    fontWeight: FontWeight.w500),
              ),
              duration: animationTime,
              child: const Text(
                "Dr/Bahaa",
              ),
            ),
            SizedBox(height: 6.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
              children: [
                AnimatedDefaultTextStyle(
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(
                            color: Colors.black,
                            fontSize: isActive == true ? 20.sp : 15.sp,
                            fontWeight: FontWeight.w500),
                  ),
                  duration: animationTime,
                  child: const Text(
                    "D305",
                  ),
                ),
                AnimatedDefaultTextStyle(
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(
                            color: Colors.black,
                            fontSize: isActive == true ? 20.sp : 15.sp,
                            fontWeight: FontWeight.w500),
                  ),
                  duration: animationTime,
                  child: const Text(
                    "10:00 AM",
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 9.h,
            ),
            AnimatedContainer(
                duration: animationTime,
                curve: Curves.easeIn,
                height: isActive == true ? 89.h : 60.h,
                width: isActive == true ? 258.w : 180.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.w),
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
                  onPressed: () {
                    context.push("/fingerPrintScanScreen");
                  },
                  style: ButtonStyle(
                    // backgroundColor: MaterialStateProperty.all(
                    //   const Color(0xff2403F1).withOpacity(
                    //     .42,
                    //   ),
                    // ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          32.w,
                        ),
                      ),
                    ),
                    enableFeedback: true,
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.transparent),
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
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
                          height: isActive == true ? 50 : 30,
                          width: isActive == true ? 47 : 30,
                        ),
                      ),
                      AnimatedDefaultTextStyle(
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: isActive == true ? 40.sp : 28.sp,
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
    );
  }
}
