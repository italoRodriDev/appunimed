import 'package:app_colabora_unimedjp/app/modules/recipient/telehealth/controller/telehealth.controller.dart';
import 'package:get/get.dart';

class TeleHealthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeleHealthController>(() => TeleHealthController());
  }
}
