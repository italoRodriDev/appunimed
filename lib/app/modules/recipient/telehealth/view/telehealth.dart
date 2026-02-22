import 'package:app_colabora_unimedjp/app/data/models/telehealth.model.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/finances/view/forms/financial_reimbursement_request.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/telehealth/controller/telehealth.controller.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/telehealth/view/components/card_service_telehealth.component.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/telehealth/view/components/card_telehealth_consultantion.component.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/telehealth/view/forms/promptservice_request.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/telehealth/view/forms/teleconsultation_request.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/tab_app.component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/fonts/fonts.dart';
import '../../../utils/components/text_app.component.dart';
import '../../../utils/components/toolbars/toolbar_app.component.dart';

class TeleHealthPage extends GetView<TeleHealthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 0),
          child: ToolbarAppComponent(
            onPressedMenu: () {},
            showMenu: false,
            title: 'TeleSaúde',
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: TabsAppComponent(
              fontSize: 14,
              titlesTabs: ['Meus agendamentos', 'Serviços'],
              contentTabs: [buildMyAppointments(), buildTabServices()],
              onChangeIndex: (index) {},
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTabServices() {
    return Padding(
      padding: EdgeInsetsGeometry.all(10),
      child: Column(
        children: [
          TextAppComponent(
            value: 'Nossos serviços',
            fontFamily: AppFont.UnimedSlab,
            fontWeight: FontWeight.w600,
            color: AppColor.pantone348C,
            fontSize: 22,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          TextAppComponent(
            value: 'Aqui você pode solicitar um dos nossos serviços.',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),

          Divider(height: 0, color: AppColor.neutral2),

          CardServiceTelehealthComponent(
            title: 'Pronto atendimento digital',
            subtitle: 'Solicitar',
            onPressed: () {
              toFormSolicitationPromptService();
            },
          ),
          CardServiceTelehealthComponent(
            title: 'Teleconsulta',
            subtitle: 'Solicitar',
            onPressed: () {
              toFormSolicitationTeleConsultation();
            },
          ),
        ],
      ),
    );
  }

  toFormSolicitationTeleConsultation() {
    Get.to(() => TeleConsultationRequestPage());
  }

  toFormSolicitationPromptService() {
    Get.to(() => PromptServiceRequestPage());
  }

  Widget buildMyAppointments() {
    return Column(
      children: [
        TextAppComponent(
          value: 'Seus agendamentos',
          textAlign: TextAlign.center,
          fontFamily: AppFont.UnimedSlab,
          fontWeight: FontWeight.w600,
          color: AppColor.pantone348C,
          fontSize: 22,
        ),
        SizedBox(height: 8),
        TextAppComponent(
          textAlign: TextAlign.center,
          value: 'Aqui você pode visualizar seus agendamentos.',
        ),
        SizedBox(height: 8),

        Divider(height: 0, color: AppColor.neutral2),
        for (var i = 0; i < 5; i++)
          CardTeleHealthConsultantionComponent(
            data: TeleHealtModel(
              id: 0,
              title: 'Dentista',
              date: '21/02/2026',
              type: 'Pronto Atendimento',
            ),
          ),

        /* 
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: controller.listFAQs,
                builder: (context, items, child) {
                  if (items.isNotEmpty) {
                    return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return CardFaqComponent(data: item);
                      },
                    );
                  }
                  if (items.isEmpty) {
                    InfoListClearAppComponent(
                      message: 'Respostas indisponíveis no momento.',
                    );
                  }

                  return ProgressAppComponent();
                },
              ),
            ),
            
            Divider(height: 0, color: AppColor.neutral2),
            */
      ],
    );
  }
}
