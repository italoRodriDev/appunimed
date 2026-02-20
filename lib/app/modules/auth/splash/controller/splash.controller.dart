import 'package:app_colabora_unimedjp/app/routers/app_routers.dart';
import 'package:app_colabora_unimedjp/app/services/config.service.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final Rx<bool> loadContent = false.obs;
  bool? permissions;

  @override
  void onInit() {
    counterNextPage();
    super.onInit();
  }

  validPermissionsRequested() async {
    if (permissions != true) {
      Get.offAndToNamed(RoutesApp.PERMISSOES);
    } else {
      Get.toNamed(RoutesApp.LOGIN);
    }
  }

  counterNextPage() async {
    final ConfigService configService = Get.find<ConfigService>();

    permissions = await configService.isPermissionsGranted();

    Future.delayed(Duration(seconds: 3), () {
      if (permissions != null && permissions == true) {
        validPermissionsRequested();
      } else {
        Get.toNamed(RoutesApp.PERMISSOES);
        loadContent.value = true;
      }
    });
  }
}
