import 'package:attendo/intro/auth/auth_cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateLectureDropDownMenu extends StatefulWidget {
  const CreateLectureDropDownMenu(
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
  State<CreateLectureDropDownMenu> createState() =>
      _CreateLectureDropDownMenuState();
}

class _CreateLectureDropDownMenuState extends State<CreateLectureDropDownMenu> {
  late String dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 5.w),
      child: DropdownButtonFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please select your ${widget.type}";
          }
          return null; // Return null if validation succeeds
        },
        style: GoogleFonts.poppins(
          fontSize: 16.sp,
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        // elevation: 12,

        icon: const Visibility(
          visible: false,
          child: Icon(
            Icons.keyboard_arrow_down,
          ),
        ),
        alignment: Alignment.centerLeft,
        hint: Text(widget.fieldHint,
            style: GoogleFonts.poppins(
              fontSize: 15.sp,
              color: Colors.black,
              fontWeight: FontWeight.w300,
            )),
        value: widget.initialValue,
        borderRadius: BorderRadius.circular(16),
        decoration: InputDecoration(
            // prefixText: "  ",
            fillColor: const Color(0xffe8e7e7),
            // focusColor: const Color(0xffA29E9E),
            filled: true,
            enabled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                12,
              ),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.only(left: 12.w)),
        enableFeedback: true,

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
    );
  }
}
