import 'package:app_colabora_unimedjp/app/modules/recipient/finances/view/forms/assistance/step_1.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/finances/view/forms/assistance/step_2.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/finances/view/forms/assistance/step_3.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/finances/view/forms/assistance/step_4.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/finances/view/forms/assistance/step_5.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/finances/view/forms/send_solicitation_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

import '../../../../utils/components/toolbars/toolbar_app.component.dart';
import '../components/form_swipe.dart';

enum RefundType { financeiro, assistencial }

class RefundRequestPage extends StatelessWidget {
  final RefundType type;
  final LiquidController _controller = LiquidController();

  RefundRequestPage({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Get.back();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SendSolicitationModal()),
          );
        },
      ),
    );
  }
}
