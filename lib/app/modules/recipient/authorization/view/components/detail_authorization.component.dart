import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:app_colabora_unimedjp/app/data/models/authorization.model.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/text_app.component.dart';
import 'package:flutter/material.dart';

import '../../../../utils/components/toolbars/toolbar_app.component.dart';
import '../../../../utils/extensions/date_time_extensions.dart';

class DetailAuthorizationModal extends StatelessWidget {
  AuthorizationModel data;
  DetailAuthorizationModal({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 0),
          child: ToolbarAppComponent(
            onPressedMenu: () {},
            showMenu: false,
            title: 'Detalhes da Autorização',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.neutral3,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  TextAppComponent(value: '33343434'),
                  TextAppComponent(
                    value: 'NÚMERO DA GUIA',
                    fontWeight: FontWeight.w800,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.neutral3,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  buildInfo(title: 'Tipo de Solição', subtitle: 'Exame'),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          buildInfo(
                            title: 'Validade',
                            subtitle: formatterDate(
                              DateTime.now().toIso8601String(),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          buildInfo(
                            title: 'Tipo de Solição',
                            subtitle: formatterDate(
                              DateTime.now().toIso8601String(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  buildInfo(title: 'Solicitante', subtitle: 'ITALO R. SANTOS'),
                  SizedBox(height: 10),
                  buildInfo(title: 'Beneficiário', subtitle: 'ITALO R. SANTOS'),
                  SizedBox(height: 10),
                  buildInfo(
                    title: 'Especialidade',
                    subtitle: 'CIRURGIA DA MAO - ESP',
                  ),
                  SizedBox(height: 10),
                  buildInfo(title: 'Situação', subtitle: 'LIBERADA'),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.neutral3,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      TextAppComponent(
                        value: 'RM - ARTICULAR (POR ARTICULACAO)',
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                        color: AppColor.pantone7722C,
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          buildInfo(title: 'Código', subtitle: '383833'),
                        ],
                      ),
                      Column(
                        children: [
                          buildInfo(title: 'Qtd. sol.', subtitle: '1'),
                        ],
                      ),
                      Column(
                        children: [
                          buildInfo(title: 'Qtd. aut.', subtitle: '1'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildInfo({required String title, required String subtitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TextAppComponent(
              value: subtitle,
              fontWeight: FontWeight.w800,
              fontSize: 16,
              color: AppColor.pantone7722C,
            ),
          ],
        ),
        Row(
          children: [
            Column(
              children: [
                TextAppComponent(
                  value: title,
                  fontSize: 16,
                  color: AppColor.pantone7722C,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  formatterDate(date) {
    return DateTimeExtensions.formatDate(date, 'dd/MM/yyyy');
  }
}
