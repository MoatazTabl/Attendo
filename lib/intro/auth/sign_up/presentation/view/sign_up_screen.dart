import 'package:attendo/core/app_images.dart';
import 'package:attendo/core/helpers/common.dart';
import 'package:attendo/core/widgets/custom_drop_down_button.dart';
import 'package:attendo/core/widgets/custom_snack_bar.dart';
import 'package:attendo/core/widgets/text_form_field.dart';
import 'package:attendo/intro/auth/auth_cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/custom_form_elevated_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          if (state is SignUpSuccess) {
            GlobalSnackBar.show(context,
                getAppLocalizations(context)!.emailCreatedSuccessfully);
            context.pop();
            context.read<UserCubit>().clearSignUpFields();
          } else if (state is SignUpFailure) {
            GlobalSnackBar.show(context, state.errMessage);
          }
        },
        builder: (context, state) {
          return Container(
            width: 1.sw,
            height: 1.sh,
            decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                image: AssetImage(AppImages.backgroundImage),
                fit: BoxFit.fill,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Form(
                      autovalidateMode:
                          context.read<UserCubit>().autoValidateMode,
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
                              backgroundImage:
                                  const AssetImage(AppImages.addAvatarImage),
                            ),
                            SizedBox(
                              height: 7.h,
                            ),
                            CustomTextFormField(
                              hintText: getAppLocalizations(context)!.firstName,
                              isPass: false,
                              controller: context.read<UserCubit>().signUpName,
                              textInputType: TextInputType.name,
                              autofillHints: const [AutofillHints.name],
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            CustomTextFormField(
                              controller:
                                  context.read<UserCubit>().signUpLastName,
                              hintText: getAppLocalizations(context)!.lastName,
                              isPass: false,
                              textInputType: TextInputType.name,
                              autofillHints: const [AutofillHints.familyName],
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            CustomTextFormField(
                              hintText: getAppLocalizations(context)!.iD,
                              isPass: false,
                              controller:
                                  context.read<UserCubit>().signUpNationalId,
                              textInputType: TextInputType.number,
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            CustomTextFormField(
                              hintText:
                                  getAppLocalizations(context)!.universityEmail,
                              isPass: false,
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
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            CustomTextFormField(
                              hintText: getAppLocalizations(context)!.password,
                              isPass: true,
                              controller:
                                  context.read<UserCubit>().signUpPassword,
                              autofillHints: const [AutofillHints.newPassword],
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            CustomTextFormField(
                              hintText:
                                  getAppLocalizations(context)!.reEnterPassword,
                              isPass: true,
                              controller:
                                  context.read<UserCubit>().confirmPassword,
                              passwordFieldController:
                                  context.read<UserCubit>().signUpPassword,
                              autofillHints: const [AutofillHints.newPassword],
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Visibility(
                              visible: context.read<UserCubit>().isStudent,
                              child: CustomFormDropDownButton(
                                type: "faculty",
                                fieldHint: "Select faculty",
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
                                fieldHint: "Select grade",
                                list: const [
                                  "First",
                                  "Second",
                                  "Third",
                                  "Fourth"
                                ],
                                onValueChanged: (selectedValue) {
                                  context.read<UserCubit>().signUpGrade =
                                      selectedValue!;
                                },
                              ),
                            ),
                            SizedBox(
                              height: 21.h,
                            ),
                            state is SignUpLoading
                                ? const CircularProgressIndicator()
                                : CustomFormElevatedButton(
                                    onPressed: () async{
                                           if (context
                                               .read<UserCubit>()
                                               .formKey
                                               .currentState!
                                               .validate()) {
                                             setState(() {});
                                             context.read<UserCubit>().signUp();
                                           } else {
                                             context
                                                 .read<UserCubit>()
                                                 .autoValidateMode =
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
              ),
            ),
          );
        },
      ),
    );
  }
}
