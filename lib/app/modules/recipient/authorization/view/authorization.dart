import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:app_colabora_unimedjp/app/config/fonts/fonts.dart';
import 'package:app_colabora_unimedjp/app/data/models/authorization.model.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/authorization/view/components/card_authorization.component.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/authorization/view/components/detail_authorization.component.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/authorization/view/components/detail_authorization_canceled.component.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/filter_select.component.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/text_app.component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/components/alerts/info_list_clear_app.component.dart';
import '../../../utils/components/button_app.component.dart';
import '../../../utils/components/progress_app.component.dart';
import '../../../utils/components/toolbars/toolbar_app.component.dart';
import '../controller/authorization.controller.dart';

class AuthorizationPage extends GetView<AuthorizationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 0),
          child: ToolbarAppComponent(
            onPressedMenu: () {},
            showMenu: false,
            title: 'Autorizações',
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              TextAppComponent(
                value: 'Suas autorizações',
                textAlign: TextAlign.center,
                fontFamily: AppFont.UnimedSlab,
                fontWeight: FontWeight.w600,
                color: AppColor.pantone348C,
                fontSize: 22,
              ),
              SizedBox(height: 8),
              TextAppComponent(
                textAlign: TextAlign.center,
                value: 'Aqui você pode solicitar e visualizar autorizações.',
              ),
              SizedBox(height: 20),
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
                        label: TextAppComponent(
                          value: 'Solicitar Autorização',
                          color: AppColor.pantone7722C,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: FilterSelectComponent<String>(
                        label: 'Beneficiário',
                        substringLength: 12,
                        itemsData: controller.listAuthorization.value
                            .map(
                              (el) => MenuItemFilterData(
                                label: el.beneficiario.toString().toUpperCase(),
                                value: el.beneficiario.toString().toUpperCase(),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          print('Beneficiário: $value');
                        },
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: FilterSelectComponent<String>(
                        label: 'Situação',
                        substringLength: 12,
                        itemsData: controller.listAuthorization.value
                            .map(
                              (el) => MenuItemFilterData(
                                label: el.status.toString(),
                                value: el.status.toString(),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          print('Situação: $value');
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Divider(height: 0, color: AppColor.neutral2),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: controller.listAuthorization,
                  builder: (context, items, child) {
                    if (items.isNotEmpty) {
                      return ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items[index];
                          return CardAuthorizationComponent(
                            data: item,
                            onPressed: () {
                              validShowModalDetailAuthorization(context, item);
                            },
                          );
                        },
                      );
                    }

                    if (items.isEmpty) {
                      InfoListClearAppComponent(
                        message: 'Autorizações indisponíveis no momento.',
                      );
                    }

                    return ProgressAppComponent();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  validShowModalDetailAuthorization(
    BuildContext context,
    AuthorizationModel data,
  ) {
    if (data.status == 'PROTOCOLO CANCELADO') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => DetailAuthorizationCanceledModal(data: data)),
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) => DetailAuthorizationModal(data: data)),
        ),
      );
    }
  }
}
