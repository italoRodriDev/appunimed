import 'package:app_colabora_unimedjp/app/modules/recipient/finances/view/forms/assistance/step_1.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/finances/view/forms/assistance/step_2.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/finances/view/forms/assistance/step_3.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/finances/view/forms/assistance/step_4.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/finances/view/forms/assistance/step_5.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/finances/view/forms/send_solicitation_modal.dart';
import 'package:app_colabora_unimedjp/app/services/config.service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../utils/components/progress_app.component.dart';
import '../../../../utils/components/toolbars/toolbar_app.component.dart';
import '../../controller/financial.controller.dart';
import '../components/form_swipe.dart';

enum RefundType { financeiro, assistencial }

class RefundRequestPage extends StatelessWidget {
  final FinancialController ctrl = Get.put(FinancialController());
  ConfigService configService = Get.find<ConfigService>();
  final RefundType type;
  final LiquidController _controller = LiquidController();

  RefundRequestPage({super.key, required this.type});

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
              title: type == RefundType.assistencial
                  ? 'Reembolso assistencial'
                  : 'Reembolso financeiro',
            ),
          ),
        ),
        body: SmartLiquidForm(
          liquidSwipeController: _controller,
          labelButtonFinish: 'Enviar solicitação',
          steps: [
            Step1FormAssistence(),
            Step2FormAssistence(),
            Step3FormAssistence(),
            Step4FormAssistence(),
            Step5FormAssistence(),
          ],
          onFinish: () {
            ctrl.sendSolucitation();
          },
        ),
      ),
    );
  }
}
