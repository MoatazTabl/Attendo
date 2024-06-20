import 'package:attendo/core/helpers/common.dart';
import 'package:attendo/core/utils/app_theme.dart';
import 'package:attendo/core/widgets/custom_snack_bar.dart';
import 'package:attendo/intro/auth/auth_cubit/user_cubit.dart';
import 'package:attendo/intro/auth/sign_up/presentation/view/widgets/sign_up_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
          return Scaffold(
            body: SafeArea(
              child: Container(
                height: 1.sh,
                width: 1.sw,
                margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppTheme.boxStrokeColor,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: SignUpBody(
                  state: state,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
