import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/radio_app.component.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/text_app.component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/components/calendar_app.component.dart';
import '../../../../../utils/components/form_swipe.dart';
import '../../../controller/teleconsultation.controller.dart';

class Step4FormTeleConsultation extends StatelessWidget implements LiquidStep {
  final TeleConsultationController ctrl = Get.put(TeleConsultationController());
  final _formKey = GlobalKey<FormState>();

  @override
  bool validate() => _formKey.currentState?.validate() ?? false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      color: AppColor.background,
      height: MediaQuery.of(
        context,
      ).size.height, // Garante que o container preencha a tela
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextAppComponent(
                  value: 'Data de atendimento',
                  fontSize: 18,
                  color: AppColor.pantone348C,
                  fontWeight: FontWeight.w600,
                ),

                SizedBox(height: 8),
                TextAppComponent(
                  value:
                      'Selecione uma data no calendário para realizar sua teleconsulta.',
                  fontSize: 16,
                  height: 1.5,
                ),
                SizedBox(height: 20),
                CalendarPickerAppComponent(
                  showHour: true, // Mude para false para ignorar a hora
                  blockedDates: [DateTime(2026, 2, 25), DateTime(2026, 2, 26)],
                  unavailableHours: [
                    DateTime(2026, 02, 22, 14, 00), // Domingo às 14:00 ocupado
                    DateTime(2026, 02, 22, 14, 30), // Domingo às 14:30 ocupado
                  ],
                  onConfirm: (date, time) {
                    print("Data: $date, Hora: $time");
                  },
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
