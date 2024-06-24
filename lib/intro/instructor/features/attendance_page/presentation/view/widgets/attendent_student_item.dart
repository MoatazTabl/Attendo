import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../core/app_images.dart';

class AttendanceStudentItem extends StatelessWidget {
  final String studentName;

  final String nationalId;

  final String authorizationTime;

  const AttendanceStudentItem(
      {super.key,
      required this.studentName,
      required this.nationalId,
      required this.authorizationTime});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(
        AppImages.studentAvatarTest,
        width: 50.w,
      ),
      title: Text(
        studentName,
        style: const TextStyle(color: Colors.black),
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
              "ID:$nationalId",
              style:
                Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 12),
          )
        ],
      ),
      trailing: Text(authorizationTime)
    );
  }
}
