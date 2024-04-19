import 'package:attendo/intro/student/features/Home/Presentation/view/widgets/attendance_card_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class AttendanceCard extends StatefulWidget {
  const AttendanceCard({
    super.key,
  });

  @override
  State<AttendanceCard> createState() => _AttendanceCardState();
}

class _AttendanceCardState extends State<AttendanceCard>{
  late VideoPlayerController _controller;


  Future<void> initializeVideoController ()async
  {

    _controller = VideoPlayerController.asset("assets/videos/blue_shades.mp4", );

    await _controller.initialize();

    await _controller.play();

    _controller.setLooping(true);

  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: initializeVideoController(),
        builder:(context, snapshot) {
          if(snapshot.connectionState==ConnectionState.done)
          {
            return Center(
              child: Container(
                height: 242.h,
                width: 381.w,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.w),
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    AttendanceCardVideoPlayback(
                      controller: _controller,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 24.h,
                        ),
                        Text(
                          "Oop Lecture",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 40.sp),
                        ),
                        Text(
                          "Dr/Bahaa",
                          style: GoogleFonts.roboto(
                            textStyle: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            context.push("/cameraScreen");
                          },
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all(
                              Size(258.w, 89.h),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                              const Color(0xff2403F1).withOpacity(
                                .42,
                              ),
                            ),
                            foregroundColor: MaterialStateProperty.all(Colors.white),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  32.w,
                                ),
                              ),
                            ),
                            padding: MaterialStateProperty.all(
                              EdgeInsets.zero,
                            ),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 7.h,
                                ),
                                child: SvgPicture.asset(
                                  "assets/images/svg/scan_qr.svg",
                                ),
                              ),
                              Text(
                                "Scan Qr",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 40.sp,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );

          }
          else
          {
            return const Center(child: CircularProgressIndicator());
          }
        }
    );
  }
}
