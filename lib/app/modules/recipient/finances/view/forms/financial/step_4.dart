import 'package:app_colabora_unimedjp/app/modules/utils/components/select_component_app.component.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../../config/colors/colors.dart';
import '../../../../../utils/components/form_swipe.dart';
import '../../../../../utils/components/inputs/input_app.component.dart';
import '../../../../../utils/components/text_app.component.dart';
import '../../../controller/financial_reimbursement.controller.dart';

class Step4FormFinancial extends StatelessWidget implements LiquidStep {
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
                value: 'Dados bancários',
                fontSize: 18,
                color: AppColor.pantone348C,
                fontWeight: FontWeight.w600,
              ),

              InputTextAppComponent(
                textEditingController: ctrl.nome,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.name,
                labelText: "Nome",
                hintText: "Informe seu nome completo",
              ),
              SizedBox(height: 8),
              InputTextAppComponent(
                textEditingController: ctrl.cpfConta,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.number,
                labelText: "CPF",
                hintText: "Informe o CPF",
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  CpfInputFormatter(),
                ],
              ),
              SizedBox(width: 8),
              Row(
                children: [
                  Expanded(
                    child: InputTextAppComponent(
                      textEditingController: ctrl.agencia,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.number,
                      labelText: "Agência",
                      hintText: "0000",
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CpfInputFormatter(),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: InputTextAppComponent(
                      textEditingController: ctrl.conta,
                      textInputAction: TextInputAction.next,
                      textInputType: TextInputType.number,
                      labelText: "Conta",
                      hintText: "000000000",
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        CpfInputFormatter(),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(width: 8),
              SelectAppComponent(
                primaryColor: AppColor.pantone382C,
                enabledBorder: true,
                centerSelectedValue: false,
                labelText: 'Banco',
                menuItemData: [
                  MenuItemData(label: 'Banco do Brasil', value: '1'),
                  MenuItemData(label: 'NuBank', value: '2'),
                ],
                onChanged: (value) {
                  ctrl.banco.text = value;
                },
              ),
              SizedBox(width: 8),
              SelectAppComponent(
                primaryColor: AppColor.pantone382C,
                enabledBorder: true,
                centerSelectedValue: false,
                labelText: 'Tipo de conta',
                menuItemData: [
                  MenuItemData(label: 'Conta Corrente', value: '1'),
                  MenuItemData(label: 'Conta Poupança', value: '2'),
                ],
                onChanged: (value) {
                  ctrl.tipoConta.text = value;
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
