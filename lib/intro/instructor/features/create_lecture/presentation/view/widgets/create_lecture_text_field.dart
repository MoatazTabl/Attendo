import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateLecturesTextField extends StatelessWidget {
  const CreateLecturesTextField({
    super.key,
    required this.hintText,
    this.suffix,
    this.suffixIcon,
    required this.textEditingController,
    required this.enabled,
    required this.validator,
  });

  final String hintText;
  final Widget? suffix;
  final Widget? suffixIcon;
  final TextEditingController textEditingController;
  final bool enabled;
  final String? Function(String? value) validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 5.h),
      child: TextFormField(
        validator: validator,
        controller: textEditingController,
        enabled: enabled,
        style: GoogleFonts.poppins(
          fontSize: 16.sp,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          suffix: suffix,
          hintText: hintText,
          suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 5), child: suffixIcon),
          suffixIconConstraints:
              const BoxConstraints(maxHeight: 25, maxWidth: 25),
          hintStyle: GoogleFonts.poppins(
            fontSize: 15.sp,
            color: Colors.black,
            fontWeight: FontWeight.w300,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              12.w,
            ),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: const Color(
            0xffe8e7e7,
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
