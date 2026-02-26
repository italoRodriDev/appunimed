import 'package:app_colabora_unimedjp/app/modules/recipient/updateaccount/controller/update_account.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../../config/colors/colors.dart';
import '../../../../../services/config.service.dart';
import '../../../../utils/components/button_app.component.dart';
import '../../../../utils/components/inputs/input_app.component.dart';
import '../../../../utils/components/progress_app.component.dart';
import '../../../../utils/components/toolbars/toolbar_app.component.dart';

class UpdateEmailModal extends StatefulWidget {
  UpdateEmailModal({super.key});

  @override
  State<UpdateEmailModal> createState() => _UpdateEmailModalState();
}

class _UpdateEmailModalState extends State<UpdateEmailModal> {
  final ConfigService configService = Get.put(ConfigService());
  final UpdateAccountController ctrl = Get.put(UpdateAccountController());
  final GlobalKey key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isLoading = configService.isLoading;
      return LoadingOverlay(
        isLoading: isLoading,
        color: Colors.white,
        progressIndicator: ProgressAppComponent(),
        child: Scaffold(
          appBar: AppBar(
            bottom: PreferredSize(
              preferredSize: Size(double.infinity, 0),
              child: ToolbarAppComponent(
                onPressedMenu: () {},
                title: 'Atualização cadastral',
                showMenu: false,
              ),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsetsGeometry.all(16),
                child: Form(
                  key: key,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 500,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsetsGeometry.only(
                                left: 10,
                                right: 10,
                                top: 10,
                              ),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: AppColor.pantone348C,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: "Informe seu novo",
                                      style: TextStyle(height: 0.96),
                                    ),
                                    TextSpan(
                                      text: " e-mail.",
                                      style: TextStyle(
                                        height: 0.96,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.pantone348C,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 30),
                            SizedBox(height: 8),
                            InputTextAppComponent(
                              textEditingController: ctrl.editTextEmailCtrl,
                              labelText: 'E-mail',
                              textInputType: TextInputType.emailAddress,
                              maxLength: 15,
                              hintText: 'Informe seu e-mail',
                              textInputAction: TextInputAction.next,
                            ),
                            SizedBox(height: 8),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsGeometry.symmetric(vertical: 50),
                        child: Row(
                          children: [
                            Expanded(
                              child: SizedBox(
                                height: 42,
                                child: isLoading == false
                                    ? ButtonAppComponent(
                                        label: "Solicitar atualização",
                                        color: AppColor.pantone348C,
                                        textColor: Colors.white,
                                        padding: const EdgeInsets.all(0),
                                        onPressed: () {
                                          ctrl.validFormEmail(context: context);
                                        },
                                      )
                                    : Container(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
