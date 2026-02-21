import 'package:app_colabora_unimedjp/app/modules/recipient/wallet/view/components/card_wallet.componet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../../config/colors/colors.dart';
import '../../../utils/components/tab_app.component.dart';
import '../../../utils/components/text_app.component.dart';
import '../../../utils/components/toolbars/toolbar_app.component.dart';
import '../controller/preview_wallet.controller.dart';

class PreviewWalletPage extends GetView<PreviewWalletController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 0),
          child: ToolbarAppComponent(
            onPressedMenu: () {},
            showMenu: false,
            title: 'Carteira',
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 10),
              child: TabsAppComponent(
                fontSize: 16,
                titlesTabs: ['Meu Cartão', 'QR-Code/Token'],
                contentTabs: [buildCard(), buildQRCode()],
                onChangeIndex: (index) {
                  if (index == 1) controller.startTime();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCard() {
    return CardWalletComponent();
  }

  Widget buildQRCode() {
    return Column(
      children: [
        Icon(Icons.check, size: 45, color: AppColor.pantone382C),
        TextAppComponent(
          value: 'Token gerado com sucesso!',
          fontWeight: FontWeight.w600,
          fontSize: 22,
          color: AppColor.pantone7722C,
        ),
        SizedBox(height: 8),
        TextAppComponent(
          value: 'Apresente este token no atendimento.',
          color: AppColor.mediumSecondary,
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.pantone382C.withAlpha(60),
            ),
            child: Column(
              children: [
                const Spacer(),
                TextAppComponent(
                  value: 'V5RR7K60CD',
                  color: AppColor.pantone7722C,
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
                QrImageView(
                  data:
                      'https://flutter.dev', // The data to encode in the QR code
                  version: QrVersions
                      .auto, // Automatically determines the QR code version
                  size: 200.0, // The size of the QR code image
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
        SizedBox(height: 8),
        ValueListenableBuilder(
          valueListenable: controller.timeSendCode,
          builder: (context, int time, child) {
            if (time > 0) {
              return Column(
                children: [
                  TextAppComponent(
                    value: 'Expira em:',
                    fontWeight: FontWeight.w600,
                    color: AppColor.pantone7722C,
                    fontSize: 18,
                  ),
                  TextAppComponent(
                    value: '$time segundos',
                    fontWeight: FontWeight.w600,
                    color: AppColor.pantone7722C,
                    fontSize: 16,
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ],
    );
  }
}
