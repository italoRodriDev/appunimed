import 'package:get/get.dart';

import '../controller/examresults.controller.dart';

class ExamResultsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExamResultsController>(() => ExamResultsController());
  }
}
