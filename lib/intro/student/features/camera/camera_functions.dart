import 'dart:async';
import 'dart:io';
import 'package:image/image.dart' as img;
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
   takePicture() async {
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
      final  croppedImage = await cropToSquare(picture.path);
      context.pop(croppedImage);
      await savePicture(croppedImage );
    } on CameraException catch (e) {
      debugPrint('Error occurred while taking picture: $e');
      return null;
    }
  }
  Future<XFile> cropToSquare(String imagePath) async {
    final img.Image image = img.decodeImage(File(imagePath).readAsBytesSync())!;

    // Calculate the coordinates of the red square
    final Size screenSize = MediaQuery.of(context).size;
    const double squareSize = 100; // Size of the square
    final double left = (screenSize.width - squareSize) / 2;
    final double top = (screenSize.height - squareSize) / 2;

    //-----------------------------------------------------------

    // Calculate the coordinates for cropping
    final double x = left * image.width / screenSize.width;
    final double y = top * image.height / screenSize.height;
    final double width = squareSize * image.width / screenSize.width;
    final double height = squareSize * image.height / screenSize.height;

    //-----------------------------------------------------------

    // Crop the image to include only the object inside the red square
    final img.Image croppedImage = img.copyCrop(
      image,
      x: x.toInt(),
      y: y.toInt(),
      width: width.toInt(),
      height: height.toInt(),
    );

    final File file = File('$imagePath.cropped.jpg');
    await file.writeAsBytes(img.encodeJpg(croppedImage));

    return XFile(file.path); // Return an XFile object
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
