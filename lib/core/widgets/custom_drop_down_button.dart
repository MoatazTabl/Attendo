import 'package:attendo/core/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../intro/auth/auth_cubit/user_cubit.dart';

class CustomFormDropDownButton extends StatefulWidget {
  const CustomFormDropDownButton(
      {super.key,
      required this.fieldHint,
      required this.list,
      required this.onValueChanged,
      required this.type,
      this.initialValue});

  final String fieldHint;
  final List<String> list;
  final Function(String?) onValueChanged;
  final String type;
  final String? initialValue;

  @override
  State<CustomFormDropDownButton> createState() =>
      _CustomFormDropDownButtonState();
}

class _CustomFormDropDownButtonState extends State<CustomFormDropDownButton> {
  late String dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),
      child: SizedBox(
        height: 54.h,
        width: 360.w,
        child: DropdownButtonFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please select your ${widget.type}";
            }
            return null; // Return null if validation succeeds
          },
          style: const TextStyle(color: Colors.black, fontSize: 18),
          elevation: 12,
          icon: SvgPicture.asset(
            AppImages.arrowDownIcon,
            width: 10,
            height: 10,
          ),
          value: widget.initialValue,
          hint: Text(
            widget.fieldHint,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  fontSize: 18.sp,
                ),
          ),
          borderRadius: BorderRadius.circular(16),
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xfff0f3ff),
            enabled: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.w),
                borderSide: BorderSide.none),
          ),
          enableFeedback: true,
          padding: EdgeInsets.zero,
          autovalidateMode: context.read<UserCubit>().autoValidateMode,
          items: widget.list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              dropdownValue = value!;
              widget.onValueChanged(value);
            });
          },
        ),
      ),
    );
  }
}
