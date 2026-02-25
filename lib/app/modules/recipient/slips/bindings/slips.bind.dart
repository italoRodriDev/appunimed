import 'package:get/get.dart';

import '../controller/myslips.controller.dart';

class SlipsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MySlipsController>(() => MySlipsController());
  }
}
