import 'package:attendo/intro/auth/models/user_data_model.dart';
import 'package:attendo/intro/instructor/features/home/logic/home_instructor_cubit.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget({
    super.key,
    required this.userData,
  });

  final UserDataModel userData;

  @override
  Widget build(BuildContext context) {
    return DatePicker(
      DateTime.now(),
      initialSelectedDate: DateTime.now(),
      selectionColor: Colors.white,
      selectedTextColor: const Color(0xff71a8ef),
      height: 110.h,
      daysCount: 60,
      dateTextStyle: TextStyle(fontSize: 15.sp),
      monthTextStyle: TextStyle(fontSize: 16.sp),
      dayTextStyle: TextStyle(fontSize: 15.sp),
      deactivatedColor: Colors.white,
      onDateChange: (date) {
        context.read<HomeInstructorCubit>().getInstructorLectures(data: {
          "instructor": userData.name,
          "date": date.toIso8601String().split(".")[0]
        });
          context.read<HomeInstructorCubit>().dateTime = date;

      },
    );
  }
}
