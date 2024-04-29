import 'package:attendo/core/helpers/preference_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/shared_cubit/attendo_cubit.dart';
import 'core/utils/app_theme.dart';
import 'core/utils/router/router.dart';

class Attendo extends StatelessWidget {
  const Attendo({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 915),
      builder: (context, child) =>
          BlocProvider(
            create: (context) => AttendoCubit(),
            child: BlocBuilder<AttendoCubit, AttendoState>(
              builder: (context, state) {

                return MaterialApp.router(
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: AppLocalizations
                      .localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  theme: lightMode,
                  locale: Locale(UserLanguageService.getPreferredLanguage),
                  routerConfig: router,
                );
              },
            ),
          ),
    );
  }
}
