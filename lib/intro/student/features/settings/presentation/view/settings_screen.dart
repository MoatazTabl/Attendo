import 'package:attendo/core/utils/font_adapter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool themeMode = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 14.w, right: 17.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Dark Mode",
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                      fontSize: FontAdaption().getResponsiveFontSize(context, fontSize:26),
                  ),
                ),
              ),
              Switch(
                value: themeMode,
                onChanged: (value) {
                  themeMode = !themeMode;
                  setState(() {});
                },
                trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
                activeColor: const Color(0xff3746CC),
                inactiveThumbColor: const Color(0xff2403F1).withOpacity(.7),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Language",
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                      fontSize: FontAdaption().getResponsiveFontSize(context, fontSize: 26),
                  ),
                ),
              ),
              Builder(builder: (BuildContext context) {
                return ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: const Color(0xffCBDAE8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            30.w,
                          ),
                          topRight: Radius.circular(
                            30.w,
                          ),
                        ),
                      ),
                      constraints:
                          BoxConstraints(maxHeight: .3.sh, minWidth: .3.sh),
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              TextButton(
                                onPressed: () {
                                  context.pop();
                                },
                                style: ButtonStyle(
                                  fixedSize: MaterialStateProperty.all(
                                    Size(
                                      1.sw,
                                      50.h,
                                    ),
                                  ),
                                  textStyle: MaterialStateProperty.all(
                                      Theme.of(context).textTheme.labelLarge),
                                  foregroundColor: MaterialStateProperty.all(
                                    const Color(
                                      0xff3746CC,
                                    ),
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),
                                child: Text(
                                  "English",
                                  style: GoogleFonts.roboto(
                                    textStyle: TextStyle(
                                        fontSize:20.sp
                                    ),
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  context.pop();
                                },
                                style: ButtonStyle(
                                  fixedSize: MaterialStateProperty.all(
                                    Size(
                                      1.sw,
                                      50.h,
                                    ),
                                  ),
                                  textStyle: MaterialStateProperty.all(
                                    Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: FontAdaption()
                                              .getResponsiveFontSize(
                                            context,
                                            fontSize: 25,
                                          ),
                                        ),
                                  ),
                                  foregroundColor: MaterialStateProperty.all(
                                    const Color(
                                      0xff3746CC,
                                    ),
                                  ),
                                  alignment: Alignment.centerRight,
                                ),
                                child: const Text(
                                  "اللغة العربية",
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all(
                      Size(
                        123.w,
                        58.h,
                      ),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.w),
                      ),
                    ),
                    foregroundColor: MaterialStateProperty.all(
                      const Color(0xff3746CC),
                    ),
                    padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 10))
                  ),
                  child: Row(
                    children: [
                      Text(
                        "English",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              fontSize: 22.sp),
                        ),

                      ),
                      const Spacer(),
                      const Icon(Icons.arrow_drop_down_outlined),
                    ],
                  ),
                );
              })
            ],
          ),
        ),
      ],
    );
  }
}
