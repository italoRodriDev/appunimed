import 'package:get/get.dart';

import '../controller/financial.controller.dart';

class FinancialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FinancialController>(() => FinancialController());
  }
}
