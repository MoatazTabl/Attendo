import 'package:attendo/core/utils/font_adapter.dart';
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
                  fontSize: FontAdaption().getResponsiveFontSize(
                    context,
                    fontSize: 20,
                  ),
                ),
          ),
          SizedBox(
            width: 220.w,
            height: 54.h,
            child: TextField(
              decoration: InputDecoration(
                hintText: fieldDetail,
                hintStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                      color: Colors.black,
                      fontSize: FontAdaption().getResponsiveFontSize(
                        context,
                        fontSize: 18,
                      ),
                    ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(
                    12.w,
                  ),
                ),
                fillColor: const Color(0xffF0F3FF),
                filled: true,
                contentPadding: const EdgeInsets.only(left: 10),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(
                Size(
                  75.w,
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
            ),
            child: Text(
              "Edit",
              style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: FontAdaption().getResponsiveFontSize(context, fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }
}
