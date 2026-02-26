import 'package:get/get.dart';

import '../controller/medicalguide.controller.dart';

class MedicalGuideBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<MedicalGuideController>(() => MedicalGuideController());
  }
}