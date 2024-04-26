import 'package:attendo/attendo_app.dart';
import 'package:attendo/core/utils/globals.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  mainFunctions(widgetsBinding);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(
      const Attendo(),
    ),
  );

}

Future<void>mainFunctions(WidgetsBinding widgetsBinding)async
{
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    debugPrint("${e.code}, ${e.description}");
  }
  await ScreenUtil.ensureScreenSize();
  if (kReleaseMode) {
    Future.delayed(
      const Duration(
        seconds: 4,
      ),
    );
  }
  FlutterNativeSplash.remove();
}