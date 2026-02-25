import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:app_colabora_unimedjp/app/data/models/authorization.model.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/chat/view/chat.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/text_app.component.dart';
import 'package:app_colabora_unimedjp/app/routers/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/components/button_app.component.dart';
import '../../../../utils/components/toolbars/toolbar_app.component.dart';
import '../../../../utils/extensions/date_time_extensions.dart';

class DetailAuthorizationCanceledModal extends StatelessWidget {
  AuthorizationModel data;
  DetailAuthorizationCanceledModal({super.key, required this.data});

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
                    value: 'NÚMERO DO PROTOCOLO',
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
                  buildInfo(
                    title: 'Tipo de Solição',
                    subtitle:
                        'GARANTIA DE ACESSO - REDE DIRETA - ANÁLISE DA ÁREA',
                  ),
                  SizedBox(height: 10),
                  buildInfo(title: 'Beneficiário', subtitle: 'ITALO R. SANTOS'),
                  SizedBox(height: 10),
                  buildInfo(title: 'Situação', subtitle: 'PROTOCOLO CANCELADO'),
                  SizedBox(height: 10),
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
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Expanded(
                    child: ButtonStylizedAppComponent(
                      padding: EdgeInsetsGeometry.symmetric(
                        horizontal: 10,
                        vertical: 5,
                      ),
                      color: AppColor.pantone382C,
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextAppComponent(
                            value: 'Ver histórico do chat',
                            color: AppColor.pantone7722C,
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.chat_bubble_outline,
                            color: AppColor.pantone7722C,
                          ),
                        ],
                      ),
                      onPressed: () {
                        Get.toNamed(RoutesApp.CHAT);
                      },
                    ),
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
        Align(
          alignment: Alignment.centerLeft,
          child: TextAppComponent(
            value: subtitle,
            fontWeight: FontWeight.w800,
            fontSize: 16,
            color: AppColor.pantone7722C,
          ),
        ),
        const SizedBox(height: 4),
        Align(
          alignment: Alignment.centerLeft,
          child: TextAppComponent(
            value: title,
            fontSize: 16,
            color: AppColor.pantone7722C,
          ),
        ),
      ],
    );
  }

  formatterDate(date) {
    return DateTimeExtensions.formatDate(date, 'dd/MM/yyyy');
  }
}
