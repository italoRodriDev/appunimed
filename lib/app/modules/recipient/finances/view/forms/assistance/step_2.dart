import 'package:app_colabora_unimedjp/app/modules/utils/components/select_component_app.component.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../../config/colors/colors.dart';
import '../../../../../utils/components/inputs/input_app.component.dart';
import '../../../../../utils/components/text_app.component.dart';
import '../../../controller/financial_reimbursement.controller.dart';
import '../../../../../utils/components/form_swipe.dart';

class Step2FormAssistence extends StatelessWidget implements LiquidStep {
  final FinancialReimbursementController ctrl = Get.put(
    FinancialReimbursementController(),
  );
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
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextAppComponent(
                value: 'Confirme suas informações',
                fontSize: 18,
                color: AppColor.pantone348C,
                fontWeight: FontWeight.w600,
              ),

              SizedBox(height: 20),
              InputTextAppComponent(
                textEditingController: ctrl.rg,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.number,
                labelText: "RG",
                hintText: "Informe o RG",
              ),
              SizedBox(height: 8),
              InputTextAppComponent(
                textEditingController: ctrl.cpf,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.number,
                labelText: "CPF",
                hintText: "Informe o CPF",
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CpfInputFormatter(),
                ],
              ),
              SizedBox(height: 8),
              SelectAppComponent(
                primaryColor: AppColor.pantone382C,
                enabledBorder: true,
                centerSelectedValue: false,
                labelText: 'Para qual beneficíario será o reembolso?',
                menuItemData: [
                  MenuItemData(label: 'Italo Rodrigues dos Santos', value: '1'),
                  MenuItemData(label: 'Maria da silva', value: '2'),
                ],
                onChanged: (value) {
                  ctrl.beneficiario.text = value;
                },
              ),
              SizedBox(height: 8),
              SelectAppComponent(
                primaryColor: AppColor.pantone382C,
                enabledBorder: true,
                labelText: 'De quem será a conta de pagamento?',
                menuItemData: [
                  MenuItemData(label: 'Conta do titular', value: '1'),
                  MenuItemData(label: 'Conta de terceiro', value: '2'),
                ],
                onChanged: (value) {
                  ctrl.tipoInfoBancaria.text = value;
                },
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
