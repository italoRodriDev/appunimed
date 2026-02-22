import 'package:get/get.dart';

import '../controller/assistence_reimbursement.controller.dart';

class AssistenceReimbursementBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AssistenceReimbursementController>(
      () => AssistenceReimbursementController(),
    );
  }
}
