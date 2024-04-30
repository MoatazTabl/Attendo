
// ignore: dangling_library_doc_comments
/// This class consists of the DateWidget that is used in the ListView.builder

import 'package:date_picker_timeline/gestures/tap.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateWidget extends StatelessWidget {
  final double? width;
  final DateTime date;
  final TextStyle? monthTextStyle, dayTextStyle, dateTextStyle;
  final Color selectionColor;
  final DateSelectionCallback? onDateSelected;
  final String? locale;

  const DateWidget({Key? key,
    required this.date,
    required this.monthTextStyle,
    required this.dayTextStyle,
    required this.dateTextStyle,
    required this.selectionColor,
    this.width,
    this.onDateSelected,
    this.locale,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: width,
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            color: selectionColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(
                  0.4,
                ),
                blurStyle: BlurStyle.outer,
                spreadRadius: 1,
                blurRadius: 5,
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(DateFormat("MMM", locale).format(date).toUpperCase(),
                  // Month
                  style: monthTextStyle),
              Text(date.day.toString(), // Date
                  style: dateTextStyle),
              Text(DateFormat("E", locale).format(date).toUpperCase(),
                  // WeekDay
                  style: dayTextStyle)
            ],
          ),
        ),
      ),
      onTap: () {
        // Check if onDateSelected is not null
        if (onDateSelected != null) {
          // Call the onDateSelected Function
          onDateSelected!(date);
        }
      },
    );
  }
}
