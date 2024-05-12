import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserInfoItem extends StatelessWidget {
  const UserInfoItem({
    super.key,
    required this.fieldName,
    required this.fieldDetail,
  });

  final String fieldName;
  final String fieldDetail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            fieldName,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Colors.black,
                  fontSize: 20.sp,
                ),
          ),
          SizedBox(
            width: 314.w,
            height: 54.h,
            child: TextField(
              decoration: InputDecoration(
                hintText: fieldDetail,
                hintStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Colors.black,
                      fontSize: 18.sp,
                    ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(
                    12.w,
                  ),
                ),
                enabled: false,

                fillColor: const Color(0xffF0F3FF),
                filled: true,
                contentPadding:  const EdgeInsets.symmetric(
                  horizontal: 10
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
