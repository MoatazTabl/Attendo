import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';

AppLocalizations? getAppLocalizations(BuildContext context) {
  return AppLocalizations.of(context);
}

String? validator(String? value) {
  if (value == null || value.isEmpty) {
    return "Field Cannot be empty";
  }

  return null;
}

String? from24to12(String? dateTime) {
  var dateFormat = DateFormat.jm().format(DateTime.parse(dateTime ?? ""));
  return dateFormat;
}

String? from12to24(String? dateTime) {
  var dateFormat = DateFormat("yyyy-MM-dd hh:mm a").parse(dateTime!);

  return dateFormat.toIso8601String();
}