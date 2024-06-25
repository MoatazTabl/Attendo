part of 'attendo_cubit.dart';

@immutable
sealed class AttendoState {}

final class AttendoInitial extends AttendoState {}

final class AttendoThemeMode extends AttendoState {
  final ThemeData themeMode;

  AttendoThemeMode({required this.themeMode});
}

final class SelectedLocale extends AttendoState {
  final Locale locale;

  SelectedLocale(this.locale);
}

final class AttendoArabicLocale extends AttendoState {
  final String lanCode;

  AttendoArabicLocale({this.lanCode = "ar"});
}

final class AttendoEnglishLocale extends AttendoState {
  final String lanCode;

  AttendoEnglishLocale({this.lanCode = "en"});
}
