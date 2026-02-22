import 'package:app_colabora_unimedjp/app/modules/recipient/finances/view/forms/financial/step_1.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/finances/view/forms/financial/step_2.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/finances/view/forms/financial/step_3.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/finances/view/forms/financial/step_4.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/finances/view/forms/financial/step_5.dart';
import 'package:app_colabora_unimedjp/app/services/config.service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../utils/components/progress_app.component.dart';
import '../../../../utils/components/toolbars/toolbar_app.component.dart';
import '../../controller/assistence_reimbursement.controller.dart';
import '../components/form_swipe.dart';

class FinancialReimbursementRequestPage extends StatelessWidget {
  final AssistenceReimbursementController ctrl = Get.put(
    AssistenceReimbursementController(),
  );
  ConfigService configService = Get.find<ConfigService>();
  final LiquidController _controller = LiquidController();

  FinancialReimbursementRequestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      color: Colors.black.withAlpha(40),
      isLoading: configService.isLoading,
      progressIndicator: ProgressAppComponent(),
      child: Scaffold(
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: Size(double.infinity, 0),
            child: ToolbarAppComponent(
              onPressedMenu: () {},
              showMenu: false,
              title: 'Reembolso financeiro',
            ),
          ),
        ),
        body: SafeArea(
          child: SmartLiquidForm(
            liquidSwipeController: _controller,
            labelButtonFinish: 'Enviar solicitação',
            steps: [
              Step1FormFinancial(),
              Step2FormFinancial(),
              Step3FormFinancial(),
              Step4FormFinancial(),
              Step5FormFinancial(),
            ],
            onFinish: () {
              ctrl.sendSolucitation();
            },
          ),
        ),
      ),
    );
  }
}
