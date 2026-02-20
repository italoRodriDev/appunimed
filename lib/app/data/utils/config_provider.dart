import 'package:get/get.dart';

class ConfigProvider {
  static getStatus(Response res, Function success, Function error) {
    try {
      var message = '';
      switch (res.statusCode) {
        case 200:
          success(message);
          break;
        default:
          if (res.statusCode != null) {
            message = 'Algo saiu errado! Erro: ${res.statusCode}';
          } else {
            message = 'Erro: ${res.statusText}';
          }
          error(message);
      }
    } catch (e) {
      Exception(e);
    }
  }
}
