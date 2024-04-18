import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AttendanceCardVideoPlayback extends StatefulWidget {
  const AttendanceCardVideoPlayback({super.key, required this.controller, required this.initializeVideoPlayerFuture});

  final CachedVideoPlayerController controller;
  final Future<void> initializeVideoPlayerFuture;

  @override
  State<AttendanceCardVideoPlayback> createState() =>
      _AttendanceCardVideoPlaybackState();
}

class _AttendanceCardVideoPlaybackState
    extends State<AttendanceCardVideoPlayback> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(16.w),
            child: CachedVideoPlayer(widget.controller),
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
