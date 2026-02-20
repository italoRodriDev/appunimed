import 'package:app_colabora_unimedjp/app/data/models/authentication_response.model.dart';
import 'package:app_colabora_unimedjp/app/services/authentication.service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../data/repository/onesignal.repository.dart';
import '../data/repository/profile.repository.dart';
import '../data/utils/statuscode_validator.dart';

class ProfileService extends GetxService {
  final AuthenticationService authenticationService =
      Get.find<AuthenticationService>();
  ProfileRepository profileRepo = ProfileRepository();
  OneSignalRepository oneSignalRepository = OneSignalRepository();
  ValueNotifier<AuthResponseModel?> dataProfile =
      ValueNotifier<AuthResponseModel?>(null);

  RxBool showGreeting = false.obs;

  Future<ProfileService> init() async {
    return this;
  }

  subscribeUserPush({required AuthResponseModel data}) async {
    Response res = await oneSignalRepository.postSubscribeOneSignal(
      externalId: data.id.toString(),
    );

    await AuthStatusCode.getStatus(res, (message) {}, (error) {});
  }
}
