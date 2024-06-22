import 'package:attendo/intro/admin/features/all_students_screen/view_model/model/AllStudentsModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../view_model/modify_students_cubit.dart';

class CustomUpdateButton extends StatelessWidget {
  const CustomUpdateButton({super.key, required this.studentDetails});

 final AllStudentsModel studentDetails;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: WidgetStateProperty.all(
          Size(240.w, 56.h),
        ),
        backgroundColor: WidgetStateProperty.all(
          const Color(
            0xff0066FF,
          ),
        ),
        foregroundColor:
        WidgetStateProperty.all(Colors.white),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      onPressed: () {
        context
            .read<ModifyStudentsCubit>()
            .modifyStudent(studentDetails);
      },
      child: Text(
        "Update Information",
        style: Theme.of(context)
            .textTheme
            .labelLarge!
            .copyWith(
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
