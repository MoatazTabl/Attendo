import 'package:attendo/intro/instructor/features/home/presentation/view/widgets/instructor_lecture_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeInstructor extends StatelessWidget {
  const HomeInstructor({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 16.sp,
        right: 16.sp,
        top: 70.sp,
      ),
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
            height: 5.h,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(bottom: 12),
                  child: InstructorLectureCard(),
                );
              },
              itemCount: 5,
            ),
          )
        ],
      ),
    );
  }
}
