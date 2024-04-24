import 'package:attendo/intro/instructor/features/attendance_page/presentation/view/widgets/attendent_student_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/app_images.dart';

class AttendancePageInstructor extends StatelessWidget {
  const AttendancePageInstructor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              AppImages.backgroundImage,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300.w,
                      height: 90.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.blue),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25)),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "OOP Lecture",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  fontSize: 28.sp,
                                ),
                          ),
                          SizedBox(
                            height: 4.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "22/04/2024",
                                style: Theme.of(context).textTheme.titleSmall!,
                              ),
                              Text(
                                "11:00 AM",
                                style: Theme.of(context).textTheme.titleSmall!,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.h,
                ),
                Text(
                  "Attendance List",
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 30.sp,
                      ),
                ),
                SizedBox(
                  height: 19.h,
                ),
                Container(
                  height: 500.h,
                  width: 340.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.black),
                    color: const Color(0xFFF0F3FF),
                  ),
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const Divider(
                        indent: 25,
                        endIndent: 25,
                        color: Color(0xFF707070),
                      );
                    },
                    itemBuilder: (context, index) {
                      return const AttendentSrudentItem();
                    },
                    itemCount: 10,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                      Size(340.w, 56.h),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      const Color(
                        0xff3746CC,
                      ),
                    ),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.w),
                      ),
                    ),
                  ),
                  child: Text(
                    "Download Full List",
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
