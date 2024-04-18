import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../../../core/app_images.dart';

class InstructorLectureDetails extends StatelessWidget {
  const InstructorLectureDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              AppImages.backgroundImageStudent,
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
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(
                        fontSize: 30.sp,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h,),
                Card(
                  color: Colors.white,
                  child: QrImageView(
                    data: "OOP Lecure",
                    version: 2,
                    size: 200,
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
