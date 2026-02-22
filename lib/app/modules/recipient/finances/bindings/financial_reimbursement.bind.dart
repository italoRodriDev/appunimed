import 'package:app_colabora_unimedjp/app/modules/recipient/finances/controller/financial_reimbursement.controller.dart';
import 'package:get/get.dart';

class FinancialReimbursementBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FinancialReimbursementController>(
      () => FinancialReimbursementController(),
    );
  }
}
