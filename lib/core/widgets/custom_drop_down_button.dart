import 'package:attendo/core/app_images.dart';
import 'package:attendo/core/utils/app_theme.dart';
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
      padding: EdgeInsets.only(left: 8.w, right: 8.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.fieldHint,
            style: const TextStyle(color: Color(0xffA2A2A7), fontSize: 14),
          ),
          SizedBox(
            height: 79.h,
            width: 339.w,
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
                width: 12,
                height: 12,
              ),
              value: widget.initialValue,
              borderRadius: BorderRadius.circular(16),
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 7.w),
                  child: SvgPicture.asset(
                    AppImages.dropDownIcon,
                  ),
                ),
                prefixIconConstraints:
                    const BoxConstraints(maxWidth: 22, maxHeight: 22),
                prefixText: "  ",
                fillColor: const Color(0xfff0f3ff),
                enabled: true,
                border: const UnderlineInputBorder(
                    borderSide: BorderSide(color: AppTheme.boxStrokeColor)),
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
        ],
      ),
    );
  }
}
