import 'package:get/get.dart';

import '../controller/declarations.controller.dart';

class DeclarationsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DeclarationsController>(() => DeclarationsController());
  }
}
