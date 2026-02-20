import 'package:app_colabora_unimedjp/app/routers/app_routers.dart';
import 'package:app_colabora_unimedjp/app/services/authentication.service.dart';
import 'package:get/get.dart';

import '../../../../services/config.service.dart';

class PermissionsController extends GetxController {
  final ConfigService configService = Get.find<ConfigService>();
  final Rx<bool> loadContent = false.obs;
  final AuthenticationService authenticationService =
      Get.find<AuthenticationService>();

  @override
  void onInit() {
    counterNextPage();
    super.onInit();
  }

  counterNextPage() {
    Future.delayed(const Duration(milliseconds: 1000)).then((d) {
      loadContent.value = true;
    });
  }

  acceptPermissions() async {
    await Get.find<ConfigService>().requestPermissions();
    Get.toNamed(RoutesApp.LOGIN);
  }
}
