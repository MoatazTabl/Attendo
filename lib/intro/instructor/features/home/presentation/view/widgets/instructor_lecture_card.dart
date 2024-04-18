import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../core/utils/font_adapter.dart';

class InstructorLectureCard extends StatelessWidget {
  const InstructorLectureCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      surfaceTintColor: Color(0xFFF0F3FF),
      color: Color(0xFFF0F3FF),
      elevation: 6,
      child: Container(
        height: 280.h,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color(0xFFF0F3FF),
            borderRadius: BorderRadius.circular(25)),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 15.sp, vertical: 20.sp),
          child: Column(
            children: [
              Text(
                'OOP Lecture',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 30.sp),
              ),
              SizedBox(
                height: 12.h,
              ),
              Text(
                '4th Grade',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!,
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("22/04/2024", style: Theme.of(context)
                      .textTheme
                      .titleMedium!,),
                  Text("11 : 00 AM", style: Theme.of(context)
                      .textTheme
                      .titleMedium!,),

                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("D 305", style: Theme.of(context)
                      .textTheme
                      .titleMedium!,),
                ],
              ),
              SizedBox(
                height: 12.h,
              ),
              ElevatedButton(
                onPressed: () {
                  context.push("/instructorLectureDetails");
                },
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(
                    Size(215.w, 56.h),
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
                  "Show Details",
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
        ),
      ),
    );
  }
}
