import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/updateaccount/controller/update_account.controller.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/inputs/input_app.component.dart';
import 'package:app_colabora_unimedjp/app/services/config.service.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../utils/components/button_app.component.dart';
import '../../../../utils/components/progress_app.component.dart';
import '../../../../utils/components/toolbars/toolbar_app.component.dart';

class UpdateAddressModal extends StatefulWidget {
  UpdateAddressModal({super.key});

  @override
  State<UpdateAddressModal> createState() => _UpdateAddressModalState();
}

class _UpdateAddressModalState extends State<UpdateAddressModal> {
  final ConfigService configService = Get.put(ConfigService());
  final UpdateAccountController ctrl = Get.put(UpdateAccountController());
  final GlobalKey key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isLoading = configService.isLoading;
      return LoadingOverlay(
        isLoading: isLoading,
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
                              text: " endereço.",
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
                    SizedBox(
                      height: 620,
                      child: ValueListenableBuilder(
                        valueListenable: ctrl.apiCepData,
                        builder: (context, data, child) {
                          if (data != null) {
                            return form(
                              enableRoad: true,
                              enableNeighborhood: true,
                              enableNumber: true,
                              enableComplement: true,
                            );
                          } else {
                            return form(
                              enableRoad: false,
                              enableNeighborhood: false,
                              enableNumber: false,
                              enableComplement: false,
                            );
                          }
                        },
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
                                        ctrl.validFormAddress(context: context);
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
      );
    });
  }

  Widget form({
    required bool enableRoad,
    required bool enableNeighborhood,
    required bool enableNumber,
    required bool enableComplement,
  }) {
    return Form(
      key: key,
      child: Column(
        children: [
          SizedBox(height: 30),
          InputTextAppComponent(
            textEditingController: ctrl.editTextCepCtrl,
            onChanged: (value) {
              ctrl.searchCep(context);
            },
            onSubmitted: (value) {
              ctrl.searchCep(context);
            },
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CepInputFormatter(),
            ],
            labelText: 'CEP',
            textInputType: TextInputType.number,
            hintText: 'Informe o CEP',
            textInputAction: TextInputAction.next,
            maxLines: 8,
          ),
          SizedBox(height: 8),
          InputTextAppComponent(
            textEditingController: ctrl.editTextRoadCtrl,
            labelText: 'Rua',
            hintText: 'Informe o nome da rua',
            textInputAction: TextInputAction.next,
            maxLength: 500,
            enabled: enableRoad,
          ),
          SizedBox(height: 8),
          InputTextAppComponent(
            textEditingController: ctrl.editTextNeighborhoodCtrl,
            labelText: 'Bairro',
            hintText: 'Informe o nome do bairro',
            textInputAction: TextInputAction.next,
            maxLength: 100,
            enabled: enableNeighborhood,
          ),
          SizedBox(height: 8),
          InputTextAppComponent(
            textEditingController: ctrl.editTextNumberCtrl,
            labelText: 'Número',
            textInputType: TextInputType.number,
            hintText: 'Informe o número',
            textInputAction: TextInputAction.next,
            maxLength: 10,
            enabled: enableNumber,
          ),
          SizedBox(height: 8),
          InputTextAppComponent(
            textEditingController: ctrl.editTextCityCtrl,
            labelText: 'Cidade',
            hintText: 'Cidade',
            textInputAction: TextInputAction.next,
            maxLength: 100,
            enabled: false,
          ),
          SizedBox(height: 8),
          InputTextAppComponent(
            textEditingController: ctrl.editTextStateCtrl,
            labelText: 'Estado',
            hintText: 'Estado',
            textInputAction: TextInputAction.next,
            maxLength: 100,
            enabled: false,
          ),
          SizedBox(height: 8),
          InputTextAppComponent(
            textEditingController: ctrl.editTextComplementCtrl,
            labelText: 'Complemento',
            hintText: 'Complemento',
            textInputAction: TextInputAction.next,
            maxLength: 100,
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
