import 'package:app_colabora_unimedjp/app/data/models/profile.model.dart';
import 'package:app_colabora_unimedjp/app/data/provider/api.provider.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/extensions/async_extensions.dart';
import 'package:get/get.dart';

import '../../services/authentication.service.dart';
import '../../services/profile.service.dart';

class UpdateRepository {
  ApiProvider api = ApiProvider();

  AuthenticationService getUser() {
    return Get.find<AuthenticationService>();
  }

  ProfileService getDataProfile() {
    return Get.find<ProfileService>();
  }

  Future<Response> getDataCEP(String cep) async {
    return await AsyncExtension.retry(
      () => api.sendGet(
        router: "https://brasilapi.com.br/api/cep/v1/$cep",
        skipAuthorization: true
      ),
      logDebug: 'getDataCEP',
    );
  }

}
