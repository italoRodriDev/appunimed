import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/scheduling/controller/scheduling.controller.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/text_app.component.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../utils/components/form_swipe.dart';
import '../../../../../utils/components/inputs/input_app.component.dart';
import '../../../../../utils/components/select_component_app.component.dart';

class Step1FormShedulingService extends StatelessWidget implements LiquidStep {
  final SchedulingController ctrl = Get.put(SchedulingController());
  final _formKey = GlobalKey<FormState>();

  @override
  bool validate() => _formKey.currentState?.validate() ?? false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      color: AppColor.background,
      height: MediaQuery.of(
        context,
      ).size.height, // Garante que o container preencha a tela
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextAppComponent(
                  value: 'Escolha um beneficiário',
                  fontSize: 18,
                  color: AppColor.pantone348C,
                  fontWeight: FontWeight.w600,
                ),

                SizedBox(height: 8),
                TextAppComponent(
                  value:
                      'Para solicitar é necessário escolher um beneficiário.',
                  fontSize: 16,
                  height: 1.5,
                ),
                SizedBox(height: 20),
                SelectAppComponent(
                  primaryColor: AppColor.pantone382C,
                  enabledBorder: true,
                  centerSelectedValue: false,
                  labelText: 'Beneficiário',
                  menuItemData: [
                    MenuItemData(
                      label: 'Italo Rodrigues dos Santos',
                      value: '1',
                    ),
                    MenuItemData(label: 'Maria da silva', value: '2'),
                  ],
                  onChanged: (value) {
                    ctrl.beneficiario.text = value;
                  },
                ),
                SizedBox(height: 8),
                InputTextAppComponent(
                  textEditingController: ctrl.altura,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.number,
                  labelText: "Altura",
                  hintText: "00.00",
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    AlturaInputFormatter(),
                  ],
                ),
                SizedBox(height: 8),
                InputTextAppComponent(
                  textEditingController: ctrl.peso,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.number,
                  labelText: "Peso",
                  hintText: "00.00",
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    PesoInputFormatter(),
                  ],
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
