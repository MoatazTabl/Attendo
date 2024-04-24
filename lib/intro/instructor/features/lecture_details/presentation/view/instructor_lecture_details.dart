import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../../../core/app_images.dart';

class InstructorLectureDetails extends StatelessWidget {
  const InstructorLectureDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              AppImages.backgroundImage,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: 16.sp, right: 16.sp, top: 105.sp, bottom: 50.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "OOP Lecture",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 30.sp,
                          ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Card(
                  color: Colors.white,
                  child: QrImageView(
                    data: "OOP Lecure",
                    version: 2,
                    size: 200,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  width: 229.w,
                  height: 156.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFFF0F3FF),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 9.h,
                      ),
                      Text("Student Attending",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 20.sp)),
                      SizedBox(
                        height: 16.h,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 35.w,
                        child: const Text(
                          '150',
                          style: TextStyle(color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
                InkWell(
                    onTap: () {
                      context.push("/attendancePageInstructor");
                    },
                    child: SvgPicture.asset(AppImages.studentAttendingPopUp)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
