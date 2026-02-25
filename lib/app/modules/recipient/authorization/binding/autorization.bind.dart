import 'package:get/get.dart';

import '../controller/authorization.controller.dart';

class AuthorizationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthorizationController>(() => AuthorizationController());
  }
}
