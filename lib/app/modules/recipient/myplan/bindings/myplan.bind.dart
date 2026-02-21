import 'package:app_colabora_unimedjp/app/modules/recipient/myplan/controller/myplan.controller.dart';
import 'package:get/get.dart';

class MyPlanBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyPlanController>(() => MyPlanController());
  }
}
