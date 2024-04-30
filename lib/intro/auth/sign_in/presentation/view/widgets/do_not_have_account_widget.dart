import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/helpers/common.dart';

class DoNotHaveAccountWidget extends StatelessWidget {
  const DoNotHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          getAppLocalizations(context)!.dontHaveAccount,
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            context.push("/signUpScreen");
          },
          child: Text(
            getAppLocalizations(context)!.signUpNow,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(
                color: const Color(0xff3746CC),
                fontWeight: FontWeight.w900,
                fontSize: 20.sp),
          ),
        )
      ],
    );
  }
}
