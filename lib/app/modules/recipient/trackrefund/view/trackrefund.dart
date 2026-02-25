import 'package:app_colabora_unimedjp/app/modules/recipient/trackrefund/controller/trackrefund.controller.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/trackrefund/view/components/card_trackrefund.component.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/tab_app.component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/fonts/fonts.dart';
import '../../../utils/components/alerts/info_list_clear_app.component.dart';
import '../../../utils/components/progress_app.component.dart';
import '../../../utils/components/text_app.component.dart';
import '../../../utils/components/toolbars/toolbar_app.component.dart';

class TrackRefundPage extends GetView<TrackRefundController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 0),
          child: ToolbarAppComponent(
            onPressedMenu: () {},
            showMenu: false,
            title: 'Reembolsos',
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              TextAppComponent(
                value: 'Seus reembolsos',
                textAlign: TextAlign.center,
                fontFamily: AppFont.UnimedSlab,
                fontWeight: FontWeight.w600,
                color: AppColor.pantone348C,
                fontSize: 22,
              ),
              SizedBox(height: 8),
              TextAppComponent(
                textAlign: TextAlign.center,
                value: 'Aqui você pode visualizar seus reembolsos.',
              ),
              SizedBox(height: 8),
              TabsAppComponent(
                fontSize: 14,
                titlesTabs: ['Abertas', 'Liquidados'],
                contentTabs: [buildTabOpens(), buildTabFinish()],
                onChangeIndex: (index) {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  buildTabOpens() {
    return Column(
      children: [
        Divider(height: 0, color: AppColor.neutral2),

        SizedBox(
          height: 500,
          child: ValueListenableBuilder(
            valueListenable: controller.listOpens,
            builder: (context, items, child) {
              if (items.isNotEmpty) {
                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return CardTrackRefundComponent(
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
                  message: 'Reembolsos indisponíveis no momento.',
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

  buildTabFinish() {
    return Column(
      children: [
        Divider(height: 0, color: AppColor.neutral2),

        SizedBox(
          height: 500,
          child: ValueListenableBuilder(
            valueListenable: controller.listFinished,
            builder: (context, items, child) {
              if (items.isNotEmpty) {
                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return CardTrackRefundComponent(
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
                  message: 'Reembolsos indisponíveis no momento.',
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
