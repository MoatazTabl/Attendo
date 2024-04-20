import 'package:attendo/core/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class CreateLectureAdmin extends StatelessWidget {
  const CreateLectureAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: 1.sw,
        height: 1.sh,
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage(AppImages.backgroundImageStudent),
              fit: BoxFit.fill),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 125.h,
              ),
              Text(
                "Create Lecture",
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),
                child: SizedBox(
                  height: 54.h,
                  child: TextFormField(
                    enabled: true,
                    decoration: InputDecoration(
                      suffix: SvgPicture.asset(AppImages.calenderIcon),
                      hintText: 'Enter Subject Name',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(fontSize: 18.sp),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.w),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: const Color(0xfff0f3ff),
                      contentPadding: const EdgeInsets.only(left: 10, right: 5),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),
                child: SizedBox(
                  height: 54.h,
                  child: TextFormField(
                    enabled: true,
                    decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: SvgPicture.asset(AppImages.calenderIcon),
                      ),
                      suffixIconConstraints:
                          const BoxConstraints(maxHeight: 25, maxWidth: 25),
                      hintText: 'Choose Grade',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(fontSize: 18.sp),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.w),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: const Color(0xfff0f3ff),
                      contentPadding: const EdgeInsets.only(left: 10, right: 5),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),
                child: SizedBox(
                  height: 54.h,
                  child: TextFormField(
                    enabled: true,
                    decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: SvgPicture.asset(AppImages.arrowDownIcon),
                      ),
                      suffixIconConstraints:
                          const BoxConstraints(maxHeight: 14, maxWidth: 26),
                      hintText: 'Select Date',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(fontSize: 18.sp),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.w),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: const Color(0xfff0f3ff),
                      contentPadding: const EdgeInsets.only(left: 10, right: 5),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),
                child: SizedBox(
                  height: 54.h,
                  child: TextFormField(
                    enabled: true,
                    decoration: InputDecoration(
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: SvgPicture.asset(AppImages.timeIcon),
                      ),
                      suffixIconConstraints:
                          const BoxConstraints(maxHeight: 27, maxWidth: 27),
                      hintText: 'Select Time',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(fontSize: 18.sp),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.w),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: const Color(0xfff0f3ff),
                      contentPadding: const EdgeInsets.only(left: 10, right: 5),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 19.h,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(Size(215.w, 56.h)),
                  maximumSize: MaterialStateProperty.all(Size(215.w, 56.h)),
                ),
                onPressed: () {
                  context.go("/adminMainScreen");
                },
                child: const Text(
                  "Add Lecture",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
