import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

class AttendanceCard extends StatelessWidget {
  const AttendanceCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            AttendanceCardVideoPlayback(),
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
                        const Color(0xff2403F1).withOpacity(.42)),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32.w),
                      ),
                    ),
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 7.h),
                        child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            "assets/images/svg/scan_qr.svg",
                          ),
                          iconSize: 30,
                          padding: EdgeInsets.zero,
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
}

class AttendanceCardVideoPlayback extends StatefulWidget {
  const AttendanceCardVideoPlayback({super.key});

  @override
  State<AttendanceCardVideoPlayback> createState() =>
      _AttendanceCardVideoPlaybackState();
}

class _AttendanceCardVideoPlaybackState
    extends State<AttendanceCardVideoPlayback> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // TODO: implement initState
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.asset(
      "assets/videos/blue_shades.mp4",
    );

    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.play();
    _controller.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Offstage(
            offstage: false,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.w),
                  child: VideoPlayer(_controller)));
        } else {
          return Container(
            color: Colors.white,
          );
        }
      },
    );
  }
}
