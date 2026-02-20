import 'dart:io' show Platform;

import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class ConfigService extends GetxService {
  RxInt loadingQueue = 0.obs;

  Future<ConfigService> init() async {
    return this;
  }

  increasseLoadingQueue() {
    loadingQueue.value += 1;
  }

  decreasseLoadingQueue() {
    loadingQueue.value -= 1;
  }

  bool get isLoading => loadingQueue.value > 0;

  Future<void> initOneSignal(String userName) async {
    OneSignal.initialize('a3e868ec-2f56-429c-b664-42a6a171b407');
    await OneSignal.login(userName);
    OneSignal.User.setLanguage('pt-BR');
    OneSignal.Notifications.addForegroundWillDisplayListener((ev) {});
    OneSignal.Notifications.addClickListener((ev) {});
  }

  Future<bool> isPermissionsGranted() async {
    // TO DO: PERMISSION STORAGE NÃO É MAIS USADO EM VERSÕES MAIS NOVA DO ANDROID,
    // PARA O FUTURO PODE SER NECESSARIO REALZIAR UM TRATAMENTO PARA VERSÕES MAIS ANTIGAS
    // Permission.storage.request();

    final resultsPerm = await Future.wait([
      Permission.notification.isGranted,
      Permission.scheduleExactAlarm.isGranted,
      Permission.camera.isGranted,
    ]);

    bool hasPermission(bool status) => status;

    final androidRequired = [resultsPerm[0], resultsPerm[1], resultsPerm[2]];

    final iosRequired = [resultsPerm[0], resultsPerm[2]];

    return Platform.isAndroid
        ? androidRequired.every(hasPermission)
        : iosRequired.every(hasPermission);
  }

  Future<void> requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.notification,
      Permission.scheduleExactAlarm,
      Permission.storage,
      Permission.camera,
    ].request();

    if (Platform.isIOS) {
      return;
    }

    if (statuses[Permission.notification] ==
        PermissionStatus.permanentlyDenied) {
      openAppSettings();
    }

    if (statuses[Permission.scheduleExactAlarm] ==
            PermissionStatus.permanentlyDenied &&
        Platform.isAndroid) {
      openAppSettings();
    }

    if (statuses[Permission.camera] == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    }
  }
}
