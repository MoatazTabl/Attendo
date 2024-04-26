import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {
  static Future<bool> saveThemeMode({required bool? value}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setBool("darkMode", value ?? false);
  }

  static Future<bool?> getThemeMode() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool("darkMode");
  }

  static Future<Locale> setLocale(String langCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("languageCode", langCode);
    return locale(langCode);
  }

  static Locale locale(String languageCode) {
    Locale _temp;
    if (languageCode == 'ar') {
      _temp = const Locale('ar');
    } else {
      _temp = const Locale('en');
    }
    return _temp;
  }

  static Future<Locale> getLocale() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? code = prefs.getString("languageCode");

    return locale(code ?? "en");
  }
}
