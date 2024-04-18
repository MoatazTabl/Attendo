import 'package:attendo/core/utils/app_theme.dart';
import 'package:attendo/core/utils/globals.dart';
import 'package:attendo/core/utils/router/router.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {
    debugPrint("${e.code}, ${e.description}");
  }
  await ScreenUtil.ensureScreenSize();
  
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(
      const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 894),
      builder: (context, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: lightMode,
        routerConfig: router,
      ),
    );
  }
}
