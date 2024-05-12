import 'dart:async';

import 'package:attendo/core/app_images.dart';
import 'package:attendo/core/errors/failures.dart';
import 'package:attendo/core/helpers/common.dart';
import 'package:attendo/intro/student/features/home/data/models/students_lectures_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../../scan_qr/presentation/view/scan_qr.dart';

class AttendanceCard extends StatefulWidget {
  const AttendanceCard(
      {super.key,
      required this.isActive,
      required this.lectures,
      required this.studentName});

  final bool isActive;
  final StudentsLecturesModel lectures;
  final String studentName;

  @override
  State<AttendanceCard> createState() => _AttendanceCardState();
}

class _AttendanceCardState extends State<AttendanceCard>
    with WidgetsBindingObserver {
  final Duration animationTime = const Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedScale(
        scale: widget.isActive ? 1.0 : 0.8,
        duration: animationTime,
        child: AnimatedContainer(
          height: 250.h,
          width: 340.w,
          margin: EdgeInsets.symmetric(vertical: 10.h),
          decoration: ShapeDecoration(
            image: const DecorationImage(
                image: AssetImage(
                  AppImages.attendanceCardBackground,
                ),
                fit: BoxFit.fill),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          duration: animationTime,
          curve: Curves.easeIn,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedDefaultTextStyle(
                      style: TextStyle(
                        foreground: Paint()
                          ..style = PaintingStyle.stroke
                          ..strokeWidth = 2
                          ..color = Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: constraints.maxWidth / 10,
                      ),
                      duration: animationTime,
                      child: Text(
                        widget.lectures.name ?? "",
                      ),
                    ),
                    AnimatedDefaultTextStyle(
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        fontSize: constraints.maxWidth / 10,
                      ),
                      duration: animationTime,
                      child: Text(
                        widget.lectures.name ?? "",
                      ),
                    ),
                  ],
                );
              }),
              AnimatedDefaultTextStyle(
                style: GoogleFonts.roboto(
                  textStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500),
                ),
                duration: animationTime,
                child: Text(
                  widget.lectures.instructorInfo?.name ?? "",
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  AnimatedDefaultTextStyle(
                    style: GoogleFonts.roboto(
                      textStyle:
                          Theme.of(context).textTheme.labelMedium!.copyWith(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                    duration: animationTime,
                    child: Text(
                      widget.lectures.lectureHall ?? "",
                    ),
                  ),
                  AnimatedDefaultTextStyle(
                    style: GoogleFonts.roboto(
                      textStyle: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500),
                    ),
                    duration: animationTime,
                    child: Text(
                      dateTime(widget.lectures.lectureStartTime) ?? "",
                    ),
                  ),
                ],
              ),
              AnimatedContainer(
                  duration: animationTime,
                  curve: Curves.easeIn,
                  height: 89.h,
                  width: 258.w,
                  margin: EdgeInsets.only(
                    top: 9.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: Colors.transparent,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.7),
                        blurStyle: BlurStyle.outer,
                        offset: const Offset(0, 0),
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    onPressed: () async {
                      // bool localAuth =
                      //     await LocalAuth().authenticateWithBiometrics(context);
                      // print(localAuth);
                      if (true) {
                        final generatedCode = await QrCodeFunctions()
                            .getLectureCode(widget.lectures.pk!);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MobileScannerWindow(
                              lectureCode: generatedCode, lecturePk: widget.lectures.pk!, studentName: widget.studentName,
                            ),
                          ),
                        );
                        // final generatedCode = await QrCodeFunctions().getLectureCode(lectures.pk!);
                        //   QrCodeFunctions.scan(context,generatedCode,lectures.pk!,studentName);
                      }
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            32,
                          ),
                        ),
                      ),
                      enableFeedback: true,
                      backgroundColor:
                          const MaterialStatePropertyAll(Colors.transparent),
                      shadowColor:
                          MaterialStateProperty.all(Colors.transparent),
                      elevation: MaterialStateProperty.all(0),
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
                            height: 50,
                            width: 47,
                          ),
                        ),
                        AnimatedDefaultTextStyle(
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 40.sp,
                          ),
                          duration: animationTime,
                          child: Text(getAppLocalizations(context)!.scanQR),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  String? dateTime(String? dateTime) {
    var dateFormat = DateFormat.jm().format(DateTime.parse(dateTime ?? ""));
    return dateFormat;
  }
}

class MobileScannerWindow extends StatefulWidget {
  const MobileScannerWindow({super.key, required this.lectureCode, required this.lecturePk, required this.studentName});

  final String lectureCode;
  final int lecturePk;
  final String studentName;

  @override
  State<MobileScannerWindow> createState() => _MobileScannerWindowState();
}

class _MobileScannerWindowState extends State<MobileScannerWindow>
    with WidgetsBindingObserver {
  MobileScannerController mobileScannerController = MobileScannerController(
      autoStart: true,
      facing: CameraFacing.back,
      formats: [BarcodeFormat.qrCode],
    detectionSpeed: DetectionSpeed.noDuplicates,
    detectionTimeoutMs: 500
  );
  StreamSubscription<Object?>? _subscription;
  Barcode? _barcode;

  Future<void> _handleBarcode(BarcodeCapture barcodes) async {
    try {
      String? generatedCode = _barcode?.rawValue;
      if (generatedCode == widget.lectureCode) {
        final appendStudentState =
            await QrCodeFunctions.appendStudent(widget.lecturePk, widget.studentName);
        if (mounted) {
          QrCodeFunctions.customShowDialog(context, appendStudentState);
        }
      } else {
        QrCodeFunctions.customShowDialog(context, "Wrong! This is not the correct QR code.");
      }
    } on Exception catch (e) {
      if (e is DioException) {
        final k = ServerFailures.fromDioException(e);
        if (kDebugMode) {
          print(k.errorMessage);
        }
      }
    }
    if (mounted) {
      setState(() async {
        _barcode = barcodes.barcodes.firstOrNull;

      });
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    // Start listening to the barcode events.
    _subscription = mobileScannerController.barcodes.listen(_handleBarcode);

    // Finally, start the scanner itself.
    unawaited(mobileScannerController.start());
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // If the controller is not ready, do not try to start or stop it.
    // Permission dialogs can trigger lifecycle changes before the controller is ready.
    if (!mobileScannerController.value.isInitialized) {
      return;
    }

    switch (state) {
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
        return;
      case AppLifecycleState.resumed:
        // Restart the scanner when the app is resumed.
        // Don't forget to resume listening to the barcode events.
        _subscription = mobileScannerController.barcodes.listen(_handleBarcode);

        unawaited(mobileScannerController.start());
      case AppLifecycleState.inactive:
        // Stop the scanner when the app is paused.
        // Also stop the barcode events subscription.
        unawaited(_subscription?.cancel());
        _subscription = null;
        unawaited(mobileScannerController.stop());
    }
  }

  @override
  Future<void> dispose() async {
    // Stop listening to lifecycle changes.
    WidgetsBinding.instance.removeObserver(this);
    // Stop listening to the barcode events.
    await _subscription?.cancel();
    _subscription = null;
    // Dispose the widget itself.
    // Finally, dispose of the controller.
    await mobileScannerController.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MobileScanner(
        controller: mobileScannerController,
      ),
    );
  }
}
