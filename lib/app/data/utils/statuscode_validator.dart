import 'package:app_colabora_unimedjp/app/modules/utils/components/alerts/snackbar_app.component.dart';
import 'package:get/get.dart';

class AuthStatusCode {
  static getStatus(Response res, Function success, Function error) {
    var message = 'Aguadando resposta...';
    switch (res.statusCode) {
      case 200:
        success.call(message);
        break;
      case 201:
        success.call(message);
        break;
      case 204:
        success.call(message);
        break;
      case 1502:
        SnackbarAppComponent.show(
          Get.context!,
          text: 'Sua sessão expirou, por favor realize o login novamente!',
        );
        break;
      default:
        message = "Ocorreu um erro inesperado!";
        try {
          if (!(res.statusCode == null || res.body == null)) {
            if (res.body != null) {
              message = 'Erro: ${res.body['message']}';
            }
          }
        } finally {
          error.call(message);
        }
    }
  }

  static getStatusTest(Response res, Function success, Function error) {
    success(true);
  }
}
