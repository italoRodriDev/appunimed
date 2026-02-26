import 'package:get/get.dart';

import '../controller/talktous.controller.dart';

class TalkToUsBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<TalkToUsController>(() => TalkToUsController());
  }
}