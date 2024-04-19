import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/app_images.dart';

class AttendentSrudentItem extends StatelessWidget {
  const AttendentSrudentItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        AppImages.studentAvatarTest,
        width: 60.w,
      ),
      title: const Text('Omar Ahmed',style: TextStyle(color: Colors.black),),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "11:00 AM",
            style: Theme.of(context).textTheme.titleSmall!,
          ),
          Text(
            "ID:30201",
            style: Theme.of(context).textTheme.titleSmall!,
          )
        ],
      ),
      trailing: const CircleAvatar(
        backgroundColor: Colors.transparent,
        backgroundImage:AssetImage(AppImages.attendanceSuccessCheck) ,
      ),
    );
  }
}
