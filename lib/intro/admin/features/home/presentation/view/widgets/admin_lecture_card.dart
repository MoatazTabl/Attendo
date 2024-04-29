import 'package:attendo/core/helpers/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';


class AdminLectureCard extends StatelessWidget {
  const AdminLectureCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.w)),
      surfaceTintColor: const Color(0xFFF0F3FF),
      color: const Color(0xFFF0F3FF),
      elevation: 6,
      child: Container(
        height: 295.h,
        width: 1.sw,
        decoration: BoxDecoration(
            color: const Color(0xFFF0F3FF),
            borderRadius: BorderRadius.circular(25.w)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 0.h),
          child: Column(
            children: [
              SizedBox(
                height: 15.h,
              ),
              Text(
                'OOP Lecture',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(fontSize: 36.sp),
              ),
              SizedBox(
                height: 9.h,
              ),
              Text(
                '4th Grade',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 22.sp),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "22/04/2024",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 18.sp),
                  ),
                  Text(
                    "11 : 00 AM",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 18.sp),
                  ),
                ],
              ),
              SizedBox(
                height: 9.h,
              ),
              Text(
                "D 305",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 25.sp),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      context.push("/AttendancePageAdmin");
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
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            22.w,
                          ),
                        ),
                      ),
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                    ),
                    child: Text(
                      getAppLocalizations(context)!.showDetails,
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.delete,
                    color: Colors.redAccent,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
