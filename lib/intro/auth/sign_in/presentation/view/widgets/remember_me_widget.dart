import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/helpers/common.dart';

class RememberMeWidget extends StatefulWidget {
  const RememberMeWidget({super.key});

  @override
  State<RememberMeWidget> createState() => _RememberMeWidgetState();
}

class _RememberMeWidgetState extends State<RememberMeWidget> {

  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.w),
          ),
          side: const BorderSide(
              color: Color(
                0xff3746CC,
              ),
              width: 2),
          value: rememberMe,
          onChanged: (value) {
            rememberMe = !rememberMe;
            setState(() {});
          },
          activeColor: const Color(0xff3746CC),
        ),
        Text(
          getAppLocalizations(context)!.rememberMe,
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              fontSize: 12.sp,
            ),
          ),
        ),
      ],
    );
  }
}
