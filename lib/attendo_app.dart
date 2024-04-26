import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/utils/app_theme.dart';
import 'core/utils/router/router.dart';

class Attendo extends StatelessWidget {
  const Attendo({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 915),
      builder: (context, child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        // locale: PreferenceHelper.getLocale(),
        theme: lightMode,
        routerConfig: router,
      ),
    );
  }
}
