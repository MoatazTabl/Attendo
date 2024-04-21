import 'package:attendo/core/app_images.dart';
import 'package:attendo/core/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreenStudent extends StatelessWidget {
  const SignUpScreenStudent({super.key});

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
              SliverFillRemaining(
                child: SizedBox(
                  height: 1.sh,
                  child: Form(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50.h,
                          ),
                          Text(
                            "Sign Up",
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                          CircleAvatar(
                            radius: 45.sp,
                            backgroundImage:
                                const AssetImage(AppImages.addAvatarImage),
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          const CustomTextFormField(
                            hintText: "First Name",
                            isPass: false,
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          const CustomTextFormField(
                            hintText: "Last name",
                            isPass: false,
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          const CustomTextFormField(
                            hintText: "Student ID",
                            isPass: false,
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          const CustomTextFormField(
                            hintText: "Student Email",
                            isPass: false,
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          const CustomTextFormField(
                            hintText: "Phone number",
                            isPass: false,
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          const CustomTextFormField(
                            hintText: "Password",
                            isPass: true,
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          const CustomTextFormField(
                            hintText: "Re Enter Password",
                            isPass: true,
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
                                    textStyle: TextStyle(
                                        fontSize: 14.sp,
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
                                textStyle: TextStyle(
                                    fontSize: 25.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          )
                        ],
                      ),
                    ),
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
