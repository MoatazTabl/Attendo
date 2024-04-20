import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/app_images.dart';

class AttendentStudentItem extends StatelessWidget {
  const AttendentStudentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        AppImages.studentAvatarTest,
        width: 60.w,
      ),
      title: const Text('Omar Ahmed', style: TextStyle(color: Colors.black),),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "11:00 AM",
            style: Theme
                .of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontSize:12),
          ),
          Text(
            "ID:30201",
            style: Theme
                .of(context)
                .textTheme
                .titleSmall!.copyWith(fontSize:12),
          )
        ],
      ),
      trailing: const CircleAvatar(
        backgroundColor: Colors.transparent,
        backgroundImage: AssetImage(AppImages.attendanceSuccessCheck),
      ),
    );
  }
}
