import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

class AttendanceCardVideoPlayback extends StatefulWidget {
  const AttendanceCardVideoPlayback(
      {super.key,
      required this.controller,
      });

  final VideoPlayerController controller;

  @override
  State<AttendanceCardVideoPlayback> createState() =>
      _AttendanceCardVideoPlaybackState();
}

class _AttendanceCardVideoPlaybackState
    extends State<AttendanceCardVideoPlayback> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.w),
      child: VideoPlayer(widget.controller),
    );
  }
}
