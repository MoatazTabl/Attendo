import 'package:attendo/core/app_images.dart';
import 'package:attendo/core/helpers/common.dart';
import 'package:attendo/core/utils/app_theme.dart';
import 'package:attendo/core/widgets/custom_form_elevated_button.dart';
import 'package:attendo/core/widgets/text_form_field.dart';
import 'package:attendo/intro/auth/auth_cubit/user_cubit.dart';
import 'package:attendo/intro/auth/sign_in/presentation/view/widgets/do_not_have_account_widget.dart';
import 'package:attendo/intro/auth/sign_in/presentation/view/widgets/welcome_to_attendo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({super.key, required this.state});

  final UserState state;

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: AutofillGroup(
            child: Form(
              autovalidateMode:
                  context.read<UserCubit>().autoValidateModeSignIn,
              key: context.read<UserCubit>().logInFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 56.h,
                  ),
                  Center(
                    child: SvgPicture.asset(
                      AppImages.welcomePageStudentImage,
                      width: 234.w,
                      height: 227.h,
                    ),
                  ),
                  // SizedBox(
                  //   height: 37.h,
                  // ),
                  const WelcomeToAttendoWidget(),
                  Container(
                    height: 415.h,
                    width: 351.w,
                    margin:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 12.w),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppTheme.boxStrokeColor,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 17.h,
                        ),
                        CustomTextFormField(
                          controller: context.read<UserCubit>().logInEmail,
                          isPass: false,
                          prefixIcon: SvgPicture.asset(
                            AppImages.emailIcon,
                            width: 22,
                            height: 22,
                            fit: BoxFit.fill,
                          ),
                          textInputType: TextInputType.emailAddress,
                          autofillHints: const [AutofillHints.email],
                          textFieldLabel:
                              getAppLocalizations(context)!.signInEmail,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        CustomTextFormField(
                          controller: context.read<UserCubit>().logInPassword,
                          isPass: true,
                          prefixIcon: SvgPicture.asset(
                            AppImages.passwordIcon,
                            width: 22,
                            height: 22,
                            fit: BoxFit.contain,
                          ),
                          autofillHints: const [AutofillHints.password],
                          textFieldLabel:
                              getAppLocalizations(context)!.password,
                        ),
                        SizedBox(
                          height: 64.h,
                        ),
                        widget.state is LoginLoading
                            ? const CircularProgressIndicator()
                            : CustomFormElevatedButton(
                                onPressed: () async {
                                  if (context
                                      .read<UserCubit>()
                                      .logInFormKey
                                      .currentState!
                                      .validate()) {
                                    setState(() {});
                                    context.read<UserCubit>().signIn();
                                  } else {
                                    context.read<UserCubit>().autoValidateMode =
                                        AutovalidateMode.always;
                                    setState(() {});
                                  }
                                },
                                title: "Log In",
                              ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(bottom: 5.h),
                          child: const DoNotHaveAccountWidget(),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
