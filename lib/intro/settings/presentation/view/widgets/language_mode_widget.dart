import 'package:attendo/core/app_images.dart';
import 'package:attendo/core/helpers/common.dart';
import 'package:attendo/core/helpers/preference_helper.dart';
import 'package:attendo/core/shared_cubit/attendo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LanguageModeWidget extends StatelessWidget {
  const LanguageModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppImages.languageIcon),
        const SizedBox(
          width: 5,
        ),
        Text(
          getAppLocalizations(context)!.language,
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
            ),
          ),
        ),
        const Spacer(),
        SizedBox(
          width: 130.w,
          height: 40.h,
          child: DropdownButtonFormField(
            icon: const Icon(Icons.keyboard_arrow_down),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  8,
                ),
                borderSide: const BorderSide(
                  color: Color(
                    0xffB1B3BB,
                  ),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  8,
                ),
                borderSide: const BorderSide(
                  color: Color(
                    0xffB1B3BB,
                  ),
                ),
              ),
            ),
            borderRadius: BorderRadius.circular(10),
            enableFeedback: true,
            hint: Text(language() ?? "English"),
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: const Color(0xff828282),
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
              ),
            ),
            items: const [
              DropdownMenuItem(
                value: "en",
                child: Text(
                  "English",
                ),
              ),
              DropdownMenuItem(
                value: "ar",
                child: Text(
                  "اللغة العربية",
                ),
              ),
            ],
            onChanged: (value) {
              context.read<AttendoCubit>().switchLanguage(value!);
            },
          ),
        ),
      ],
    );
  }

  String? language() {
    var code = UserLanguageService.getPreferredLanguage;
    Map<String, String> languageCode = {
      'en': "English",
      'ar': "اللغة العربية",
    };
    return languageCode[code];
  }
}
