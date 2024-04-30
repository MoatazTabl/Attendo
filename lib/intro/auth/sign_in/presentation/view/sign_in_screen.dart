import 'package:attendo/core/app_images.dart';
import 'package:attendo/core/helpers/common.dart';
import 'package:attendo/core/widgets/text_form_field.dart';
import 'package:attendo/intro/auth/sign_in/presentation/view/widgets/do_not_have_account_widget.dart';
import 'package:attendo/intro/auth/sign_in/presentation/view/widgets/remember_me_widget.dart';
import 'package:attendo/intro/auth/sign_in/presentation/view/widgets/welcome_to_attendo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

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
      child: Container(
        width: 1.sw,
        height: 1.sh,
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage(AppImages.backgroundImage), fit: BoxFit.fill),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SizedBox(
            height: 1.sh,
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
                    hintText: getAppLocalizations(context)!.password,
                    isPass: true,
                    prefixIcon: Icons.lock,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 22.w, right: 25.w),
                  child: const RememberMeWidget(),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                      Size(240.w, 56.h),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      const Color(
                        0xff3746CC,
                      ),
                    ),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.w),
                      ),
                    ),
                  ),
                  onPressed: () {
                    context.push("/mainScreen");
                  },
                  child: Text(
                    getAppLocalizations(context)!.logIn,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontSize: 16.sp),
                  ),
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
  }
}
