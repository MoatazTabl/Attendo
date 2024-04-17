import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/font_adapter.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;

  final bool isPass;

  final IconData? prefixIcon;

  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.isPass,
      this.prefixIcon});

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
          obscureText: widget.isPass ? obscure : false,
          enabled: true,
          decoration: InputDecoration(
            suffixIcon: widget.isPass
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: obscure ? Colors.black : const Color(0xff3746CC),
                    ),
                  )
                : const SizedBox(),
            prefixIcon: Icon(widget.prefixIcon,color: Colors.black,),
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
