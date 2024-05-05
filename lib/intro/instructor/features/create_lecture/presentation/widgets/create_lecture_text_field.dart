import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateLecturesTextField extends StatelessWidget {
  const CreateLecturesTextField({
    super.key,
    required this.hintText,
    this.suffix,
    this.suffixIcon,
    required this.textEditingController,
    required this.enabled,
  });

  final String hintText;
  final Widget? suffix;
  final Widget? suffixIcon;
  final TextEditingController textEditingController;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Field Cannot be empty";
          }
          return null;
        },
        controller: textEditingController,
        enabled: enabled,
        decoration: InputDecoration(
          suffix: suffix,
          hintText: hintText,
          suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 5), child: suffixIcon),
          suffixIconConstraints:
              const BoxConstraints(maxHeight: 25, maxWidth: 25),
          hintStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                fontSize: 18.sp,
              ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              12.w,
            ),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: const Color(
            0xfff0f3ff,
          ),
          contentPadding: const EdgeInsets.only(
            left: 10,
            right: 5,
          ),
        ),
      ),
    );
  }
}
