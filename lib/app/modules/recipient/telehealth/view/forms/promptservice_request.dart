import 'package:app_colabora_unimedjp/app/modules/recipient/telehealth/controller/promptservice.controller.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/telehealth/view/forms/promptservice/step_1.dart';
import 'package:app_colabora_unimedjp/app/services/config.service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../utils/components/form_swipe.dart';
import '../../../../utils/components/progress_app.component.dart';
import '../../../../utils/components/toolbars/toolbar_app.component.dart';

class PromptServiceRequestPage extends StatelessWidget {
  final PromptServiceController ctrl = Get.put(PromptServiceController());
  ConfigService configService = Get.find<ConfigService>();
  final LiquidController _controller = LiquidController();

  PromptServiceRequestPage({super.key});

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
              title: 'Pronto atendimento',
            ),
          ),
        ),
        body: SafeArea(
          child: SmartLiquidForm(
            liquidSwipeController: _controller,
            labelButtonFinish: 'Enviar solicitação',
            steps: [Step1FormPromptService()],
            onFinish: () {},
          ),
        ),
      ),
    );
  }
}
