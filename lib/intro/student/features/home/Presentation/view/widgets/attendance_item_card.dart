import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class AttendanceCard extends StatelessWidget {
  const AttendanceCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 242.h,
        width: 381.w,
        margin: EdgeInsets.symmetric(vertical: 10.h),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.w),
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Image.asset("assets/images/attendance_card_background.png"),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Lottie.asset(
                  "assets/images/Animation - 1713733414829.json",
                  repeat: true,
                  frameRate: FrameRate.max),
            ),
            Column(
              children: [
                SizedBox(
                  height: 24.h,
                ),
                Text(
                  "Oop Lecture",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 40.sp),
                ),
                Text(
                  "Dr/Bahaa",
                  style: GoogleFonts.roboto(
                    textStyle: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                ElevatedButton(
                  onPressed: ()  {
                     context.push("/fingerPrintScanScreen");
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                      Size(258.w, 89.h),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      const Color(0xff2403F1).withOpacity(
                        .42,
                      ),
                    ),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          32.w,
                        ),
                      ),
                    ),
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
                        ),
                      ),
                      Text(
                        "Scan Qr",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 40.sp,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
