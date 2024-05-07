import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/helpers/common.dart';

class StudentsAttendingWidget extends StatelessWidget {
  const StudentsAttendingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
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
          Text(
            getAppLocalizations(context)!.studentsAttending,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontSize: 20.sp,
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          CircleAvatar(
            backgroundColor: Colors.black,
            radius: 35.w,
            child: const Text(
              '150',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
