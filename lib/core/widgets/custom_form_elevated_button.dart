import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helpers/common.dart';

class CustomFormElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;

  const CustomFormElevatedButton(
      {super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: WidgetStateProperty.all(
          Size(240.w, 56.h),
        ),
        backgroundColor: WidgetStateProperty.all(
          const Color(
            0xff0066FF,
          ),
        ),
        foregroundColor: WidgetStateProperty.all(Colors.white),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title == "Log In"
            ? getAppLocalizations(context)!.logIn
            : getAppLocalizations(context)!.signUp,
        style: Theme.of(context).textTheme.labelLarge!.copyWith(
              fontSize: 25.sp,
            ),
      ),
    );
  }
}
