import 'package:app_colabora_unimedjp/app/modules/recipient/finances/controller/finances.controller.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/finances/view/components/card_service_finances.component.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/finances/view/forms/financial_reimbursement_request.dart';
import 'package:app_colabora_unimedjp/app/routers/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/fonts/fonts.dart';
import '../../../utils/components/text_app.component.dart';
import '../../../utils/components/toolbars/toolbar_app.component.dart';
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
        child: Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: SingleChildScrollView(
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
                  value: 'Aqui você pode acessar nossos serviços financeiros.',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8),

                Divider(height: 0, color: AppColor.neutral2),
                CardServiceFinancesComponent(
                  title: 'Boletos',
                  subtitle: 'Acessar',
                  onPressed: () {
                    Get.toNamed(RoutesApp.SLIPS);
                  },
                ),
                CardServiceFinancesComponent(
                  title: 'Acompanhar reembolsos',
                  subtitle: 'Acessar',
                  onPressed: () {
                    Get.toNamed(RoutesApp.TRACK_REFUND);
                  },
                ),
                CardServiceFinancesComponent(
                  title: 'Reembolso assistencial',
                  subtitle: 'Solicitar',
                  onPressed: () {
                    Get.to(() => AssistenceReimbursementRequestPage());
                  },
                ),
                CardServiceFinancesComponent(
                  title: 'Reembolso financeiro',
                  subtitle: 'Solicitar',
                  onPressed: () {
                    Get.to(() => FinancialReimbursementRequestPage());
                  },
                ),

                CardServiceFinancesComponent(
                  title: 'Fatura Digital',
                  subtitle: 'Configurar',
                  onPressed: () {
                    Get.toNamed(RoutesApp.DIGITAL_INVOICES);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
