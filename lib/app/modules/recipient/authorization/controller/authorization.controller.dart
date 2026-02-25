import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/models/authorization.model.dart';

class AuthorizationController extends GetxController {
  ValueNotifier<List<AuthorizationModel>> listAuthorization = ValueNotifier([
    AuthorizationModel(
      id: 0,
      beneficiario: 'Maria Gomes da Silva',
      solicitante: 'Italo R. Santos',
      tipoGuia: 'INTERNAÇÕES CIRURGIAS ELETIVAS',
      protocolo: '234566938493849483948393',
      numeroGuia: '334848384',
      status: 'AUTORIZADA',
      validade: DateTime.now().toIso8601String(),
    ),
    AuthorizationModel(
      id: 1,
      beneficiario: 'Maria Gomes da Silva',
      tipoGuia: 'INTERNAÇÕES CIRURGIAS ELETIVAS',
      protocolo: '234566938493849483948393',
      numeroGuia: '334848384',
      status: 'EM ANÁLISE ADMINISTRATIVA',
      validade: DateTime.now().toIso8601String(),
    ),
    AuthorizationModel(
      id: 2,
      beneficiario: 'Maria Gomes da Silva',
      tipoGuia: 'INTERNAÇÕES CIRURGIAS ELETIVAS',
      protocolo: '234566938493849483948393',
      numeroGuia: '334848384',
      status: 'LIBERADA',
      validade: DateTime.now().toIso8601String(),
    ),
    AuthorizationModel(
      id: 3,
      beneficiario: 'Maria Gomes da Silva De Agusto',
      tipoGuia: 'INTERNAÇÕES CIRURGIAS ELETIVAS',
      protocolo: '234566938493849483948393',
      numeroGuia: '334848384',
      status: 'PROTOCOLO CANCELADO',
      validade: DateTime.now().toIso8601String(),
    ),
  ]);
}
