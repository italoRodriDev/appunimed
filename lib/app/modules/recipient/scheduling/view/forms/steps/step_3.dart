import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/calendar_app.component.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/text_app.component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/components/form_swipe.dart';
import '../../../../../utils/components/radio_app.component.dart';
import '../../../controller/scheduling.controller.dart';

class Step3FormShedulingService extends StatelessWidget implements LiquidStep {
  final SchedulingController ctrl = Get.put(SchedulingController());
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
                  value: 'Consultas',
                  fontSize: 18,
                  color: AppColor.pantone348C,
                  fontWeight: FontWeight.w600,
                ),

                SizedBox(height: 8),
                TextAppComponent(
                  value: 'Selecione a consulta que deseja realizar.',
                  fontSize: 16,
                  height: 1.5,
                ),
                SizedBox(height: 20),
                buildConsultantionUnavailable(),
                RadioGroupApp(
                  options: [
                    'Aplicação de Medicamento',
                    'Clínica Médica/Pediatria - Acesso Avançado',
                    'Curativo',
                    'Enfermage Obstétrica',
                    'Especialidades Médicas',
                    'Exame Citológico',
                  ],
                  onChanged: (value) {},
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildWarningHour() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.amber, width: 1),
          ),
          child: Column(
            children: [
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.amber,
                ),
                child: TextAppComponent(
                  value: 'ATENÇÃO',
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsetsGeometry.only(left: 10, right: 10),
                child: TextAppComponent(
                  textAlign: TextAlign.center,
                  color: AppColor.mediumSecondary,
                  value:
                      'Informamos que os horários de funcionamento do atendimento digital já foi encerrado.',
                ),
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
        SizedBox(height: 20),
        TextAppComponent(
          value: 'Horários de funcionamento',
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: AppColor.pantone348C,
        ),
        SizedBox(height: 8),
        TextAppComponent(
          value: 'Clínica Médica - Todos os dias: 7hrs as 19hrs.',
        ),
        SizedBox(height: 8),
        TextAppComponent(value: 'Pediatria - Todos os dias: 7hrs as 19hrs.'),
        SizedBox(height: 8),
        TextAppComponent(value: 'Sábado - 7hrs as 13hrs.'),
        SizedBox(height: 8),
        TextAppComponent(
          value:
              'Em outros horários, orientamos procurar\n atendimento presencial em nossa rede. Para mais detalhes, consulte o guia médico.',
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Spacer(),
            TextButton(
              onPressed: () {},
              child: TextAppComponent(
                value: 'Consultar Guia Médico',
                decoration: TextDecoration.underline,
                color: AppColor.pantone382C,
              ),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }

  Widget buildConsultantionUnavailable() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.amber, width: 1),
          ),
          child: Column(
            children: [
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.amber,
                ),
                child: TextAppComponent(
                  value: 'ATENÇÃO',
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsetsGeometry.only(left: 10, right: 10),
                child: TextAppComponent(
                  textAlign: TextAlign.center,
                  color: AppColor.mediumSecondary,
                  value:
                      'Infelizmente, não encontramos datas livres. Você pode tentar novamente em alguns dias.',
                ),
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
