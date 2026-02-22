import 'dart:io';

import 'package:app_colabora_unimedjp/app/modules/utils/components/button_app.component.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../../../../config/colors/colors.dart';
import '../../../../../utils/components/form_swipe.dart';
import '../../../../../utils/components/text_app.component.dart';
import '../../../controller/financial_reimbursement.controller.dart';

class Step3FormFinancial extends StatelessWidget implements LiquidStep {
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
                value: 'Formulário de autorização',
                fontSize: 18,
                color: AppColor.pantone348C,
                fontWeight: FontWeight.w600,
              ),
              Column(
                children: [
                  TextAppComponent(
                    value:
                        'Baixe o formulário de autorização do termo F(NG).RC.1742 e anexe no app.',
                    color: AppColor.neutral1,
                    fontWeight: FontWeight.w600,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: ButtonAppComponent(
                          borderRadius: 100,
                          color: AppColor.pantone382C,
                          onPressed: () {},
                          label: 'Baixar formulário de autorização',
                          padding: EdgeInsetsGeometry.symmetric(
                            horizontal: 10,
                            vertical: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      color: AppColor.neutral4,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      border: Border.all(color: AppColor.neutral2),
                    ),
                    child: ValueListenableBuilder(
                      valueListenable: ctrl.formularioAutorizacao,
                      builder: (context, File? file, child) {
                        if (file != null) {
                          return Stack(
                            children: [
                              Stack(
                                children: [
                                  SizedBox(
                                    height: 300,
                                    width: double.infinity,
                                    child: SfPdfViewer.file(file),
                                  ),
                                  Positioned.fill(
                                    child: Center(
                                      child: Column(
                                        children: [
                                          Spacer(),
                                          ButtonAppComponent(
                                            borderRadius: 100,
                                            onPressed: () {
                                              ctrl.pickPdf('FORMULARIO');
                                            },
                                            label: 'Anexar outro PDF',
                                            padding:
                                                EdgeInsetsGeometry.symmetric(
                                                  horizontal: 10,
                                                  vertical: 10,
                                                ),
                                          ),
                                          Spacer(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        }
                        return Stack(
                          children: [
                            SizedBox(height: 300, width: double.infinity),
                            Positioned.fill(
                              child: Center(
                                child: Column(
                                  children: [
                                    Spacer(),
                                    TextAppComponent(
                                      value: 'Já preencheu o formulário?',
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.pantone7722C,
                                      fontSize: 18,
                                    ),
                                    TextAppComponent(
                                      value:
                                          'Depois de preecher basta anexar o PDF aqui.',
                                      color: AppColor.pantone1585C,
                                    ),
                                    ButtonAppComponent(
                                      borderRadius: 100,
                                      onPressed: () {
                                        ctrl.pickPdf('FORMULARIO');
                                      },
                                      label: 'Anexar PDF',
                                      padding: EdgeInsetsGeometry.symmetric(
                                        horizontal: 10,
                                        vertical: 10,
                                      ),
                                    ),
                                    Spacer(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      },
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
}
