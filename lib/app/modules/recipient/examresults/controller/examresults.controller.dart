import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../data/models/ticket_finances.model.dart';

class ExamResultsController extends GetxController {
  ValueNotifier<List<TicketFinancesModel>> listPeddings = ValueNotifier([]);
  ValueNotifier<List<TicketFinancesModel>> listPayments = ValueNotifier([]);

  @override
  void onInit() {
    listPeddings.value.addAll([
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

    listPayments.value.addAll([
      TicketFinancesModel(
        status: 'Pago',
        dueDate: DateTime.now().toIso8601String(),
        paymentDate: DateTime.now().toIso8601String(),
        value: '300 R\$',
      ),
      TicketFinancesModel(
        status: 'Pago',
        dueDate: DateTime.now().toIso8601String(),
        paymentDate: DateTime.now().toIso8601String(),
        value: '400 R\$',
      ),
      TicketFinancesModel(
        status: 'Pago',
        dueDate: DateTime.now().toIso8601String(),
        paymentDate: DateTime.now().toIso8601String(),
        value: '600 R\$',
      ),
    ]);
    super.onInit();
  }
}
