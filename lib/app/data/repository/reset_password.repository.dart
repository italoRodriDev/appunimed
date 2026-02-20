import 'package:app_colabora_unimedjp/app/data/provider/api.provider.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/extensions/async_extensions.dart';
import 'package:get/get.dart';

import '../environments/environment.prod.dart';

class ResetPasswordRepository {
  final ApiProvider api = ApiProvider();

  getHeadersAuth() {
    return {
      'Authorization': 'Bearer ${EnvironmentProd.TOKEN_AUTH}',
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  Future<Response> getContacts({required String cpf}) async {
    return await AsyncExtension.retry(
      () => api.sendGet(
        router: "/authbeneficiario/recuperacao-senha/contatos",
        query: {"cpf": cpf},
        skipAuthorization: true,
        headers: getHeadersAuth()
      ),
      logDebug: 'getContacts',
    );
  }

  Future<Response> sendCodeVerificationSms({
    required int idPessoa,
    required String cpf,
    required String contato,
  }) async {
    return await AsyncExtension.retry(
      () => api.sendPost(
        router: "/authbeneficiario/recuperacao-senha/codigo-verificacao/sms",
        body: {'idPessoa': idPessoa, 'cpf': cpf, 'contato': contato},
        skipAuthorization: true,
        headers: getHeadersAuth()
      ),
      logDebug: 'sendCodeVerificationSms',
    );
  }

  Future<Response> sendCodeVerificationEmail({
    required int idPessoa,
    required String cpf,
    required String contato,
  }) async {
    return await AsyncExtension.retry(
      () => api.sendPost(
        router: "/authbeneficiario/recuperacao-senha/codigo-verificacao/email",
        body: {'idPessoa': idPessoa, 'cpf': cpf, 'contato': contato},
        skipAuthorization: true,
        headers: getHeadersAuth()
      ),
      logDebug: 'sendCodeVerificationEmail',
    );
  }

  Future<Response> verifyCode({required String codigo}) async {
    return await AsyncExtension.retry(
      () => api.sendGet(
        router:
            "/authbeneficiario/recuperacao-senha/codigo-verificacao/$codigo",
        skipAuthorization: true,
        headers: getHeadersAuth()
      ),
      logDebug: 'verifyCode',
    );
  }

  Future<Response> redefinePassword({
    required String login,
    required String senha,
    required String codigo,
  }) async {
    return await AsyncExtension.retry(
      () => api.sendPost(
        router: "/authbeneficiario/senha/redefinicao",
        body: {'login': login, 'senha': senha, 'codigo': codigo},
        skipAuthorization: true,
        headers: getHeadersAuth()
      ),
      logDebug: 'redefinePassword',
    );
  }
}
