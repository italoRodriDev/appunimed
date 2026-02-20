import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crise/components/text.component.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utils/components/button_app.component.dart';
import '../../utils/components/toolbars/toolbar_app.component.dart';

class NotFoundPage extends GetView {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 0),
          child: ToolbarAppComponent(
            onPressedBack: () {
              Get.back();
            },
            onPressedMenu: () {},
            title: 'Desafio mensal',
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Opacity(
                  opacity: 1,
                  child: SvgPicture.asset(
                    'assets/svg/feedback_status_image_very_bad.svg',
                    width: 100,
                    height: 100,
                  ),
                ),
                const SizedBox(height: 16),
                TextComponent(
                  value: 'Essa funcionalidade \n ainda não existe.',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                  color: AppColor.pantone7722C,
                ),
                const SizedBox(height: 8),
                TextComponent(
                  value: 'Aguarde novidades em breve...',
                  textAlign: TextAlign.center,
                  color: AppColor.neutral1,
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: EdgeInsetsGeometry.only(
                    left: 30,
                    right: 30,
                    top: 30,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: ButtonAppComponent(
                          label: 'Voltar ao menu',
                          padding: EdgeInsetsGeometry.symmetric(horizontal: 10),
                          borderRadius: 12,
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
