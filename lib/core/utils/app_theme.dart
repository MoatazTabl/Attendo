import 'package:attendo/core/utils/text_theme.dart';
import 'package:flutter/material.dart';

final ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  textTheme: textTheme,
  primaryColor: const Color(0xff3b47c7),
  textSelectionTheme:
      const TextSelectionThemeData(cursorColor: Color(0xff3b47c7)),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: Color(0xff3b47c7),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(const Color(0xff3746CC)),
      foregroundColor: MaterialStateProperty.all(Colors.white),
      shadowColor: MaterialStateProperty.all(
        const Color(
          0xff707070,
        ),
      ),
      elevation: MaterialStateProperty.all(
        5,
      ),
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.transparent,
    type: BottomNavigationBarType.fixed,
    elevation: 0,
    selectedItemColor: Color(0xff001076),
    enableFeedback: true,
  ),
);
