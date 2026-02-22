import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/home/controller/home.controller.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/home/view/components/card_bottom_menu.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/home/view/components/card_top_menu.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/avatar_app.component.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/carrousel_image_app.component.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/text_app.component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_minimizer_plus/flutter_app_minimizer_plus.dart';
import 'package:get/get.dart';

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
                /// Header
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

                /// Carousel
                CarrouselImageAppComponent(
                  imageUrls: [
                    'https://i.ytimg.com/vi/u2X0bQgwfJo/maxresdefault.jpg',
                  ],
                  titles: ['Conheça nossos planos'],
                  descriptions: ['Ver detalhes'],
                  onClick: (index) {},
                ),

                /// Acesso rápido
                _sectionTitle('Serviços'),

                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.itemsTopMenu.length,
                    itemBuilder: (context, index) {
                      final item = controller.itemsTopMenu[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: CardTopMenuHome(
                          item: item,
                          onPressed: () {
                            Get.toNamed(item.router);
                          },
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(height: 8),

                /// Serviços
                _sectionTitle('Outros'),

                GridView.builder(
                  padding: const EdgeInsets.all(10),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.itemsBottomMenu.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 0.85,
                  ),
                  itemBuilder: (context, index) {
                    final item = controller.itemsBottomMenu[index];
                    return CardBottomMenuHome(
                      item: item,
                      onPressed: () {
                        Get.toNamed(item.router);
                      },
                    );
                  },
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
      padding: const EdgeInsets.all(10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: TextAppComponent(
          value: title,
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: AppColor.pantone7722C,
        ),
      ),
    );
  }
}

class CardModel {
  final IconData icon;
  final String title;
  final String subtitle;
  final String router;

  CardModel(this.icon, this.title, this.subtitle, this.router);
}
