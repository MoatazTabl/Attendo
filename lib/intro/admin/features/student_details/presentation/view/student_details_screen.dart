import 'package:attendo/core/widgets/custom_snack_bar.dart';
import 'package:attendo/intro/admin/features/all_students_screen/view_model/model/AllStudentsModel.dart';
import 'package:attendo/intro/admin/features/student_details/presentation/view_model/modify_students_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../core/app_images.dart';
import '../../../../../../core/helpers/common.dart';
import '../../../../../../core/networking/api_strings.dart';
import '../../../../../../core/widgets/custom_drop_down_button.dart';
import '../../../../../../core/widgets/text_form_field.dart';

class StudentDetailsScreen extends StatelessWidget {
  final AllStudentsModel studentDetails;

  const StudentDetailsScreen({super.key, required this.studentDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: BlocConsumer<ModifyStudentsCubit, ModifyStudentsState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is ModifyStudentsSuccess) {
              GlobalSnackBar.show(context, "Account Updated Successfully");
              context.pop();
            } else if (state is ModifyStudentsFailure) {
              GlobalSnackBar.show(context, state.errMessage);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
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
                    onChanged: (p0) {
                      studentDetails.name = p0;
                    },
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
                    onChanged: (value) {
                      studentDetails.email = value;
                    },
                    textInputType: TextInputType.emailAddress,
                    autofillHints: const [AutofillHints.email],
                    textFieldLabel:
                        getAppLocalizations(context)!.universityEmail,
                  ),
                  SizedBox(
                    height: 28.h,
                  ),
                  CustomTextFormField(
                    onChanged: (p0) {
                      studentDetails.nationalId = p0;
                    },
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
                    onValueChanged: (selectedValue) {
                      studentDetails.faculty = selectedValue;
                    },
                  ),
                  CustomFormDropDownButton(
                    initialValue: studentDetails.grade!,
                    type: studentDetails.grade!,
                    fieldHint: getAppLocalizations(context)!.selectGrade,
                    list: const ["First", "Second", "Third", "Fourth"],
                    onValueChanged: (selectedValue) {
                      studentDetails.grade = selectedValue;
                    },
                  ),
                  state is ModifyStudentsLoading
                      ? const Center(child: CircularProgressIndicator())
                      : Row(
                          children: [
                            IconButton(
                                onPressed: () {

                                },
                                icon: const Icon(Icons.delete)),
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
                                foregroundColor:
                                    WidgetStateProperty.all(Colors.white),
                                shape: WidgetStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                context
                                    .read<ModifyStudentsCubit>()
                                    .modifyStudent(studentDetails);
                              },
                              child: Text(
                                "Update Information",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                      fontSize: 16.sp,
                                    ),
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
