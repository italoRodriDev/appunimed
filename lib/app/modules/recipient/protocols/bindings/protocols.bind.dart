import 'package:get/get.dart';

import '../controller/protocols.controller.dart';

class ProtocolsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProtocolsController>(() => ProtocolsController());
  }
}
