import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../auth_cubit/user_cubit.dart';

class CustomFormDropDownButton extends StatefulWidget {
   CustomFormDropDownButton({super.key,required this.fieldHint,required this.list});


  String fieldHint;
   List<DropdownMenuItem<String>> list ;

  @override
  State<CustomFormDropDownButton> createState() => _CustomFormDropDownButtonState();
}

class _CustomFormDropDownButtonState extends State<CustomFormDropDownButton> {

  late String dropdownValue ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 8.h),
      child: DropdownButtonFormField<String>(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please select your faculty";
          }
          return null; // Return null if validation succeeds
        },
        style: const TextStyle(
            color: Colors.black, fontSize: 18),
        iconSize: 24,
        elevation: 16,
        icon: const Icon(Icons.arrow_downward_sharp),
        value: null,
        hint:  Text(widget.fieldHint),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color(0xfff0f3ff),
          enabled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.w),
              borderSide: BorderSide.none),),
        autovalidateMode:
        context.read<UserCubit>().autoValidateMode,
        items: <String>[
          "Computer",
          "Commerce"
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            dropdownValue = value!;
          });
        },
      ),
    );
  }
}
