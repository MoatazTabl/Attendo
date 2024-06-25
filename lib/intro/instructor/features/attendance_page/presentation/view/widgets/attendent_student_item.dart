import 'package:attendo/core/networking/api_strings.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AttendanceStudentItem extends StatelessWidget {
  const AttendanceStudentItem(
      {super.key,
      required this.studentName,
      required this.nationalId,
      required this.authorizationTime,
      required this.photo});

  final String studentName;

  final String nationalId;

  final String authorizationTime;

  final String photo;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: SizedBox(
          height: 55.h,
          width: 55.h,
          child: CachedNetworkImage(
            imageUrl: "${ApiStrings.baseUrl}$photo",
            imageBuilder: (context, image) {
              return CircleAvatar(
                radius: 38.r,
                backgroundImage: image,
              );
            },
          ),
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
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(fontSize: 12),
            )
          ],
        ),
        trailing: Text(authorizationTime));
  }
}
