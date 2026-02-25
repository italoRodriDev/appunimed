import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/home/controller/home.controller.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/avatar_app.component.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/carrousel_image_app.component.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/text_app.component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_minimizer_plus/flutter_app_minimizer_plus.dart';
import 'package:get/get.dart';

import 'components/list_menu_home.component.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (!didPop) {
          await FlutterAppMinimizerPlus.minimizeApp();
        }
      },
      child: Scaffold(
        backgroundColor: AppColor.background,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: ValueListenableBuilder(
                    valueListenable: controller.dataProfile,
                    builder: (context, data, child) {
                      if (data != null) {
                        return Row(
                          children: [
                            AvatarAppComponent(
                              imageUrl: 'assets/images/avatar.png',
                            ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextAppComponent(
                                  value:
                                      'Olá, ${data.nome.length > 15 ? data.nome.split(' ')[0] : data.nome}',
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.pantone7722C,
                                  fontSize: 22,
                                ),
                                TextAppComponent(
                                  value: 'Ver meu plano',
                                  color: AppColor.pantone382C,
                                ),
                              ],
                            ),
                          ],
                        );
                      }
                      return Container();
                    },
                  ),
                ),

                CarrouselImageAppComponent(
                  imageUrls: [
                    'https://i.ytimg.com/vi/u2X0bQgwfJo/maxresdefault.jpg',
                  ],
                  titles: ['Conheça nossos planos'],
                  descriptions: ['Ver detalhes'],
                  onClick: (index) {},
                ),

                _sectionTitle('Serviços'),

                Padding(
                  padding: EdgeInsets.only(left: 30, right: 30, top: 10),
                  child: AnimatedCardsListHome(controller: controller),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 35, bottom: 10, top: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextAppComponent(
          value: title,
          fontWeight: FontWeight.w600,
          fontSize: 24,
          color: AppColor.pantone7722C,
        ),
      ),
    );
  }
}
