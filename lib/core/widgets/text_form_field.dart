import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;

  final bool isPass;

  final IconData? prefixIcon;

  final TextEditingController? controller;

   void Function(String)? onChanged;

   CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.isPass,
      this.prefixIcon,this.controller,this.onChanged});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  void Function(String)? onChanged;
  bool obscure = true;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "*Field is required*";
          }else if(widget.hintText == "ID")
            {
              final bool idValid = RegExp(
                  r"^[0-9]+$")
                  .hasMatch(value);
              if (!idValid) {
                return "Please,enter a valid ID number";
              }
            }
          else if (widget.hintText == "University Email") {
            final bool emailValid = RegExp(r'@(stu|prof)\.com$')
                .hasMatch(value);
            if (!emailValid) {
              return "Please,enter a valid Email ";
            }
          }
        },
        onChanged: widget.onChanged,
        controller: widget.controller,
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
          prefixIcon: widget.prefixIcon == null
              ? null
              : Icon(
                  widget.prefixIcon,
                  color: Colors.black,
                ),
          hintText: widget.hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(fontSize: 18.sp),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.w),
              borderSide: BorderSide.none),
          filled: true,
          fillColor: const Color(0xfff0f3ff),
          contentPadding: const EdgeInsets.only(left: 10),
        ),
      ),
    );
  }
}
