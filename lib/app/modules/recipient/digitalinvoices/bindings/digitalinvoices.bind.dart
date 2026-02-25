import 'package:get/get.dart';

import '../controller/digitainvoices.controller.dart';

class DigitalInvoicesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DigitalInvoicesController>(() => DigitalInvoicesController());
  }
}
