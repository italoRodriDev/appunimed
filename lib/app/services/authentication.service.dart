import 'package:app_colabora_unimedjp/app/data/keys/shared_preferences.keys.dart';
import 'package:app_colabora_unimedjp/app/data/models/authentication.model.dart';
import 'package:app_colabora_unimedjp/app/data/provider/api.provider.dart';
import 'package:app_colabora_unimedjp/app/data/repository/login.repository.dart';
import 'package:app_colabora_unimedjp/app/routers/app_routers.dart';
import 'package:app_colabora_unimedjp/app/services/profile.service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationException implements Exception {
  String message;

  AuthenticationException(this.message);
}

class InitBalanceException implements Exception {
  String message;

  InitBalanceException(this.message);
}

class AuthenticationService extends GetxService {
  LoginRepository repo = LoginRepository();

  final ApiProvider api = ApiProvider();

  String username = '';
  String userId = '';
  String? pToken;

  Future<AuthenticationService> init() async {
    return this;
  }

  Future<Response> authenticate(AuthenticationModel authenticationModel) async {
    Response res = await repo.login(authenticationModel);
    return res;
  }

  logout() async {
    try {
      await repo.logout();

      await deleteDataAuthentication();
    } catch (e) {
      Exception(e);
    } finally {
      Get.offAndToNamed(RoutesApp.LOGIN);
    }
  }

  deleteDataAuthentication() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    final oldTokenString = sp.getString(TOKEN_KEY);
    if (oldTokenString != null) {
      await sp.remove(TOKEN_KEY);
    }

    final olduserId = sp.getString(USER_ID_KEY);
    if (olduserId != null) {
      Get.find<ProfileService>().dataProfile.value = null;
    }
  }
}
