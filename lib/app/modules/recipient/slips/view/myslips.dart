import 'package:app_colabora_unimedjp/app/modules/recipient/slips/controller/myslips.controller.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/button_app.component.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/tab_app.component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/fonts/fonts.dart';
import '../../../utils/components/alerts/info_list_clear_app.component.dart';
import '../../../utils/components/progress_app.component.dart';
import '../../../utils/components/text_app.component.dart';
import '../../../utils/components/toolbars/toolbar_app.component.dart';
import 'components/card_slip.component.dart';

class MySlipsPage extends GetView<MySlipsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 0),
          child: ToolbarAppComponent(
            onPressedMenu: () {},
            showMenu: false,
            title: 'Boletos',
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Stack(
            children: [
              Column(
                children: [
                  TextAppComponent(
                    value: 'Seus boletos',
                    textAlign: TextAlign.center,
                    fontFamily: AppFont.UnimedSlab,
                    fontWeight: FontWeight.w600,
                    color: AppColor.pantone348C,
                    fontSize: 22,
                  ),
                  SizedBox(height: 8),
                  TextAppComponent(
                    textAlign: TextAlign.center,
                    value: 'Aqui você pode visualizar seus boletos.',
                  ),
                  SizedBox(height: 8),
                  TabsAppComponent(
                    fontSize: 14,
                    titlesTabs: ['Abertas', 'Liquidados'],
                    contentTabs: [buildTabPending(), buildTabPay()],
                    onChangeIndex: (index) {},
                  ),
                ],
              ),
              Positioned(
                bottom: 32,
                right: 22,
                left: 22,
                child: ButtonStylizedAppComponent(
                  color: AppColor.pantone382C,
                  label: TextAppComponent(
                    value: 'Pagar boleto',
                    color: AppColor.pantone7722C,
                  ),
                  onPressed: () {},
                )),
            ],
          ),
        ),
      ),
    );
  }

  buildTabPending() {
    return Column(
      children: [
        Divider(height: 0, color: AppColor.neutral2),

        SizedBox(
          height: 500,
          child: ValueListenableBuilder(
            valueListenable: controller.listPeddings,
            builder: (context, items, child) {
              if (items.isNotEmpty) {
                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return CardSlipFinanceComponent(
                      status: item.status,
                      dueDate: item.dueDate,
                      paymentDate: item.paymentDate,
                      value: item.value,
                    );
                  },
                );
              }
              if (items.isEmpty) {
                InfoListClearAppComponent(
                  message: 'Boletos indisponíveis no momento.',
                );
              }

              return ProgressAppComponent();
            },
          ),
        ),

        Divider(height: 0, color: AppColor.neutral2),
      ],
    );
  }

  buildTabPay() {
    return Column(
      children: [
        Divider(height: 0, color: AppColor.neutral2),

        SizedBox(
          height: 500,
          child: ValueListenableBuilder(
            valueListenable: controller.listPayments,
            builder: (context, items, child) {
              if (items.isNotEmpty) {
                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return CardSlipFinanceComponent(
                      status: item.status,
                      dueDate: item.dueDate,
                      paymentDate: item.paymentDate,
                      value: item.value,
                    );
                  },
                );
              }
              if (items.isEmpty) {
                InfoListClearAppComponent(
                  message: 'Boletos indisponíveis no momento.',
                );
              }

              return ProgressAppComponent();
            },
          ),
        ),

        Divider(height: 0, color: AppColor.neutral2),
      ],
    );
  }
}
