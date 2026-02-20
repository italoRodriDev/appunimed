import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_darwin/local_auth_darwin.dart';

class BiometricService extends GetxService {
  final LocalAuthentication _auth = LocalAuthentication();

  RxBool canCheckBiometrics = false.obs;
  RxBool isAuthenticating = false.obs;
  RxString messageAuthorized =
      'Entre utilizando sua identificação facial ou digital'.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await checkBiometrics();
  }

  Future<BiometricService> init() async {
    return this;
  }

  Future<void> checkBiometrics() async {
    try {
      canCheckBiometrics.value =
          await _auth.canCheckBiometrics || await _auth.isDeviceSupported();
    } on PlatformException {
      canCheckBiometrics.value = false;
    }
  }

  Future<void> authenticate({
    required Function onSuccess,
    required Function onError,
  }) async {
    if (!canCheckBiometrics.value) {
      onError();
      return;
    }

    isAuthenticating.value = true;
    messageAuthorized.value = 'Aguardando sua validação';

    try {
      final authenticated = await _auth.authenticate(
        localizedReason: 'Precisamos validar sua identidade.',
        options: const AuthenticationOptions(
          biometricOnly: false,
          stickyAuth: true,
          useErrorDialogs: true,
        ),
        authMessages: const <AuthMessages>[
          IOSAuthMessages(
            cancelButton: 'Cancelar',
            goToSettingsButton: 'Configurações',
            goToSettingsDescription: 'Configure sua biometria',
          ),
          AndroidAuthMessages(
            signInTitle: 'Verificação de identidade',
            biometricHint: 'Use sua digital, face ou senha',
            cancelButton: 'Cancelar',
            goToSettingsButton: 'Configurações',
            goToSettingsDescription:
                'Cadastre um método de segurança no dispositivo',
          ),
        ],
      );

      isAuthenticating.value = false;

      if (!authenticated) {
        onError();
        return;
      }

      onSuccess();
    } on PlatformException {
      messageAuthorized.value = 'Entre com usuário e senha.';
      isAuthenticating.value = false;
      await cancelAuthentication();
      onError();
    }
  }

  Future<void> cancelAuthentication() async {
    await _auth.stopAuthentication();
    isAuthenticating.value = false;
    messageAuthorized.value =
        'Você pode tentar novamente ou entrar com usuário e senha.';
  }
}
