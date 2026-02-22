import 'dart:io';

import 'package:app_colabora_unimedjp/app/modules/utils/components/checkbox_app.component.dart';
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

class Step5FormAssistence extends StatelessWidget implements LiquidStep {
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
                value: 'Dados do reembolso',
                fontSize: 18,
                color: AppColor.pantone348C,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 8),
              SelectAppComponent(
                primaryColor: AppColor.pantone382C,
                enabledBorder: true,
                centerSelectedValue: false,
                labelText: 'Escolha o tipo de reembolso',
                menuItemData: [MenuItemData(label: 'ANESTESIA', value: '1')],
                onChanged: (value) {
                  ctrl.tipoReembolso.text = value;
                },
              ),
              SizedBox(height: 8),
              InputTextAppComponent(
                textEditingController: ctrl.email,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.emailAddress,
                labelText: "E-mail",
                hintText: "Informe o e-mail",
              ),
              SizedBox(height: 8),
              InputTextAppComponent(
                textEditingController: ctrl.telefone,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.phone,
                labelText: "Telefone",
                hintText: "Informe o telefone",
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  TelefoneInputFormatter(),
                ],
              ),
              SizedBox(height: 8),
              SelectAppComponent(
                primaryColor: AppColor.pantone382C,
                enabledBorder: true,
                centerSelectedValue: false,
                labelText: 'Escolha o motivo da solicitação',
                menuItemData: [
                  MenuItemData(
                    label: 'Indisponibilidade de rede Credenciada',
                    value: '1',
                  ),
                ],
                onChanged: (value) {
                  ctrl.motivo.text = value;
                },
              ),
              SizedBox(height: 8),
              InputTextAppComponent(
                textEditingController: ctrl.valorReembolso,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.emailAddress,
                labelText: "Quando será reembolsado?",
                hintText: "00,00",
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  RealInputFormatter(),
                ],
              ),
              SizedBox(height: 8),
              InputTextAppComponent(
                textEditingController: ctrl.descricao,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.text,
                labelText: "Descrição do reembolso",
                hintText: "Uma breve descrição do motivo do reembolso",
                minLines: 3,
                maxLines: 3,
                maxLength: 500,
              ),
              const SizedBox(height: 24),

              // Título Documentos
              TextAppComponent(
                value: 'Documentos necessários',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColor.pantone7722C,
              ),
              const SizedBox(height: 12),
              _buildBulletPoint("RG e CPF do plano"),
              _buildBulletPoint(
                "Documento com dados bancários (conta corrente ou poupança) para o crédito (cheque, extrato bancário, outros – conste Banco, Agencia e Conta) do titular do plano;",
              ),
              _buildBulletPoint(
                "Casos de menor de 18 anos (adoção): Documentos expedidos pelo poder judiciário atestando as aludidas situações – guarda definitiva, tutela ou curatela;",
              ),
              _buildBulletPoint("No caso de ser pessoa física: anexar recibo;"),
              _buildBulletPoint(
                "No caso de ser pessoa jurídica: anexar recibo e Nota Fiscal;",
              ),
              _buildBulletPoint("Pedido/Relatório Médico (CRM);"),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "Os tipos dos arquivos que podem ser anexados: .pdf, .jpeg, .jpg, .png ou .gif; O tamanho do arquivo não deve superar 5MB; Ressaltamos que toda documentação acima é obrigatória para a análise do Reembolso e deve ser enviada completa. Em caso de falta de documentação, será dado um prazo de 5 dias úteis para apresentação da pendência e não apresentando o processo será cancelado e arquivado.",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[700],
                    height: 1.4,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              InkWell(
                onTap: () {
                  ctrl.showAlertOptionsSelectFiles(context);
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ValueListenableBuilder(
                        valueListenable: ctrl.documentos,
                        builder: (context, List<File?> files, child) {
                          if (files.isNotEmpty) {
                            return TextAppComponent(
                              value:
                                  '${files.length} arquivo(s) selecionado(s)',
                              color: AppColor.pantone7722C,
                            );
                          }
                          return TextAppComponent(
                            value: "Selecionar arquivos",
                            color: AppColor.pantone7722C,
                          );
                        },
                      ),
                      Icon(Icons.upload, color: AppColor.pantone382C),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Texto LGPD/Declaração
              Text(
                "Declaro que os dados fornecidos por mim e coletados pela Unimed João Pessoa são inseridos diretamente por minha ação ou encaminhados ativamente ao utilizar o APP da Unimed João Pessoa para solicitar serviços virtuais... [Texto Completo da LGPD]",
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),

              const SizedBox(height: 16),
              Row(
                children: [
                  ValueListenableBuilder(
                    valueListenable: ctrl.termsEvent,
                    builder: (context, value, child) {
                      return CheckboxAppComponent(
                        initialValue: value,
                        onChanged: (value) {
                          ctrl.termsEvent.value = value!;
                        },
                        checkedBorderColor: AppColor.pantone382C,
                        iconColor: AppColor.pantone382C,
                      );
                    },
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextAppComponent(
                      value: "Aceito os termos e condições",
                      color: AppColor.pantone7722C,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Icon(Icons.circle, size: 8, color: AppColor.pantone7722C),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 14, height: 1.3),
            ),
          ),
        ],
      ),
    );
  }
}
