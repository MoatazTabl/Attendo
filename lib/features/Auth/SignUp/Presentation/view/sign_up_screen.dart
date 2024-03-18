import 'package:attendo/core/utils/font_adapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                    children: [
                      SizedBox(
                        height: 73.h,
                      ),
                      Text(
                        "Sign Up",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 25.w),
                            child: SizedBox(
                              height: 54.h,
                              child: TextField(
                                enabled: true,
                                decoration: InputDecoration(
                                  hintText: "Enter First Name",
                                  hintStyle:
                                      Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: FontAdaption().getResponsiveFontSize(context, fontSize: 18)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.w),
                                      borderSide: BorderSide.none),
                                  filled: true,
                                  fillColor: const Color(0xfff0f3ff),
                                  contentPadding:
                                      const EdgeInsets.only(left: 10),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 40.h),
                            height: 100.h,
                            width: 100.h,
                            alignment: Alignment.topCenter,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.w),
                              ),
                              image: const DecorationImage(
                                image: AssetImage(
                                  "assets/images/picture_avatar.png",
                                ),
                              ),
                            ),
                          ),
                        ],
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
                              hintText: "Enter Middle And Last Name",
                              hintStyle: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: FontAdaption().getResponsiveFontSize(context, fontSize: 18)),
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
                              hintText: "Enter Email",
                              hintStyle: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: FontAdaption().getResponsiveFontSize(context, fontSize: 18)),
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
                              hintText: "Enter Phone Number",
                              hintStyle: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: FontAdaption().getResponsiveFontSize(context, fontSize: 18)),
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
                              hintText: "Enter Password",
                              hintStyle: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: FontAdaption().getResponsiveFontSize(context, fontSize: 18)),
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
                              hintText: "Re Enter Password",
                              hintStyle: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: FontAdaption().getResponsiveFontSize(context, fontSize: 18)),
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
                      SizedBox(
                        height: 32.h,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(
                            Size(215.w, 56.h),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xff3746CC)),
                          foregroundColor:
                              MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22.w),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.fingerprint,
                              size: 42.h,
                            ),
                            Text(
                              " Scan FingerPrint",
                              style: GoogleFonts.roboto(
                                textStyle:  TextStyle(
                                    fontSize: FontAdaption().getResponsiveFontSize(context, fontSize: 14),
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 31.h,
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(
                            Size(215.w, 56.h),
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
                              borderRadius: BorderRadius.circular(22.w),
                            ),
                          ),
                        ),
                        child: Text(
                          "Sign Up",
                          style: GoogleFonts.roboto(
                            textStyle:  TextStyle(
                                fontSize: FontAdaption().getResponsiveFontSize(context, fontSize: 25),
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
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
