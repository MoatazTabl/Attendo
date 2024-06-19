import 'package:attendo/core/utils/app_theme.dart';
import 'package:attendo/intro/settings/presentation/view/widgets/dark_mode_widget.dart';
import 'package:attendo/intro/settings/presentation/view/widgets/language_mode_widget.dart';
import 'package:attendo/intro/settings/presentation/view/widgets/log_out_button.dart';
import 'package:attendo/intro/settings/presentation/view/widgets/settings_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 54.h,
        ),
        const SettingsTextWidget(),
        SizedBox(
          height: 88.h,
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            height: 170.h,
            width: 380.w,
            padding: const EdgeInsets.all(4),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  16,
                ),
                side: const BorderSide(color: AppTheme.boxStrokeColor),
              ),
              color: Colors.white,
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DarkModeWidget(),
                Divider(
                  color: Color(0xffeaecf0),
                ),
                LanguageModeWidget(),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 100.h,
        ),
        const LogOutButton(),
      ],
    );
  }
}
