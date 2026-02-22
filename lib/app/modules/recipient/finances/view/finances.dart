import 'package:app_colabora_unimedjp/app/modules/recipient/finances/controller/finances.controller.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/finances/view/components/card_service_finances.component.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/finances/view/forms/financial_reimbursement_request.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/tab_app.component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/fonts/fonts.dart';
import '../../../../data/models/found.model.dart';
import '../../../utils/components/text_app.component.dart';
import '../../../utils/components/toolbars/toolbar_app.component.dart';
import 'components/card_refund.component.dart';
import 'forms/assistence_reimbursement_request.dart';

class FinancesPage extends GetView<FinancesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 0),
          child: ToolbarAppComponent(
            onPressedMenu: () {},
            showMenu: false,
            title: 'Financeiro',
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: 10),
            child: TabsAppComponent(
              fontSize: 14,
              titlesTabs: ['Meus reembolsos', 'Serviços'],
              contentTabs: [buildMyRefunds(), buildTabServices()],
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

          CardServiceFinancesComponent(
            title: 'Reembolso financeiro',
            subtitle: 'Solicitar',
            onPressed: () {
              toFormSolicitationFinancial();
            },
          ),
          CardServiceFinancesComponent(
            title: 'Reembolso assistencial',
            subtitle: 'Solicitar',
            onPressed: () {
              toFormSolicitationAssistence();
            },
          ),
        ],
      ),
    );
  }

  toFormSolicitationFinancial() {
    Get.to(() => FinancialReimbursementRequestPage());
  }

  toFormSolicitationAssistence() {
    Get.to(() => AssistenceReimbursementRequestPage());
  }

  Widget buildMyRefunds() {
    return Column(
      children: [
        TextAppComponent(
          value: 'Seus reembolsos',
          textAlign: TextAlign.center,
          fontFamily: AppFont.UnimedSlab,
          fontWeight: FontWeight.w600,
          color: AppColor.pantone348C,
          fontSize: 22,
        ),
        SizedBox(height: 8),
        TextAppComponent(
          textAlign: TextAlign.center,
          value: 'Aqui você pode visualizar seus reembolsos.',
        ),
        SizedBox(height: 8),

        Divider(height: 0, color: AppColor.neutral2),
        for (var i = 0; i < 5; i++)
          CardFoundComponent(
            data: FoundModel(
              id: 0,
              title: 'Obstetricia',
              date: '21/02/2026',
              value: '233 R\$',
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
