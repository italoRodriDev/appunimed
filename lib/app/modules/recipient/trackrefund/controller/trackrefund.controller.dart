import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../data/models/ticket_finances.model.dart';

class TrackRefundController extends GetxController {
  ValueNotifier<List<TicketFinancesModel>> listOpens = ValueNotifier([]);
  ValueNotifier<List<TicketFinancesModel>> listFinished = ValueNotifier([]);

  @override
  void onInit() {
    listOpens.value.addAll([
      TicketFinancesModel(
        status: 'Aberto',
        dueDate: DateTime.now().toIso8601String(),
        paymentDate: DateTime.now().toIso8601String(),
        value: '300 R\$',
      ),
      TicketFinancesModel(
        status: 'Aberto',
        dueDate: DateTime.now().toIso8601String(),
        paymentDate: DateTime.now().toIso8601String(),
        value: '400 R\$',
      ),
      TicketFinancesModel(
        status: 'Aberto',
        dueDate: DateTime.now().toIso8601String(),
        paymentDate: DateTime.now().toIso8601String(),
        value: '600 R\$',
      ),
    ]);

    listFinished.value.addAll([
      TicketFinancesModel(
        status: 'Finalizado',
        dueDate: DateTime.now().toIso8601String(),
        paymentDate: DateTime.now().toIso8601String(),
        value: '300 R\$',
      ),
      TicketFinancesModel(
        status: 'Finalizado',
        dueDate: DateTime.now().toIso8601String(),
        paymentDate: DateTime.now().toIso8601String(),
        value: '400 R\$',
      ),
      TicketFinancesModel(
        status: 'Finalizado',
        dueDate: DateTime.now().toIso8601String(),
        paymentDate: DateTime.now().toIso8601String(),
        value: '600 R\$',
      ),
    ]);
    super.onInit();
  }
}
