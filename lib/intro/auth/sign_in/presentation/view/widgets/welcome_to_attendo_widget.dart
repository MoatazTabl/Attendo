import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/helpers/common.dart';

class WelcomeToAttendoWidget extends StatelessWidget {
  const WelcomeToAttendoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          getAppLocalizations(context)!.welcomeTo,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontSize: 35.sp,
              ),
        ),
        Text(
          getAppLocalizations(context)!.attendo,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: const Color(0xff3746CC),
                fontSize: 40.sp,
              ),
        ),
      ],
    );
  }
}
