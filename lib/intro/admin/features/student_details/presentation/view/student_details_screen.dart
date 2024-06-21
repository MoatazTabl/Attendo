import 'package:attendo/intro/admin/features/all_students_screen/view_model/model/AllStudentsModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/app_images.dart';
import '../../../../../../core/helpers/common.dart';
import '../../../../../../core/networking/api_strings.dart';
import '../../../../../../core/widgets/custom_drop_down_button.dart';
import '../../../../../../core/widgets/custom_form_elevated_button.dart';
import '../../../../../../core/widgets/text_form_field.dart';

class StudentDetailsScreen extends StatelessWidget {
  AllStudentsModel studentDetails;

  StudentDetailsScreen({super.key, required this.studentDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 52.h,
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(
                    "${ApiStrings.baseUrl}${studentDetails.photo}"),
                radius: 75,
              ),
              SizedBox(
                height: 32.h,
              ),
              Text(
                studentDetails.name!,
                style: TextStyle(color: Colors.black, fontSize: 20.sp),
              ),
              SizedBox(
                height: 32.h,
              ),
              CustomTextFormField(
                hintText: studentDetails.name,
                isPass: false,
                prefixIcon: SvgPicture.asset(AppImages.nameIcon),
                textInputType: TextInputType.name,
                autofillHints: const [AutofillHints.name],
                textFieldLabel: getAppLocalizations(context)!.firstName,
              ),
              SizedBox(
                height: 28.h,
              ),
              CustomTextFormField(
                hintText: studentDetails.email,
                isPass: false,
                prefixIcon: SvgPicture.asset(AppImages.emailIcon),
                onChanged: (value) {},
                textInputType: TextInputType.emailAddress,
                autofillHints: const [AutofillHints.email],
                textFieldLabel: getAppLocalizations(context)!.universityEmail,
              ),
              SizedBox(
                height: 28.h,
              ),
              CustomTextFormField(
                hintText: studentDetails.nationalId,
                isPass: false,
                prefixIcon: SvgPicture.asset(
                  AppImages.nationalIdIcon,
                  height: 22,
                  width: 22,
                ),
                textInputType: TextInputType.number,
                textFieldLabel: getAppLocalizations(context)!.nationalID,
              ),
              SizedBox(
                height: 28.h,
              ),
              CustomFormDropDownButton(
                initialValue: studentDetails.faculty,
                type: "faculty",
                fieldHint: getAppLocalizations(context)!.selectFaculty,
                list: const ["Computers", "Commerce"],
                onValueChanged: (selectedValue) {},
              ),
              CustomFormDropDownButton(
                initialValue: studentDetails.grade!,
                type: studentDetails.grade!,
                fieldHint: getAppLocalizations(context)!.selectGrade,
                list: const ["First", "Second", "Third", "Fourth"],
                onValueChanged: (selectedValue) {},
              ),
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: WidgetStateProperty.all(
                    Size(240.w, 56.h),
                  ),
                  backgroundColor: WidgetStateProperty.all(
                    const Color(
                      0xff0066FF,
                    ),
                  ),
                  foregroundColor: WidgetStateProperty.all(Colors.white),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Update Information",
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontSize: 16.sp,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
