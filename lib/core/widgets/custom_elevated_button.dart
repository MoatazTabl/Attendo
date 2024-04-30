import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../helpers/common.dart';

class CustomElevatedButton extends StatelessWidget {
  void Function()? onPressed;
  final String title;

  CustomElevatedButton(
      {super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(
          Size(240.w, 56.h),
        ),
        backgroundColor: MaterialStateProperty.all(
          const Color(
            0xff3746CC,
          ),
        ),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.w),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title == "Log In"
            ? getAppLocalizations(context)!.logIn
            : getAppLocalizations(context)!.signUp,
        style:
            Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 16.sp),
      ),
    );
  }
}
