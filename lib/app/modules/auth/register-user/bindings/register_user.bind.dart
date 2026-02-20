import 'package:get/get.dart';

import '../controller/register_user.controller.dart';

class RegisterUserBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterUserController>(() => RegisterUserController());
  }
}
