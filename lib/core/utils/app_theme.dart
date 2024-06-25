import 'package:attendo/core/utils/text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static const Color mainBlue = Color(0xff0066FF);
  static const Color filledWhite = Color(0xfff6f9ff);
  static const Color boxStrokeColor = Color(0xffEAECF0);
  static final ThemeData lightMode = ThemeData(
      brightness: Brightness.light,
      textTheme: textTheme,
      scaffoldBackgroundColor: filledWhite,
      colorScheme: ColorScheme.fromSeed(seedColor: mainBlue),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(mainBlue),
          foregroundColor: WidgetStateProperty.all(Colors.white),
          // shadowColor: WidgetStateProperty.all(
          //   const Color(
          //     0xff707070,
          //   ),
          // ),
          // elevation: WidgetStateProperty.all(
          //   5,
          // ),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedItemColor: Color(0xff001076),
        enableFeedback: true,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50)),
        ),
        dragHandleColor: Color(0xff5F5F5F),
        dragHandleSize: Size.fromRadius(6),
      ),
      dialogBackgroundColor: Colors.white);
  static final ThemeData darkMode = ThemeData(
      brightness: Brightness.dark,
      textTheme: textTheme,
      scaffoldBackgroundColor: filledWhite,
      colorScheme: ColorScheme.fromSeed(seedColor: mainBlue),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(mainBlue),
          foregroundColor: WidgetStateProperty.all(Colors.white),
          // shadowColor: WidgetStateProperty.all(
          //   const Color(
          //     0xff707070,
          //   ),
          // ),
          // elevation: WidgetStateProperty.all(
          //   5,
          // ),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedItemColor: Color(0xff001076),
        enableFeedback: true,
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50)),
        ),
        dragHandleColor: Color(0xff5F5F5F),
        dragHandleSize: Size.fromRadius(6),
      ),
      dialogBackgroundColor: Colors.white);
}
