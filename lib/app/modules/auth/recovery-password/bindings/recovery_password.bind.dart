import 'package:app_colabora_unimedjp/app/modules/auth/recovery-password/controller/recovery_password.controller.dart';
import 'package:get/get.dart';

class RecoveryPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecoveryPasswordController>(() => RecoveryPasswordController());
  }
}
