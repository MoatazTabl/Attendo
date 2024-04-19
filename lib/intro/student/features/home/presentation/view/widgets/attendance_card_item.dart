// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:video_player/video_player.dart';

// class AttendanceCard extends StatefulWidget {
//   const AttendanceCard({
//     super.key,
//   });

//   @override
//   State<AttendanceCard> createState() => _AttendanceCardState();
// }


// <<<<<<< instructor
// class _AttendanceCardState extends State<AttendanceCard> {

//   late Image myImage;

//   @override
//   void initState() {
//     super.initState();
//     myImage= Image.asset("assets/images/attendance_card_background.png");
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     precacheImage(myImage.image, context);
//   }
// =======

// class _AttendanceCardState extends State<AttendanceCard> {

//   late VideoPlayerController _controller;
//   late Future<void> _initializeVideoPlayerFuture;

//   @override
//   void initState() {
//     // Create and store the VideoPlayerController. The VideoPlayerController
//     // offers several different constructors to play videos from assets, files,
//     // or the internet.
//     _controller = VideoPlayerController.asset("assets/videos/blue_shades.mp4",);

//     _initializeVideoPlayerFuture = _controller.initialize().then((value) {
//       _controller.play();
//       _controller.setLooping(true);
//     });

//     super.initState();
//   }


// >>>>>>> development
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         height: 242.h,
//         width: 381.w,
//         decoration: ShapeDecoration(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(20.w),
//           ),
//           image: const DecorationImage(
//             image:
//             AssetImage("assets/images/attendance_card_background.png"),
//           ),
//         ),
//         child: Column(
//           children: [
// <<<<<<< instructor
//             SizedBox(
//               height: 24.h,
//             ),
//             Text(
//               "Oop Lecture",
//               style: Theme.of(context).textTheme.headlineLarge!.copyWith(
//                   color: Colors.white, fontWeight: FontWeight.w500),
//             ),
//             Text(
//               "Dr/Bahaa",
//               style: GoogleFonts.roboto(
//                 textStyle: Theme.of(context).textTheme.labelMedium,
//               ),
//             ),
//             SizedBox(height: 15.h,),
//             ElevatedButton(
//               onPressed: () {
//                 context.push("/cameraScreen");
//               },
//               style: ButtonStyle(
//                 fixedSize: MaterialStateProperty.all(
//                   Size(258.w, 89.h),
// =======
//             AttendanceCardVideoPlayback(controller: _controller, initializeVideoPlayerFuture: _initializeVideoPlayerFuture,),
//             Column(
//               children: [
//                 SizedBox(
//                   height: 24.h,
//                 ),
//                 Text(
//                   "Oop Lecture",
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontWeight: FontWeight.w500,
//                       fontSize: 40.sp),
// >>>>>>> development
//                 ),
//                 backgroundColor: MaterialStateProperty.all(
//                     const Color(0xff2403F1).withOpacity(.42)),
//                 foregroundColor: MaterialStateProperty.all(Colors.white),
//                 shape: MaterialStateProperty.all(
//                   RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(32.w),
//                   ),
//                 ),
// <<<<<<< instructor
//               ),
//               child: Text(
//                 "Scan Qr",
//                 style: Theme.of(context).textTheme.headlineLarge!.copyWith(
//                     color: Colors.white, fontWeight: FontWeight.w500),
//               ),
//             )
// =======
//                 SizedBox(
//                   height: 15.h,
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     context.push("/cameraScreen");
//                   },
//                   style: ButtonStyle(
//                     fixedSize: MaterialStateProperty.all(
//                       Size(258.w, 89.h),
//                     ),
//                     backgroundColor: MaterialStateProperty.all(
//                         const Color(0xff2403F1).withOpacity(.42)),
//                     foregroundColor: MaterialStateProperty.all(Colors.white),
//                     shape: MaterialStateProperty.all(
//                       RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(32.w),
//                       ),
//                     ),
//                     padding: MaterialStateProperty.all(EdgeInsets.zero),
//                   ),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.only(top: 7.h),
//                         child: SvgPicture.asset("assets/images/svg/scan_qr.svg"),
//                       ),
//                       Text(
//                         "Scan Qr",
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.w400,
//                           fontSize: 40.sp,
//                         ),
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
// >>>>>>> development
//           ],
//         ),
//       ),
//     );
//   }
// }
