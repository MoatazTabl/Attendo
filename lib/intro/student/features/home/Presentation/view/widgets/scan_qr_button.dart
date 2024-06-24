import 'package:attendo/core/app_images.dart';
import 'package:attendo/core/helpers/common.dart';
import 'package:attendo/core/router/app_routes.dart';
import 'package:attendo/core/utils/local_auth.dart';
import 'package:attendo/intro/student/features/home/data/models/students_lectures_model.dart';
import 'package:attendo/intro/student/features/scan_qr/data/model/qr_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ScanQrButton extends StatelessWidget {
  const ScanQrButton(
      {super.key,
      required this.animationTime,
      required this.lectures,
      required this.studentName});

  final Duration animationTime;
  final StudentsLecturesModel lectures;
  final String studentName;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: animationTime,
      curve: Curves.easeIn,
      height: 43.h,
      width: 170.w,
      margin: EdgeInsets.only(
        top: 19.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.transparent,
      ),
      child: ElevatedButton(
        onPressed: () async {
          bool localAuth =
              await LocalAuth().authenticateWithBiometrics(context);
          if (localAuth && context.mounted) {
            context.push(
              AppRoutes.scanQr,
              extra: QrModel(
                studentName: studentName,
                lectureId: lectures.pk!,
              ),
            );
          }
        },
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                32,
              ),
            ),
          ),
          enableFeedback: true,
          // backgroundColor:
          // const WidgetStatePropertyAll(Colors.transparent),

          shadowColor: WidgetStateProperty.all(Colors.transparent),
          elevation: WidgetStateProperty.all(0),
          padding: WidgetStateProperty.all(
            EdgeInsets.zero,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              getAppLocalizations(context)!.scanQR,
              style: GoogleFonts.poppins(
                  fontSize: 20.sp, fontWeight: FontWeight.w700),
            ),
            SvgPicture.asset(
              AppImages.scanQr,
              height: 25,
              width: 25,
            )
          ],
        ),
      ),
    );
  }
}
