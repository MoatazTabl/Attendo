import 'package:attendo/core/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLanguageService {
  static late SharedPreferences _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static String get getPreferredLanguage {
    return _sharedPreferences.getString(AppConstants.preferredLanguageKey) ??
        AppConstants.englishLanguageCode;
  }

  static Future<void> setPreferredLanguage(String selectedLanguage) async {
    await _sharedPreferences.setString(
        AppConstants.preferredLanguageKey, selectedLanguage);
  }
}
