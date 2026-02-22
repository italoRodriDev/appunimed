import 'package:app_colabora_unimedjp/app/modules/recipient/finances/controller/finances.controller.dart';
import 'package:get/get.dart';

class FinancesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FinancesController>(() => FinancesController());
  }
}
