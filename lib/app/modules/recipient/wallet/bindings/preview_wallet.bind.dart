import 'package:get/get.dart';

import '../controller/preview_wallet.controller.dart';

class PreviewWalletBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreviewWalletController>(() => PreviewWalletController());
  }
}
