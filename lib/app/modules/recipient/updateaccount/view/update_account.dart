import 'package:app_colabora_unimedjp/app/modules/recipient/updateaccount/view/components/update_address_modal.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/updateaccount/view/components/update_email_modal.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/updateaccount/view/components/update_phone_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/fonts/fonts.dart';
import '../../../utils/components/text_app.component.dart';
import '../../../utils/components/toolbars/toolbar_app.component.dart';
import '../controller/update_account.controller.dart';
import 'components/card_menu_update.component.dart';

class UpdateAccountPage extends GetView<UpdateAccountController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 0),
          child: ToolbarAppComponent(
            showMenu: false,
            onPressedMenu: () {},
            title: "Atualização cadastral",
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
                    value: 'Mantenha seus dados atualizados',
                    fontFamily: AppFont.UnimedSlab,
                    fontWeight: FontWeight.w600,
                    color: AppColor.pantone348C,
                    fontSize: 22,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  TextAppComponent(
                    value: 'Aqui você pode atualizar seu contato, e-mail e endereço.',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
            Divider(height: 0, color: AppColor.neutral2),
            CardMenuUpdateComponent(title: 'E-mail', subtitle: 'Atualizar', onPressed: () {
              toModal(context, UpdateEmailModal());
            }),
            CardMenuUpdateComponent(title: 'Telefone', subtitle: 'Atualizar', onPressed: () {
              toModal(context, UpdatePhoneModal());
            }),
            CardMenuUpdateComponent(title: 'Endereço', subtitle: 'Atualizar', onPressed: () {
              toModal(context, UpdateAddressModal());
            }),
          ],
        ),
      ),
    );
  }

  toModal(BuildContext context,Widget modal) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => modal));
  }
}
