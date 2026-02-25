import 'package:get/get.dart';

import '../controller/chat.controller.dart';

class ChatBinding implements Bindings {
@override
void dependencies() {
  Get.lazyPut<ChatController>(() => ChatController());
  }
}