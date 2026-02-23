import 'package:get/get.dart';

import '../controller/scheduling.controller.dart';

class SchedulingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SchedulingController>(() => SchedulingController());
  }
}
