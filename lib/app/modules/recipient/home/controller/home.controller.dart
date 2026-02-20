import 'package:app_colabora_unimedjp/app/data/models/authentication_response.model.dart';
import 'package:app_colabora_unimedjp/app/data/provider/sqlite.provider.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  ValueNotifier<AuthResponseModel?> dataProfile = ValueNotifier(null);

  @override
  void onInit() {
    getDataProfile();
    super.onInit();
  }

  getDataProfile() async {
    List<AuthResponseModel> data = await SqliteApi.getProfile();
    dataProfile.value = data[0];
  }
}
