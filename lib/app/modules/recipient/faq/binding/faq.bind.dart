import 'package:app_colabora_unimedjp/app/modules/recipient/faq/controller/faq.controller.dart';
import 'package:get/get.dart';

class FaqBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FaqController>(() => FaqController());
  }
}
