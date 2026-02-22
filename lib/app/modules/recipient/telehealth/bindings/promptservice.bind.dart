import 'package:app_colabora_unimedjp/app/modules/recipient/telehealth/controller/promptservice.controller.dart';
import 'package:get/get.dart';

class PromptServiceBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PromptServiceController>(() => PromptServiceController());
  }
}
