import 'package:app_colabora_unimedjp/app/modules/recipient/manuals/controller/manuals.controller.dart';
import 'package:get/get.dart';

class ManualsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManualsController>(() => ManualsController());
  }
}
