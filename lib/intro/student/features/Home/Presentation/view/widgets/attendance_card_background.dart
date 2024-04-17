import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

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
              child: VideoPlayer(_controller),
            ),
          );
        } else {
          return Container(
            color: Colors.white,
          );
        }
      },
    );
  }
}
