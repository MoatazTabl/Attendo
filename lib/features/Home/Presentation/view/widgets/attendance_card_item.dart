import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AttendanceCard extends StatefulWidget {
  const AttendanceCard({
    super.key,
  });

  @override
  State<AttendanceCard> createState() => _AttendanceCardState();
}


class _AttendanceCardState extends State<AttendanceCard> {

  late Image myImage;

  @override
  void initState() {
    super.initState();
    myImage= Image.asset("assets/images/attendance_card_background.png");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(myImage.image, context);
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 242.h,
        width: 381.w,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.w),
          ),
          image: const DecorationImage(
            image:
            AssetImage("assets/images/attendance_card_background.png"),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 24.h,
            ),
            Text(
              "Oop Lecture",
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Colors.white, fontWeight: FontWeight.w500),
            ),
            Text(
              "Dr/Bahaa",
              style: GoogleFonts.roboto(
                textStyle: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            SizedBox(height: 15.h,),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(
                  Size(258.w, 89.h),
                ),
                backgroundColor: MaterialStateProperty.all(
                    const Color(0xff2403F1).withOpacity(.42)),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.w),
                  ),
                ),
              ),
              child: Text(
                "Scan Qr",
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    color: Colors.white, fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
