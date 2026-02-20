import 'package:app_colabora_unimedjp/app/data/provider/api.provider.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/extensions/async_extensions.dart';
import 'package:app_colabora_unimedjp/app/services/profile.service.dart';
import 'package:get/get.dart';

import '../../services/authentication.service.dart';

class ProfileRepository {
  final ApiProvider api = ApiProvider();

  AuthenticationService getUser() {
    return Get.find<AuthenticationService>();
  }

  ProfileService getDataProfile() {
    return Get.find<ProfileService>();
  }

  Future<Response> getProfile() async {
    String userId = getUser().userId;
    return await AsyncExtension.retry(
      () => api.sendGet(router: '/profile?codsUser=$userId'),
      logDebug: 'getProfile',
    );
  }
}
