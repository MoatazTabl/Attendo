import 'package:attendo/core/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreenStudent extends StatefulWidget {
  const SignInScreenStudent({super.key});

  @override
  State<SignInScreenStudent> createState() => _SignInScreenStudentState();
}

class _SignInScreenStudentState extends State<SignInScreenStudent> {
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
              image: AssetImage(AppImages.backgroundImage),
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
                            SvgPicture.asset(AppImages.welcomePageStudentImage),
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
                                  fontSize: 40.sp,
                                ),
                          ),
                          Text(
                            "Attendo",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  color: const Color(0xff3746CC),
                                  fontSize: 40.sp,
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
                              prefixIcon: const Icon(
                                Icons.person,
                                color: Colors.black,
                              ),
                              hintText: "Email or ID",
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                    fontSize: 18.sp,
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
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                              hintText: "Password",
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .labelSmall
                                  ?.copyWith(
                                    fontSize: 18.sp,
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
                                  color: Color(
                                    0xff3746CC,
                                  ),
                                  width: 2),
                              value: rememberMe,
                              onChanged: (value) {
                                rememberMe = !rememberMe;
                                setState(() {});
                              },
                              activeColor: const Color(0xff3746CC),
                            ),
                            Text(
                              "Remember Me",
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                  fontSize: 12.sp,
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
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    fontSize: 16.sp,
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
                                  fontSize: 16.sp,
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
                                      fontSize: 20.sp,
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
