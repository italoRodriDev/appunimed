import 'package:app_colabora_unimedjp/app/data/repository/wallet.repository.dart';
import 'package:app_colabora_unimedjp/app/data/utils/statuscode_validator.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/alerts/snackbar_app.component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WalletController extends GetxController {
  WalletRepository repo = WalletRepository();
  final ValueNotifier<int> timeSendCode = ValueNotifier(0);

  @override
  void onReady() {
    getWallets();
    super.onReady();
  }

  getWallets() async {
    Response res = await repo.getWallets();
    await AuthStatusCode.getStatus(res, (success) {}, (error) {
      SnackbarAppComponent.show(Get.context!, text: error.toString());
    });
  }
}
