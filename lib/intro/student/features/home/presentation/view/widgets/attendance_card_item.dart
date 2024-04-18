import 'package:attendo/intro/student/features/Home/Presentation/view/widgets/attendance_card_background.dart';
import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class AttendanceCard extends StatefulWidget {
  const AttendanceCard({
    super.key,
  });

  @override
  State<AttendanceCard> createState() => _AttendanceCardState();
}



class _AttendanceCardState extends State<AttendanceCard> {

  late CachedVideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = CachedVideoPlayerController.asset("assets/videos/blue_shades.mp4",);

    _initializeVideoPlayerFuture = _controller.initialize().then((value) {
      _controller.play();
      _controller.setLooping(true);
    });

    super.initState();
  }


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
            AttendanceCardVideoPlayback(controller: _controller, initializeVideoPlayerFuture: _initializeVideoPlayerFuture,),
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
                        child: SvgPicture.asset("assets/images/svg/scan_qr.svg"),
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

