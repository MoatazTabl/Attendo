import 'package:attendo/core/app_images.dart';
import 'package:attendo/core/helpers/common.dart';
import 'package:attendo/core/widgets/text_form_field.dart';
import 'package:attendo/intro/auth/auth_cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

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
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  "Your account has been created successfully",
                ),
              ),
            );
            context.pop();
            context.read<UserCubit>().clearSignUpFields();
          } else if (state is SignUpFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.errMessage,
                ),
              ),
            );
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
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          CustomTextFormField(
                            controller: context.read<UserCubit>().signUpLastName,
                            hintText: getAppLocalizations(context)!.lastName,
                            isPass: false,
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          CustomTextFormField(
                            hintText: getAppLocalizations(context)!.iD,
                            isPass: false,
                            controller:
                                context.read<UserCubit>().signUpNationalId,
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          CustomTextFormField(
                            hintText: getAppLocalizations(context)!.universityEmail,
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
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          CustomTextFormField(
                            hintText: getAppLocalizations(context)!.reEnterPassword,
                            isPass: true,
                            controller:
                                context.read<UserCubit>().confirmPassword,
                            passwordFieldController:
                                context.read<UserCubit>().signUpPassword,
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          Visibility(
                            visible: context.read<UserCubit>().isStudent,
                            child: CustomTextFormField(
                              hintText: getAppLocalizations(context)!.selectFaculty,
                              isPass: false,
                              controller:
                                  context.read<UserCubit>().signUpFaculty,
                            ),
                          ),
                          Visibility(
                            visible: context.read<UserCubit>().isStudent,
                            child: CustomTextFormField(
                              hintText: getAppLocalizations(context)!.selectGrade,
                              isPass: false,
                              controller: context.read<UserCubit>().signUpGrade,
                            ),
                          ),
                          Visibility(
                            visible: context.read<UserCubit>().isStudent,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                fixedSize: MaterialStateProperty.all(
                                  Size(215.w, 56.h),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                  const Color(
                                    0xff3746CC,
                                  ),
                                ),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(22.w),
                                  ),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.fingerprint,
                                    size: 42.h,
                                  ),
                                  Text(
                                    getAppLocalizations(context)!.scanFingerprint,
                                    style: GoogleFonts.roboto(
                                      textStyle: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 21.h,
                          ),
                          state is SignUpLoading
                              ? const CircularProgressIndicator()
                              : CustomFormElevatedButton(
                                  onPressed: () {
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
