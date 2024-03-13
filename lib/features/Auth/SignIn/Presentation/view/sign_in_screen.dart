import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
              image: AssetImage("assets/images/backGround_image.png"),
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
                            Image.asset("assets/images/Checklist-rafiki.png"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Welcome to ",
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          Text(
                            "Attendo",
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(color: const Color(0xff3746CC)),
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
                              hintText: "Enter Your Email or Phone Number",
                              hintStyle: Theme.of(context).textTheme.labelSmall,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.w),
                                  borderSide: BorderSide.none),
                              filled: true,
                              fillColor: const Color(0xfff0f3ff),
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
                              hintText: "Enter Your Password",
                              hintStyle: Theme.of(context).textTheme.labelSmall,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.w),
                                  borderSide: BorderSide.none),
                              filled: true,
                              fillColor: const Color(0xfff0f3ff),
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
                                color: Color(0xff3746CC),
                                width: 2,
                              ),
                              value: rememberMe,
                              onChanged: (value) {
                                rememberMe = !rememberMe;
                                setState(() {});
                              },
                              activeColor: const Color(0xff3746CC),
                            ),
                            const Text("Remember Me"),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(
                            Size(240.w, 56.h),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(const Color(0xff3746CC)),
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
                          style: Theme.of(context).textTheme.labelMedium,
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
                                textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                context.push("/sign_up");
                              },
                              child: Text(
                                "Sign Up Now",
                                style: GoogleFonts.roboto(
                                  textStyle: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xff3746CC),
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
