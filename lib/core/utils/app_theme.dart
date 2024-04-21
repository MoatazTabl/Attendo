import 'package:attendo/core/utils/text_theme.dart';
import 'package:flutter/material.dart';

final ThemeData lightMode = ThemeData(
  textTheme: textTheme,
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
);
