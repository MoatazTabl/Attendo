import 'package:attendo/core/utils/app_theme.dart';
import 'package:attendo/core/utils/globals.dart';
import 'package:attendo/core/utils/router/router.dart';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
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
      designSize: const Size(412, 915),
      builder: (context, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: lightMode,
        routerConfig: router,
      ),
    );
  }
}
