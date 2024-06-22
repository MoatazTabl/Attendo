import 'package:attendo/core/helpers/common.dart';
import 'package:attendo/core/networking/api_strings.dart';
import 'package:attendo/core/utils/app_theme.dart';
import 'package:attendo/core/widgets/custom_snack_bar.dart';
import 'package:attendo/intro/auth/auth_cubit/user_cubit.dart';
import 'package:attendo/intro/auth/models/user_data_model.dart';
import 'package:attendo/intro/auth/sign_in/presentation/view/widgets/sign_in_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';


class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool rememberMe = false;
  late UserDataModel userDataModel;

  @override
  void initState() {
    super.initState();
    context.read<UserCubit>().getDeviceId();
  }

  @override
  Widget build(BuildContext context) {
    bool domainTypeCheck = RegExp(r'@(prof)\.com$')
        .hasMatch(context.read<UserCubit>().logInEmail.text);
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) async {
        if (state is LoginSuccess) {
          if (domainTypeCheck) {
            userDataModel = await context
                .read<UserCubit>()
                .getUserData(userTypeEndPoint: ApiStrings.getInstructors);

            if (context.mounted) {
              context.pushReplacement("/instructorMainScreen",
                  extra: userDataModel);
            }
          } else {
            userDataModel = await context
                .read<UserCubit>()
                .getUserData(userTypeEndPoint: ApiStrings.getStudent);

            if (context.mounted) {
              context.pushReplacement("/mainScreen", extra: userDataModel);
            }
          }
          if (context.mounted) {
            GlobalSnackBar.show(
                context, getAppLocalizations(context)!.loggedInSuccessfully);
            context.read<UserCubit>().logInEmail.clear();
            context.read<UserCubit>().logInPassword.clear();
          }
          else
            {
              context.pushReplacement("/adminHome");
            }
          GlobalSnackBar.show(
              context, getAppLocalizations(context)!.loggedInSuccessfully);
          context.read<UserCubit>().logInEmail.clear();
          context.read<UserCubit>().logInPassword.clear();

        } else if (state is LoginFailure) {
          GlobalSnackBar.show(context, state.errMessage);
        }
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
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
              child: SignInBody(
                state: state,
              ),
            ),
          ),
        );
      },
    );
  }
}
