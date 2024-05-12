import 'package:attendo/core/app_images.dart';
import 'package:attendo/core/helpers/common.dart';
import 'package:attendo/core/networking/api_strings.dart';
import 'package:attendo/core/widgets/custom_snack_bar.dart';
import 'package:attendo/core/widgets/text_form_field.dart';
import 'package:attendo/intro/auth/auth_cubit/user_cubit.dart';
import 'package:attendo/intro/auth/models/user_data_model.dart';
import 'package:attendo/intro/auth/sign_in/presentation/view/widgets/do_not_have_account_widget.dart';
import 'package:attendo/intro/auth/sign_in/presentation/view/widgets/remember_me_widget.dart';
import 'package:attendo/intro/auth/sign_in/presentation/view/widgets/welcome_to_attendo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/widgets/custom_form_elevated_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool rememberMe = false;
  late UserDataModel userDataModel;

  @override
  Widget build(BuildContext context) {
    bool domainTypeCheck = RegExp(r'@(prof)\.com$')
        .hasMatch(context
        .read<UserCubit>()
        .logInEmail
        .text);

    return SafeArea(
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) async {
          if (state is LoginSuccess) {
            if (domainTypeCheck) {
              userDataModel = await context
                  .read<UserCubit>()
                  .getUserData(userTypeEndPoint: ApiStrings.getInstructors);

              context.pushReplacement("/instructorMainScreen",
                  extra: userDataModel);
            } else {
              userDataModel = await context
                  .read<UserCubit>()
                  .getUserData(userTypeEndPoint: ApiStrings.getStudent);

              context.pushReplacement("/mainScreen", extra: userDataModel);
            }
            GlobalSnackBar.show(
                context, getAppLocalizations(context)!.loggedInSuccessfully);
            context
                .read<UserCubit>()
                .logInEmail
                .clear();
            context
                .read<UserCubit>()
                .logInPassword
                .clear();
          } else if (state is LoginFailure) {
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
                  fit: BoxFit.fill),
            ),
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.transparent,
              body: SizedBox(
                height: 1.sh,
                child: AutofillGroup(
                  child: Form(
                    autovalidateMode:
                    context
                        .read<UserCubit>()
                        .autoValidateModeSignIn,
                    key: context
                        .read<UserCubit>()
                        .logInFormKey,
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
                        SizedBox(
                          height: 37.h,
                        ),
                        const WelcomeToAttendoWidget(),
                        SizedBox(
                          height: 36.h,
                        ),
                        CustomTextFormField(
                          controller: context
                              .read<UserCubit>()
                              .logInEmail,
                          hintText: getAppLocalizations(context)!.signInEmail,
                          isPass: false,
                          prefixIcon: Icons.person,
                          textInputType: TextInputType.emailAddress,
                          autofillHints: const [AutofillHints.email],
                    
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        CustomTextFormField(
                          controller: context
                              .read<UserCubit>()
                              .logInPassword,
                          hintText: getAppLocalizations(context)!.password,
                          isPass: true,
                          prefixIcon: Icons.lock,
                          autofillHints: const [AutofillHints.password],
                    
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 22.w, right: 25.w),
                          child: const RememberMeWidget(),
                        ),
                        state is LoginLoading
                            ? const CircularProgressIndicator()
                            : CustomFormElevatedButton(
                          onPressed: () {
                            if (context
                                .read<UserCubit>()
                                .logInFormKey
                                .currentState!
                                .validate()) {
                              setState(() {});
                              context.read<UserCubit>().signIn();
                            } else {
                              context
                                  .read<UserCubit>()
                                  .autoValidateMode =
                                  AutovalidateMode.always;
                              setState(() {});
                            }
                          },
                          title: "Log In",
                        ),
                        const Spacer(),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20.h),
                          child: const DoNotHaveAccountWidget(),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
