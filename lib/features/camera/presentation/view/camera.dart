import 'dart:io';

import 'package:attendo/core/utils/globals.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// CameraApp is the Main Application.
class CameraScreen extends StatefulWidget {
  /// Default Constructor
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  late CameraController controller;
  bool _isRearCameraSelected = true;

  @override
  void initState() {
    _initializeCameraController(
      cameras[CameraLensDirection.back.index],
    );
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController cameraController = controller;

    if (!cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _initializeCameraController(cameraController.description);
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: controller.value.isInitialized
            ? SizedBox(
                width: 1.sw,
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap:() {
                        setFocusPoint(const Offset(0, 0));
                      },
                      child: CameraPreview(
                        controller,
                      ),
                    ),
                    Row(children: [
                      IconButton(
                        onPressed: takePicture,
                        iconSize: 50,
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(Icons.circle, color: Colors.white),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        iconSize: 30,
                        icon: Icon(
                            _isRearCameraSelected
                                ? CupertinoIcons.switch_camera
                                : CupertinoIcons.switch_camera_solid,
                            color: Colors.white),
                        onPressed: () {
                          setState(() => _isRearCameraSelected = !_isRearCameraSelected);
                          _initializeCameraController(cameras[_isRearCameraSelected ? 0 : 1]);
                          print(_isRearCameraSelected);
                        },
                      )
                    ],)
                  ],
                ),
              )
            : const CircularProgressIndicator(),
      ),
    );
  }

  Future<void> _initializeCameraController(
      CameraDescription cameraDescription) async {
    final CameraController cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.max,
      enableAudio: false,
      imageFormatGroup: ImageFormatGroup.jpeg,
    );

    controller = cameraController;

    // If the controller is updated then update the UI.
    cameraController.addListener(() {
      if (mounted) {
        setState(() {});
      }
      if (cameraController.value.hasError) {
        debugPrint('Camera error ${cameraController.value.errorDescription}');
      }
    });

    try {
      await cameraController.initialize();
      cameraController.setFlashMode(FlashMode.torch);
    } on CameraException catch (e) {
      switch (e.code) {
        case 'CameraAccessDenied':
          debugPrint('You have denied camera access.');
        case 'CameraAccessDeniedWithoutPrompt':
          // iOS only
          debugPrint('Please go to Settings app to enable camera access.');
        case 'CameraAccessRestricted':
          // iOS only
          debugPrint('Camera access is restricted.');
        case 'AudioAccessDenied':
          debugPrint('You have denied audio access.');
        case 'AudioAccessDeniedWithoutPrompt':
          // iOS only
          debugPrint('Please go to Settings app to enable audio access.');
        case 'AudioAccessRestricted':
          // iOS only
          debugPrint('Audio access is restricted.');
        default:
          debugPrint("${e.code},${e.description}");
          break;
      }
    }

    if (mounted) {
      setState(() {});
    }
  }

  Future takePicture() async {
    if (!controller.value.isInitialized) {
      return null;
    }
    if (controller.value.isTakingPicture) {
      return null;
    }
    try {
      await controller.setFlashMode(FlashMode.off);
      XFile picture = await controller.takePicture();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PreviewPage(
            picture: picture,
          ),
        ),
      );
    } on CameraException catch (e) {
      debugPrint('Error occured while taking picture: $e');
      return null;
    }
  }


    Future<void> setFocusPoint(Offset? point) async {
      if (point != null &&
          (point.dx < 0 || point.dx > 1 || point.dy < 0 || point.dy > 1)) {
        throw ArgumentError(
            'The values of point should be anywhere between (0,0) and (1,1).');
      }
      try {
        await controller.setFocusPoint(
          const Offset(0, 0)
        );
      } on PlatformException catch (e) {
        throw CameraException(e.code, e.message);
      }
    }

}

class PreviewPage extends StatelessWidget {
  const PreviewPage({super.key, required this.picture});

  final XFile picture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Image.file(File(picture.path))),
    );
  }
}
