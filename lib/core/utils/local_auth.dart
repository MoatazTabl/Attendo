import 'package:local_auth/local_auth.dart';

class LocalAuth {
  final LocalAuthentication _auth = LocalAuthentication();


  Future<bool> authenticateWithBiometrics() async {
    final bool didAuthenticate = await _auth.authenticate(
        localizedReason: 'Please authenticate to show account balance',
        options: const AuthenticationOptions(
          biometricOnly: true,
        ));
    return didAuthenticate;
  }

}
