import 'package:app_colabora_unimedjp/app/data/environments/environment.prod.dart';
import 'package:app_colabora_unimedjp/app/data/models/authentication.model.dart';
import 'package:app_colabora_unimedjp/app/data/provider/api.provider.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/extensions/async_extensions.dart';
import 'package:get/get.dart';

class LoginRepository {
  final ApiProvider _api = ApiProvider();

  Future<Response> login(AuthenticationModel model) async {
    return await AsyncExtension.retry(
      () => _api.sendPost(
        router: "/authbeneficiario/login",
        body: model.toJson(),
        skipAuthorization: true,
        headers: {
          'Authorization': 'Bearer ${EnvironmentProd.TOKEN_AUTH}',
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        }
      ),
      logDebug: 'login',
    );
  }

  Future<Response> logout() async {
    return await AsyncExtension.retry(
      () => _api.sendPost(
        router: "/token/logout",
        body: const {},
        skipAuthorization: false,
      ),
      logDebug: 'logout',
    );
  }
}
