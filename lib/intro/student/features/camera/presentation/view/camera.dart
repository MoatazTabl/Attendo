import 'dart:io';
import 'dart:ui';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../camera_functions.dart';

/// CameraApp is the Main Application.
class CameraScreen extends StatefulWidget {
  /// Default Constructor
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen>
    with WidgetsBindingObserver, CameraFunctions {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!controller.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.hidden) {
      debugPrint("hidden");
      controller.pausePreview();
    }

    if (state == AppLifecycleState.paused) {
      debugPrint("paused");
      controller.pausePreview();
    }

    if (state == AppLifecycleState.resumed) {
      debugPrint("resumed");
      controller.resumePreview();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: controller.value.isInitialized
            ? Stack(
                children: [

                  Center(
                    child: SizedBox(
                      width: 1.sw,
                      height: 1.sh,
                      child: CameraPreview(
                        controller,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 1.sw,
                    height: 0.3.sh,
                    child: Positioned.fill(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                        child: Container(
                          color: Colors.white10.withOpacity(0.2),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 1.sw,
                      height: 0.3.sh,
                      child: Positioned.fill(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
                          child: Container(
                            color: Colors.white10.withOpacity(0.2),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () async {
                        // Calculate focus point based on the position of the square
                        final Size screenSize = MediaQuery.of(context).size;
                         double squareSizeWidth = 80.w; // Size of the square
                         double squareSizeHeight =
                            145.h; // Size of the square
                        final double left =
                            (screenSize.width - squareSizeWidth) / 2;
                        final double top =
                            (screenSize.height - squareSizeHeight) / 2;
                        final double x = left + squareSizeWidth / 2;
                        final double y = top + squareSizeHeight / 2;

                        // Set focus point
                        await controller.setFocusPoint(
                          Offset(x / screenSize.width, y / screenSize.height),
                        );

                        // Delay for a short period to allow autofocus to adjust
                        await Future.delayed(const Duration(milliseconds: 500));

                        // Trigger autofocus
                        await controller.setFocusMode(FocusMode.auto);
                      },
                      child: Container(
                        width: 80.w,
                        height: 145.h,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.red, width: 2),
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20))),
                      ),
                    ),
                  ),
                  Positioned(
                    left: .4.sw,
                    bottom: 10,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: takePicture,
                          iconSize: 70,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: const Icon(Icons.circle, color: Colors.white),
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                      ],
                    ),
                  )
                ],
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}

class PreviewPage extends StatelessWidget {
  const PreviewPage({super.key, required this.picture});

  final XFile picture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Image.file(
          File(
            picture.path,
          ),
        ),
      ),
    );
  }
}
