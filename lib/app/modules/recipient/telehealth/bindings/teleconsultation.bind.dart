import 'package:app_colabora_unimedjp/app/modules/recipient/telehealth/controller/teleconsultation.controller.dart';
import 'package:get/get.dart';

class TeleConsultationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeleConsultationController>(() => TeleConsultationController());
  }
}
