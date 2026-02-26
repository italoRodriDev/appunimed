import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../data/models/protocol.model.dart';

class ProtocolsController extends GetxController {
  ValueNotifier<List<ProtocolModel>> listProtocols = ValueNotifier([
    ProtocolModel(
      id: 1,
      status: 'Em Atendimento',
      protocolNumber: '32104420260225252240',
      userName: 'GABRIEL DUARTE RAMOS',
      beneficiaryName: 'GABRIEL DUARTE RAMOS',
      occurrenceType:
          'Relacionamento Com Cliente / Autorização / Autorização De Exames E Procedimentos / Emissão De Guias – Protocolos Automáticos',
      openDate: '25/02/2026',
      closeDate: '25/02/2026',
      occurrence: 'Emissão De Guias – Protocolos Automáticos',
      internalStatus: 'Ativo',
    ),
    ProtocolModel(
      id: 2,
      status: 'Em Atendimento',
      protocolNumber: '32104420260225251651',
      userName: 'GABRIEL DUARTE RAMOS',
      beneficiaryName: 'GABRIEL DUARTE RAMOS',
      occurrenceType: 'Relacionamento Com Cliente / Reclamação',
      openDate: '24/02/2026',
      closeDate: '---',
      occurrence: 'Acompanhamento de Solicitação',
      internalStatus: 'Ativo',
    ),
    ProtocolModel(
      id: 3,
      status: 'Finalizado',
      protocolNumber: '32104420260205932774',
      userName: 'GABRIEL DUARTE RAMOS',
      beneficiaryName: 'GABRIEL DUARTE RAMOS',
      occurrenceType: 'Emissão De Guias – Protocolos Automáticos',
      openDate: '20/02/2026',
      closeDate: '20/02/2026',
      occurrence: 'Emissão De Guias – Protocolos Automáticos',
      internalStatus: 'Encerrado',
    ),
    ProtocolModel(
      id: 4,
      status: 'Finalizado',
      protocolNumber: '32104420260203889522',
      userName: 'GABRIEL DUARTE RAMOS',
      beneficiaryName: 'GABRIEL DUARTE RAMOS',
      occurrenceType: 'Consulta de Rede Credenciada',
      openDate: '15/02/2026',
      closeDate: '15/02/2026',
      occurrence: 'Informação',
      internalStatus: 'Encerrado',
    ),
    ProtocolModel(
      id: 5,
      status: 'Finalizado',
      protocolNumber: '32104420260203889452',
      userName: 'GABRIEL DUARTE RAMOS',
      beneficiaryName: 'GABRIEL DUARTE RAMOS',
      occurrenceType: 'Financeiro / Boleto',
      openDate: '10/02/2026',
      closeDate: '10/02/2026',
      occurrence: 'Segunda Via de Boleto',
      internalStatus: 'Encerrado',
    ),
  ]);
}
