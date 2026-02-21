import 'package:get/get.dart';

import '../controller/wallet.controller.dart';


class WalletBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WalletController>(() => WalletController());
  }
}
