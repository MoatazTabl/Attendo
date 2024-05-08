import 'package:attendo/core/app_constants.dart';
import 'package:attendo/core/helpers/preference_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'attendo_state.dart';

class AttendoCubit extends Cubit<AttendoState> {
  AttendoCubit() : super(AttendoEnglishLocale());

  void switchLanguage(String localeName) async {
    await UserLanguageService.setPreferredLanguage(localeName);
    switch (localeName) {
      case AppConstants.englishLanguageCode:
        emit(AttendoEnglishLocale());
        break;
      case AppConstants.arabicLanguageCode:
        emit(AttendoArabicLocale());
        break;
      default:
        emit(AttendoEnglishLocale());
    }
  }
}
