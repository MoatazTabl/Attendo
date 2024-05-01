import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({
    super.key,
  });

  @override
  State<DatePickerWidget> createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  DateTime? selectedDay;

  @override
  Widget build(BuildContext context) {
    return DatePicker(
      DateTime.now(),
      initialSelectedDate: DateTime.now(),
      selectionColor: Colors.white,
      selectedTextColor: const Color(0xff71a8ef),
      height: 135.h,
      daysCount: 100,
      deactivatedColor: Colors.white,
      onDateChange: (date) {
        setState(() {
          selectedDay = date;
        });
      },
    );
  }
}