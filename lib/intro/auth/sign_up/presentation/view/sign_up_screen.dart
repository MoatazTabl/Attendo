import 'package:attendo/core/app_images.dart';
import 'package:attendo/core/widgets/text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});


  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isStudent = false;
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

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
                child: Form(
                  autovalidateMode: autovalidateMode,
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      Text(
                        "Sign Up",
                        style: Theme
                            .of(context)
                            .textTheme
                            .headlineLarge,
                      ),
                      CircleAvatar(
                        radius: 45.sp,
                        backgroundImage: const AssetImage(
                            AppImages.addAvatarImage),
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                       CustomTextFormField(hintText: "First Name",
                        isPass: false,),
                      SizedBox(
                        height: 16.h,
                      ),
                       CustomTextFormField(hintText: "Last name",
                        isPass: false,),
                      SizedBox(
                        height: 16.h,
                      ),
                       CustomTextFormField(hintText: "ID",
                        isPass: false,),
                      SizedBox(
                        height: 16.h,
                      ),
                       CustomTextFormField(hintText: "University Email",
                        isPass: false,onChanged: (value) {
                           setState(() {
                             if (value.contains("@stu")) {
                               isStudent = true;
                             } else {
                               isStudent = false;
                             }
                           });
                        },),
                      SizedBox(
                        height: 16.h,
                      ),

                      SizedBox(
                        height: 16.h,
                      ),
                       CustomTextFormField(hintText: "Password",
                        isPass: true,),
                      SizedBox(
                        height: 16.h,
                      ),
                       CustomTextFormField(hintText: "Re Enter Password",
                        isPass: true,),
                      SizedBox(
                        height: 16.h,
                      ),

                      Visibility(
                        visible: isStudent,
                        child: CustomTextFormField(hintText: "Select Faculty",
                          isPass: false,),
                      ),
                      Visibility(
                        visible: isStudent,
                        child: CustomTextFormField(hintText: "Select grade",
                          isPass: false,),
                      ),
                      Visibility(
                        visible: isStudent,
                        child: ElevatedButton(
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
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 21.h,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            setState(() {});

                          } else {
                            autovalidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
                        },
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
                            textStyle: const TextStyle(
                                fontSize: 25,
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