import 'package:attendo/core/utils/font_adapter.dart';
import 'package:attendo/intro/student/features/auth/sign_up/presentation/view/widgets/user_info_item.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 64.h,),
        Image.asset(
          "assets/images/avatar_pic.png",
        ),
        SizedBox(
          height: 16.h,
        ),
        ElevatedButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(
              Size(
                141.w,
                52.h,
              ),
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
                  15.w,
                ),
              ),
            ),
            padding: MaterialStateProperty.all(EdgeInsets.zero)
          ),
          
          onPressed: () {},
          child: Text(
            "Change Photo",
            style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 20.sp,),
          ),
        ),
        SizedBox(
          height: 24.h,
        ),
        const UserInfoItem(fieldName: 'Name', fieldDetail: "Ahmed Ali Khaled",),
        const UserInfoItem(fieldName: 'Phone', fieldDetail: "01000000000",),
        const UserInfoItem(fieldName: 'Email', fieldDetail: "Someone@yahoo.com",),
      ],
    );
  }

}

