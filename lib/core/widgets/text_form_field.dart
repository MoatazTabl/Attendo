import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/font_adapter.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;

  final bool isPass;
  final TextEditingController? controller;

  const CustomTextFormField(
      {super.key, required this.hintText, required this.isPass, required this.controller});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  void Function(String)? onChanged;
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w),
      child: SizedBox(
        height: 54.h,
        child: TextFormField(
          controller: widget.controller,
          obscureText: widget.isPass ? obscure : false,
          enabled: true,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: Theme.of(context).textTheme.labelSmall!.copyWith(
                fontSize: FontAdaption()
                    .getResponsiveFontSize(context, fontSize: 18)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.w),
                borderSide: BorderSide.none),
            filled: true,
            fillColor: const Color(0xfff0f3ff),
            contentPadding: const EdgeInsets.only(left: 10),
          ),
        ),
      ),
    );
  }
}
