import 'package:app_colabora_unimedjp/app/modules/recipient/protocols/view/components/card_protocol.component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/fonts/fonts.dart';
import '../../../utils/components/alerts/info_list_clear_app.component.dart';
import '../../../utils/components/progress_app.component.dart';
import '../../../utils/components/text_app.component.dart';
import '../../../utils/components/toolbars/toolbar_app.component.dart';
import '../../../utils/extensions/date_time_extensions.dart';
import '../controller/protocols.controller.dart';
import 'components/detail_protocol_modal.dart';

class ProtocolsPage extends GetView<ProtocolsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 0),
          child: ToolbarAppComponent(
            onPressedMenu: () {},
            showMenu: false,
            title: 'Protocolos',
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsGeometry.all(16),
                child: Column(
                  children: [
                    TextAppComponent(
                      value: 'Seus Protocolos',
                      textAlign: TextAlign.center,
                      fontFamily: AppFont.UnimedSlab,
                      fontWeight: FontWeight.w600,
                      color: AppColor.pantone348C,
                      fontSize: 22,
                    ),
                    SizedBox(height: 8),
                    TextAppComponent(
                      textAlign: TextAlign.center,
                      value:
                          'Aqui você pode visualizar seu protocolos\n em atendimento e finalizados.',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Divider(height: 0, color: AppColor.neutral2),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: controller.listProtocols,
                  builder: (context, items, child) {
                    if (items.isNotEmpty) {
                      return ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items[index];
                          return CardProtocolComponent(
                            data: item,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProtocolDetailScreen(data: item),
                                ),
                              );
                            },
                          );
                        },
                      );
                    }
                    if (items.isEmpty) {
                      InfoListClearAppComponent(
                        message: 'Respostas indisponíveis no momento.',
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

  formatterDate(date) {
    return DateTimeExtensions.formatDate(date, 'dd/MM/yyyy');
  }
}
