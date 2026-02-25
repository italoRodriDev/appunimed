import 'package:get/get.dart';

import '../controller/trackrefund.controller.dart';

class TrackRefundBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrackRefundController>(() => TrackRefundController());
  }
}
