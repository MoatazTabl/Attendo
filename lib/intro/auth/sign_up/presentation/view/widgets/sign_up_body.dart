import 'package:attendo/core/app_images.dart';
import 'package:attendo/core/helpers/common.dart';
import 'package:attendo/core/widgets/custom_drop_down_button.dart';
import 'package:attendo/core/widgets/custom_form_elevated_button.dart';
import 'package:attendo/core/widgets/text_form_field.dart';
import 'package:attendo/intro/auth/auth_cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key, required this.state});

  final UserState state;

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Form(
            autovalidateMode: context.read<UserCubit>().autoValidateMode,
            key: context.read<UserCubit>().formKey,
            child: AutofillGroup(
              child: Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    getAppLocalizations(context)!.signUp,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  CircleAvatar(
                    radius: 45.sp,
                    backgroundImage: const AssetImage(AppImages.addAvatarImage),
                  ),
                  SizedBox(
                    height: 7.h,
                  ),
                  CustomTextFormField(
                    isPass: false,
                    prefixIcon: SvgPicture.asset(AppImages.nameIcon),
                    controller: context.read<UserCubit>().signUpName,
                    textInputType: TextInputType.name,
                    autofillHints: const [AutofillHints.name],
                    textFieldLabel: getAppLocalizations(context)!.firstName,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextFormField(
                    controller: context.read<UserCubit>().signUpLastName,
                    prefixIcon: SvgPicture.asset(AppImages.nameIcon),
                    isPass: false,
                    textInputType: TextInputType.name,
                    autofillHints: const [AutofillHints.familyName],
                    textFieldLabel: getAppLocalizations(context)!.lastName,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextFormField(
                    isPass: false,
                    controller: context.read<UserCubit>().signUpNationalId,
                    prefixIcon: SvgPicture.asset(
                      AppImages.nationalIdIcon,
                      height: 22,
                      width: 22,
                    ),
                    textInputType: TextInputType.number,
                    textFieldLabel: getAppLocalizations(context)!.nationalID,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextFormField(
                    isPass: false,
                    prefixIcon: SvgPicture.asset(AppImages.emailIcon),
                    onChanged: (value) {
                      setState(() {
                        if (value.contains("@stu")) {
                          context.read<UserCubit>().isStudent = true;
                        } else {
                          context.read<UserCubit>().isStudent = false;
                        }
                      });
                    },
                    controller: context.read<UserCubit>().signUpEmail,
                    textInputType: TextInputType.emailAddress,
                    autofillHints: const [AutofillHints.email],
                    textFieldLabel:
                        getAppLocalizations(context)!.universityEmail,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextFormField(
                    isPass: true,
                    prefixIcon: SvgPicture.asset(AppImages.passwordIcon),
                    controller: context.read<UserCubit>().signUpPassword,
                    autofillHints: const [AutofillHints.newPassword],
                    textFieldLabel: getAppLocalizations(context)!.password,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextFormField(
                    isPass: true,
                    prefixIcon: SvgPicture.asset(AppImages.passwordIcon),
                    controller: context.read<UserCubit>().confirmPassword,
                    passwordFieldController:
                        context.read<UserCubit>().signUpPassword,
                    autofillHints: const [AutofillHints.newPassword],
                    textFieldLabel:
                        getAppLocalizations(context)!.reEnterPassword,
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  Visibility(
                    visible: context.read<UserCubit>().isStudent,
                    child: CustomFormDropDownButton(
                      type: "faculty",
                      fieldHint: getAppLocalizations(context)!.selectFaculty,
                      list: const ["Computers", "Commerce"],
                      onValueChanged: (selectedValue) {
                        context.read<UserCubit>().signUpFaculty =
                            selectedValue!;
                      },
                    ),
                  ),
                  Visibility(
                    visible: context.read<UserCubit>().isStudent,
                    child: CustomFormDropDownButton(
                      type: "grade",
                      fieldHint: getAppLocalizations(context)!.selectGrade,
                      list: const ["First", "Second", "Third", "Fourth"],
                      onValueChanged: (selectedValue) {
                        context.read<UserCubit>().signUpGrade = selectedValue!;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 21.h,
                  ),
                  widget.state is SignUpLoading
                      ? const CircularProgressIndicator()
                      : CustomFormElevatedButton(
                          onPressed: () async {
                            if (context
                                .read<UserCubit>()
                                .formKey
                                .currentState!
                                .validate()) {
                              setState(() {});
                              context.read<UserCubit>().signUp();
                            } else {
                              context.read<UserCubit>().autoValidateMode =
                                  AutovalidateMode.always;
                              setState(() {});
                            }
                          },
                          title: getAppLocalizations(context)!.signUp,
                        ),
                  SizedBox(
                    height: 21.h,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
