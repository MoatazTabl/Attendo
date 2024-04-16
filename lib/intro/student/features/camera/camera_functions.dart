import 'dart:io';

import 'package:attendo/core/utils/globals.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

mixin CameraFunctions<T extends StatefulWidget> on State<T> {
  late CameraController controller;

  @override
  void initState() {
    Permission.camera.request();
    var photoStatus = Permission.photos;
    Permission.storage.request();
    photoStatus.request();
    initializeCameraController(
      cameras[CameraLensDirection.back.index],
    );
    controller.setFocusMode(FocusMode.auto);

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  /// initialize the camera
  Future<void> initializeCameraController(
      CameraDescription cameraDescription) async {
    final CameraController cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.max,
      enableAudio: false,
      imageFormatGroup: Platform.isAndroid
          ? ImageFormatGroup.nv21 // for Android
          : ImageFormatGroup.bgra8888,
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
      await cameraController.setFlashMode(FlashMode.torch);
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

  /// takes picture using camera plugin
  Future takePicture() async {
    if (!controller.value.isInitialized) {
      return null;
    }
    if (controller.value.isTakingPicture) {
      return null;
    }
    try {
      await controller.setFlashMode(FlashMode.torch);
      XFile picture = await controller.takePicture();
      await savePicture(picture);
    } on CameraException catch (e) {
      debugPrint('Error occurred while taking picture: $e');
      return null;
    }
  }

  /// Saves picture taken to phone gallery
  Future<void> savePicture(XFile picture) async {
    XFile picture1 = XFile(picture.path);
    Uint8List convertedPicture = await picture1.readAsBytes();
    if (kDebugMode) {
      print(convertedPicture);
    }
    final result = await ImageGallerySaver.saveImage(
      convertedPicture,
      quality: 100,
    );
    if (kDebugMode) {
      print(result);
    }
  }

  Future<void> setFocusPoint(Offset? point) async {
    if (point != null &&
        (point.dx < 0 || point.dx > 1 || point.dy < 0 || point.dy > 1)) {
      throw ArgumentError(
          'The values of point should be anywhere between (0,0) and (1,1).');
    }
    try {
      await controller.setFocusPoint(const Offset(0, 0));
    } on PlatformException catch (e) {
      throw CameraException(e.code, e.message);
    }
  }
}
