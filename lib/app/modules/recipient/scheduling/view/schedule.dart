import 'package:app_colabora_unimedjp/app/data/models/telehealth.model.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/scheduling/view/components/card_units_scheduling.component.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/scheduling/view/forms/scheduling_request.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/telehealth/controller/telehealth.controller.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/telehealth/view/components/card_telehealth_consultantion.component.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/tab_app.component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/fonts/fonts.dart';
import '../../../utils/components/text_app.component.dart';
import '../../../utils/components/toolbars/toolbar_app.component.dart';

class SchedulingPage extends GetView<TeleHealthController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 0),
          child: ToolbarAppComponent(
            onPressedMenu: () {},
            showMenu: false,
            title: 'Agendamento',
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: TabsAppComponent(
              fontSize: 14,
              titlesTabs: ['Meus agendamentos', 'Unidades'],
              contentTabs: [buildMyAppointments(), buildTabUnits()],
              onChangeIndex: (index) {},
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTabUnits() {
    return Padding(
      padding: EdgeInsetsGeometry.all(10),
      child: Column(
        children: [
          TextAppComponent(
            value: 'Nossas Unidades',
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

          CardUnitsSchedulingComponent(
            title: 'Centro Médico Unimed',
            location: 'Zona Sul',
            subtitle: 'Solicitar',
            onPressed: () {
              toFormSolicitationServiceUnit();
            },
          ),
          CardUnitsSchedulingComponent(
            title: 'Espaço vida',
            location: 'Centro',
            subtitle: 'Solicitar',
            onPressed: () {
              toFormSolicitationServiceUnit();
            },
          ),
          CardUnitsSchedulingComponent(
            title: 'Hospital Alberto Urquiza Wanderley',
            location: 'Centro',
            subtitle: 'Solicitar',
            onPressed: () {
              toFormSolicitationServiceUnit();
            },
          ),
        ],
      ),
    );
  }

  toFormSolicitationServiceUnit() {
    Get.to(() => SchedulingRequestPage());
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
