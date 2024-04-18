import 'package:attendo/intro/instructor/features/home/presentation/view/widgets/instructor_lecture_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/app_images.dart';
import '../../../../../../core/utils/font_adapter.dart';

class HomeInstructor extends StatelessWidget {
  const HomeInstructor({Key? key}) : super(key: key);

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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 105.sp),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "A v a i l a b l e  L e c t u r e s",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 30.sp,
                          ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: InstructorLectureCard(),
                      );
                    },
                    itemCount: 5,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
