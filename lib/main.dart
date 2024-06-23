import 'package:attendo/attendo_app.dart';
import 'package:attendo/core/helpers/bloc_observer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_device_identifier/mobile_device_identifier.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'core/helpers/cache_helper.dart';
import 'core/helpers/preference_helper.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await mainFunctions(widgetsBinding);
  CacheHelper().init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) async {
    await SentryFlutter.init(
          (options) {
        options.dsn =
        'https://d8b83470ba65e60209cf6ef175f1cd99@o4507479302799360.ingest.de.sentry.io/4507479304503376';
        // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
        // We recommend adjusting this value in production.
        options.tracesSampleRate = 1.0;
        // The sampling rate for profiling is relative to tracesSampleRate
        // Setting to 1.0 will profile 100% of sampled transactions:
        options.profilesSampleRate = 1.0;
      },
      appRunner: () =>
          runApp(
            const Attendo(),
          ),
    );
  });
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
