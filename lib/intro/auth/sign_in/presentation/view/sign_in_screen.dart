import 'package:attendo/core/helpers/common.dart';
import 'package:attendo/core/networking/api_strings.dart';
import 'package:attendo/core/router/app_routes.dart';
import 'package:attendo/core/widgets/custom_snack_bar.dart';
import 'package:attendo/intro/auth/auth_cubit/user_cubit.dart';
import 'package:attendo/intro/auth/models/user_data_model.dart';
import 'package:attendo/intro/auth/sign_in/presentation/view/widgets/sign_in_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocConsumer<UserCubit, UserState>(
      listener: (context, state) async {
        if (state is LoginSuccess) {
          if (RegExp(r'@(prof)\.com$')
              .hasMatch(context.read<UserCubit>().logInEmail.text)) {
            userDataModel = await context
                .read<UserCubit>()
                .getUserData(userTypeEndPoint: ApiStrings.getInstructors);

            if (context.mounted) {
              context.go(AppRoutes.instructorMainScreen, extra: userDataModel);
            }
          } else if (RegExp(r'@(stu)\.com$')
              .hasMatch(context.read<UserCubit>().logInEmail.text)) {
            userDataModel = await context
                .read<UserCubit>()
                .getUserData(userTypeEndPoint: ApiStrings.getStudent);

            if (context.mounted) {
              context.pushReplacement(AppRoutes.mainScreen,
                  extra: userDataModel);
            }
          } else if (RegExp(r"@(admin)\.com$").hasMatch(
            context.read<UserCubit>().logInEmail.text,
          )) {
            context.pushReplacement(AppRoutes.adminHome);
          }
          if (context.mounted) {
            GlobalSnackBar.show(
                context, getAppLocalizations(context)!.loggedInSuccessfully);
            context.read<UserCubit>().logInEmail.clear();
            context.read<UserCubit>().logInPassword.clear();
          }
          if (!context.mounted) return;
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
          body: SafeArea(
            child: SignInBody(
              state: state,
            ),
          ),
        );
      },
    );
  }
}
