import 'package:attendo/core/app_images.dart';
import 'package:attendo/core/helpers/common.dart';
import 'package:attendo/core/widgets/text_form_field.dart';
import 'package:attendo/intro/auth/auth_cubit/user_cubit.dart';
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Logged In Successfully")));
            if (RegExp(r'@(prof)\.com$')
                .hasMatch(context.read<UserCubit>().logInEmail.text)) {
              context.pushReplacement("/instructorMainScreen");
            } else {
              context.pushReplacement("/mainScreen");
            }
          } else if (state is LoginFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.errMessage)));
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
              backgroundColor: Colors.transparent,
              body: SizedBox(
                height: 1.sh,
                child: Form(
                  autovalidateMode: context.read<UserCubit>().autoValidateMode,
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
                      SizedBox(
                        height: 37.h,
                      ),
                      const WelcomeToAttendoWidget(),
                      SizedBox(
                        height: 36.h,
                      ),
                      SizedBox(
                        height: 65.h,
                        child: CustomTextFormField(
                          controller: context.read<UserCubit>().logInEmail,
                          hintText: getAppLocalizations(context)!.emailOrID,
                          isPass: false,
                          prefixIcon: Icons.person,
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      SizedBox(
                        height: 65.h,
                        child: CustomTextFormField(
                          controller: context.read<UserCubit>().logInPassword,
                          hintText: getAppLocalizations(context)!.password,
                          isPass: true,
                          prefixIcon: Icons.lock,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 22.w, right: 25.w),
                        child: const RememberMeWidget(),
                      ),
                      CustomFormElevatedButton(
                        onPressed: () {
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
                          // context.push("/mainScreen");
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
          );
        },
      ),
    );
  }
}
