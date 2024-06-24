import 'package:attendo/attendo_app.dart';
import 'package:attendo/core/helpers/bloc_observer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_device_identifier/mobile_device_identifier.dart';

import 'core/helpers/cache_helper.dart';
import 'core/helpers/preference_helper.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await mainFunctions(widgetsBinding);
  CacheHelper().init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(
            const Attendo(),
          ),
  );
}

Future<void> mainFunctions(WidgetsBinding widgetsBinding) async {
  await UserLanguageService().init();
  await CacheHelper().init();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  Bloc.observer = MyBlocObserver();
  if (kDebugMode) {
    print(await MobileDeviceIdentifier().getDeviceId());
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
