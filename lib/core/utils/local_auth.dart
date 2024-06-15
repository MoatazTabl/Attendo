import 'package:attendo/core/helpers/common.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuth {
  final LocalAuthentication _auth = LocalAuthentication();

  Future<bool> authenticateWithBiometrics(BuildContext context) async {
    late bool didAuthenticate;
    try {
      didAuthenticate = await _auth.authenticate(
        localizedReason: getAppLocalizations(context)!.authReason,
        options: const AuthenticationOptions(),
      );
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return didAuthenticate;
  }
}
