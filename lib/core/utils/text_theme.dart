import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme textTheme = TextTheme(
  headlineLarge: GoogleFonts.roboto(
    textStyle:  const TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: 40,
    ),
  ),
  labelLarge: GoogleFonts.roboto(
    textStyle:  const TextStyle(
        fontSize: 25, fontWeight: FontWeight.w500, color: Colors.white),
  ),
  labelMedium: GoogleFonts.roboto(
    textStyle: const TextStyle(
        fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
  ),
  labelSmall: GoogleFonts.roboto(
    textStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w300,
        color: Colors.black.withOpacity(.37)),
  ),
);

