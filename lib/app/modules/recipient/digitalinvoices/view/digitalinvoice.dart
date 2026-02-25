import 'package:app_colabora_unimedjp/app/modules/recipient/digitalinvoices/controller/digitainvoices.controller.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/button_app.component.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/radio_app.component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/colors/colors.dart';
import '../../../utils/components/text_app.component.dart';
import '../../../utils/components/toolbars/toolbar_app.component.dart';

class DigitalInvoicePage extends GetView<DigitalInvoicesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 0),
          child: ToolbarAppComponent(
            onPressedMenu: () {},
            showMenu: false,
            title: 'Fatura digital',
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 8),
              TextAppComponent(
                value: 'Patricidade para seu dia a dia',
                fontSize: 18,
                color: AppColor.pantone348C,
                fontWeight: FontWeight.w600,
              ),

              SizedBox(height: 8),

              Padding(padding: EdgeInsetsGeometry.all(16), child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    height: 1.5,
                  ),
                  children: [
                    TextSpan(text: 'Prezado(a) cliente, que tal acessar '),
                    TextSpan(
                      text:
                          'sua fatura do plano de saúde da Unimed João Pessoa ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: 'de onde você estiver.'),
                  ],
                ),
              )),
              SizedBox(height: 8),
              Container(
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColor.pantone382C.withAlpha(60),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        TextAppComponent(
                          value: 'Vantagens',
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                          color: AppColor.pantone7722C,
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        TextAppComponent(
                          value: 'Facilidade: ',
                          fontWeight: FontWeight.w800,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TextAppComponent(value: 'Receber a fatura por e-mail.'),
                      ],
                    ),

                    Row(
                      children: [
                        TextAppComponent(
                          value: 'Patricidade: ',
                          fontWeight: FontWeight.w800,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TextAppComponent(
                          value: 'Acessar a qualquer hora e em qualquer lugar.',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsetsGeometry.all(10),
                child: RadioGroupApp(options: ['Sim', 'Não']),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsetsGeometry.all(16),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: ButtonStylizedAppComponent(
                            onPressed: () {},
                            color: AppColor.danger,
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 2,
                            ),
                            label: TextAppComponent(
                              value: 'Cancelar adesão',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ButtonStylizedAppComponent(
                            onPressed: () {},
                            color: AppColor.pantone382C,
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 2,
                            ),
                            label: TextAppComponent(
                              value: 'Confirmar adesão',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColor.pantone7722C,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
