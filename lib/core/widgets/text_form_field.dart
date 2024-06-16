import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;

  final bool isPass;

  final Widget? prefixIcon;

  final TextEditingController? controller;

  final void Function(String)? onChanged;

  final TextEditingController? passwordFieldController;
  final TextInputType? textInputType;
  final Iterable<String>? autofillHints;

  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.isPass,
      this.prefixIcon,
      this.controller,
      this.onChanged,
      this.passwordFieldController,
      this.textInputType,
      this.autofillHints});

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return "*Field is required*";
          } else if (widget.hintText == "ID") {
            final bool idValid = RegExp(r"^[0-9]+$").hasMatch(value);
            if (!idValid) {
              return "Please,enter a valid ID number";
            }
          } else if (widget.hintText == "University Email" ||
              widget.hintText == "Email or ID") {
            final bool emailValid =
                RegExp(r'@(stu|prof)\.com$').hasMatch(value);
            if (!emailValid) {
              return "Please,enter a valid Email ";
            }
          } else if (widget.isPass && widget.hintText == "Re-Enter Password" ||
              widget.isPass && widget.hintText == "إعادة إدخال كلمة المرور") {
            if (value != widget.passwordFieldController!.text) {
              return "Passwords do not match";
            }
          }
          return null;
        },
        onChanged: widget.onChanged,
        controller: widget.controller,
        obscureText: widget.isPass ? obscure : false,
        enabled: true,
        keyboardType: widget.textInputType,
        autofillHints: widget.autofillHints,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          suffixIcon: widget.isPass
              ? IconButton(
                  onPressed: () {
                    obscure = !obscure;
                  },
                  icon: SvgPicture.asset(
                    "assets/images/svg/obscure_icon.svg",
                    colorFilter: ColorFilter.mode(
                      obscure ? Colors.black : const Color(0xff3746CC),
                      BlendMode.srcIn,
                    ),
                  ),
                )
              : null,

          prefixIcon: widget.prefixIcon,
          prefixText: "  ",
          prefixIconConstraints: const BoxConstraints(
            maxHeight: 22,
            maxWidth: 22,
          ),

          // hintText: widget.hintText,
          hintStyle:
              Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 18.sp),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Color(
                0xffA0A0A0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
