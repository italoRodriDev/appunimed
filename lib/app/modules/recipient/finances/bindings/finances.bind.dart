import 'package:get/get.dart';

import '../controller/finances.controller.dart';

class FinancesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FinancesController>(() => FinancesController());
  }
}
