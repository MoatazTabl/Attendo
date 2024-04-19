import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/app_images.dart';
import '../../../../../../core/utils/font_adapter.dart';

class AttendancePageInstructor extends StatelessWidget {
  const AttendancePageInstructor({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              AppImages.backgroundImageStudent,
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
                        borderRadius: BorderRadius.only(bottomLeft:Radius.circular(25),bottomRight:Radius.circular(25) ),
                      ),
                      child: Column(
                        children: [
                          Text("OOP Lecture",style: Theme
                              .of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                            fontSize: 28.sp,
                          ),),
                          SizedBox(height: 4.h,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("22/04/2024", style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!,),
                              Text("11:00 AM", style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!,)
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.h,),
                Text(
                  "Attendance List",
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.sp,
                  ),
                ),
                SizedBox(height: 19.h,),
                Container(
                  height: 500.h,
                  width: 320.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.black),
                    color: Color(0xFFF0F3FF),
                  ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () {

                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                      Size(320.w, 56.h),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      const Color(
                        0xff3746CC,
                      ),
                    ),
                    foregroundColor:
                    MaterialStateProperty.all(Colors.white),
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
                          fontSize: FontAdaption().getResponsiveFontSize(
                              context, fontSize: 25),
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
