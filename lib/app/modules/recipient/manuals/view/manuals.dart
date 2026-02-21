import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:app_colabora_unimedjp/app/config/fonts/fonts.dart';
import 'package:app_colabora_unimedjp/app/data/models/faq.model.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/manuals/controller/manuals.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/components/text_app.component.dart';
import '../../../utils/components/toolbars/toolbar_app.component.dart';
import 'components/card_manuals.component.dart';

class ManualsPage extends GetView<ManualsController> {
  ManualsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 0),
          child: ToolbarAppComponent(
            showMenu: false,
            onPressedMenu: () {},
            title: "Manuais",
          ),
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.all(10),
              child: Column(
                children: [
                  TextAppComponent(
                    value: 'Manual do Beneficiário',
                    fontFamily: AppFont.UnimedSlab,
                    fontWeight: FontWeight.w600,
                    color: AppColor.pantone348C,
                    fontSize: 22,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  TextAppComponent(
                    value: 'Selecione um dos manuais para visualizar.',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
            Divider(height: 0, color: AppColor.neutral2),
            for (var i = 0; i < 10; i++)
              CardManualsComponent(
                data: FaqModel(
                  id: 0,
                  title: 'Como usar o app?',
                  description: 'Para usar o app basta fazer o login.',
                ),
              ),

            /* 
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: controller.listFAQs,
                builder: (context, items, child) {
                  if (items.isNotEmpty) {
                    return ListView.builder(
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        final item = items[index];
                        return CardFaqComponent(data: item);
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
            
            Divider(height: 0, color: AppColor.neutral2),
            */
          ],
        ),
      ),
    );
  }
}
