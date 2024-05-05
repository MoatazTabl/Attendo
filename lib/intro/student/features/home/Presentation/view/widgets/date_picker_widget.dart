import 'package:attendo/intro/auth/models/user_data_model.dart';
import 'package:attendo/intro/student/features/home/logic/home_cubit.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({
    super.key,
    required this.userData,
  });

  final UserDataModel userData;

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
      height: 110.h,
      daysCount: 100,
      dateTextStyle: TextStyle(fontSize: 15.sp),
      monthTextStyle: TextStyle(fontSize: 16.sp),
      dayTextStyle: TextStyle(fontSize: 15.sp),
      deactivatedColor: Colors.white,
      onDateChange: (date) {
        context.read<HomeCubit>().getStudentLectures(data: {
          "faculty": widget.userData.faculty,
          "grade": widget.userData.grade,
          "date": date.toIso8601String().split(".")[0]
        });
        setState(() {
          selectedDay = date;
        });
      },
    );
  }
}
