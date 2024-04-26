import 'package:attendo/core/app_constants.dart';
import 'package:attendo/core/helpers/preference_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'attendo_state.dart';

enum SupportedLanguages {
  english,
  arabic,
}

class AttendoCubit extends Cubit<AttendoState> {

  AttendoCubit()
      : super(AttendoEnglishLocale());

  void switchLanguage(String localeName) async {
    await UserLanguageService.setPreferredLanguage(localeName);
    switch (localeName) {
      case AppConstants.englishLanguageCode:
        emit(AttendoEnglishLocale());
        break;
      case AppConstants.arabicLanguageCode:
        emit(AttendoArabicLocale());
      default:
        emit(AttendoEnglishLocale());
    }
  }
  }


