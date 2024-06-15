import 'package:attendo/core/helpers/common.dart';
import 'package:attendo/core/helpers/preference_helper.dart';
import 'package:attendo/core/shared_cubit/attendo_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool themeMode = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 14.w, right: 17.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                getAppLocalizations(context)!.light,
                style: GoogleFonts.roboto(
                  textStyle: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 26.sp,
                    ),
                  ),
                ),
              ),
              Switch(
                value: themeMode,
                onChanged: (value) {
                  themeMode = !themeMode;
                  setState(() {});
                },
                trackOutlineColor: WidgetStateProperty.all(Colors.black54),
                activeColor: const Color(0xff3746CC),
                inactiveThumbColor: const Color(0xff2403F1).withOpacity(.7),
              ),
              Text(
                getAppLocalizations(context)!.dark,
                style: GoogleFonts.roboto(
                  textStyle: GoogleFonts.roboto(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 26.sp)),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                getAppLocalizations(context)!.language,
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 26.sp,
                  ),
                ),
              ),
              DropdownButton(
                enableFeedback: true,
                borderRadius: BorderRadius.circular(16),
                hint: Text(language() ?? "English"),
                style: GoogleFonts.roboto(
                  textStyle: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 18.sp,
                    ),
                  ),
                ),
                dropdownColor: Colors.white70,
                elevation: 12,
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
            ],
          ),
        ),
        SizedBox(
          height: 70.h,
        ),
        ElevatedButton(
          onPressed: () {
            context.go("/");
          },
          style: ButtonStyle(
            fixedSize: WidgetStateProperty.all(
              Size(215.w, 56.h),
            ),
            backgroundColor: WidgetStateProperty.all(
              const Color(
                0xFFCC3741,
              ),
            ),
            foregroundColor: WidgetStateProperty.all(
              Colors.white,
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  18.w,
                ),
              ),
            ),
          ),
          child: Text(
            getAppLocalizations(context)!.logOut,
            style: GoogleFonts.roboto(
              textStyle: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
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
