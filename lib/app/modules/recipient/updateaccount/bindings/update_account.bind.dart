import 'package:app_colabora_unimedjp/app/modules/recipient/updateaccount/controller/update_account.controller.dart';
import 'package:get/get.dart';

class UpdateAccountBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateAccountController>(() => UpdateAccountController());
  }
}
