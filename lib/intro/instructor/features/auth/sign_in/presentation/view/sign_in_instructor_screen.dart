import 'package:attendo/core/app_images.dart';
import 'package:attendo/core/utils/font_adapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInInstructorScreen extends StatefulWidget {
  const SignInInstructorScreen({super.key});

  @override
  State<SignInInstructorScreen> createState() => _SignInInstructorScreenState();
}

class _SignInInstructorScreenState extends State<SignInInstructorScreen> {
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
              image: AssetImage(AppImages.backgroundImageStudent),
              fit: BoxFit.fill),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 1.sh,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 16.h,
                      ),
                      Center(
                        child:
                        Image.asset(AppImages.welcomePageStudentImage),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Welcome to ",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                              fontSize: FontAdaption()
                                  .getResponsiveFontSize(context,
                                  fontSize: 40),
                            ),
                          ),
                          Text(
                            "Attendo",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                              color: const Color(0xff3746CC),
                              fontSize:
                              FontAdaption().getResponsiveFontSize(
                                context,
                                fontSize: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 36.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        child: SizedBox(
                          height: 54.h,
                          child: TextField(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person,color: Colors.black,),
                              hintText: "Email or ID",
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                fontSize: FontAdaption()
                                    .getResponsiveFontSize(context,
                                    fontSize: 18),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.w),
                                  borderSide: BorderSide.none),
                              filled: true,
                              fillColor: const Color(0xfff0f3ff),
                              contentPadding: const EdgeInsets.only(left: 10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        child: SizedBox(
                          height: 54.h,
                          child: TextField(
                            enabled: true,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.lock,color: Colors.black,),
                              hintText: "Password",
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                fontSize:
                                FontAdaption().getResponsiveFontSize(
                                  context,
                                  fontSize: 18,
                                ),
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.w),
                                  borderSide: BorderSide.none),
                              filled: true,
                              fillColor: const Color(0xfff0f3ff),
                              contentPadding: const EdgeInsets.only(left: 10),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 22.w, right: 25.w),
                        child: Row(
                          children: [
                            Checkbox(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.w),
                              ),
                              side: const BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                              value: rememberMe,
                              onChanged: (value) {
                                rememberMe = !rememberMe;
                                setState(() {});
                              },
                              activeColor: Colors.black,
                            ),
                            Text(
                              "Remember Me",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontSize: FontAdaption()
                                      .getResponsiveFontSize(context,
                                      fontSize: 12),
                                ),
                              ),
                            ),
                          ],
                        ),
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
                          foregroundColor:
                          MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.w),
                            ),
                          ),
                        ),
                        onPressed: () {
                          context.go("/mainScreen");
                        },
                        child: Text(
                          "Login",
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                            fontSize: FontAdaption().getResponsiveFontSize(
                              context,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: EdgeInsets.only(bottom: 46.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't Have Account? ",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontSize: FontAdaption()
                                      .getResponsiveFontSize(context,
                                      fontSize: 16),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                context.push("/sign_up_student");
                              },
                              child: Text(
                                "Sign Up Now",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                  color: const Color(0xff3746CC),
                                  fontWeight: FontWeight.w900,
                                  fontSize:
                                  FontAdaption().getResponsiveFontSize(
                                    context,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
