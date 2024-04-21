import 'dart:async';
import 'dart:io';

import 'package:attendo/core/utils/globals.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

mixin CameraFunctions<T extends StatefulWidget> on State<T>
    implements WidgetsBindingObserver {
  late CameraController controller;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);

    initializeCameraController(
      cameras[CameraLensDirection.back.index],
    );

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
    await askForCameraPermission(cameraController);

    // If the controller is updated then update the UI.
    cameraController.addListener(
      () {
        if (mounted) {
          setState(() {});
        }
        if (cameraController.value.hasError) {
          debugPrint('Camera error ${cameraController.value.errorDescription}');
        }
      },
    );

    if (mounted) {
      setState(() {});
    }
  }

  Future<void> askForCameraPermission(CameraController cameraController) async {
    await Permission.camera.request();
    if (await Permission.camera.isGranted) {
      await cameraController.initialize();
      await cameraController.setFlashMode(FlashMode.torch);
      setState(() {});
    }
    if (await Permission.camera.isDenied) {
      if (mounted) {
        context.pop();
      }
    }
    if (await Permission.camera.isPermanentlyDenied) {
      showAdaptiveDialog(
        context: context,
        builder: (context) {
          return AlertDialog.adaptive(
            icon: const Icon(
              Icons.error,
              color: Colors.redAccent,
            ),
            title: const Text("Permission to open camera is denied"),
            actions: [
              TextButton(
                onPressed: () {
                  context.go("/mainScreen");
                },
                child: const Text("Ok"),
              ),
              TextButton(
                onPressed: () async {
                  await openAppSettings();
                },
                child: const Text("Open Settings"),
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> askForStoragePermission() async {
    var photoStatus = Permission.photos;
    await Permission.storage.request();
    await photoStatus.request();
  }

  /// takes picture using camera plugin
  Future takePicture() async {
    if (await Permission.storage.isDenied || await Permission.photos.isDenied) {
      await askForStoragePermission();
    }
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
