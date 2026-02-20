import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/home/controller/home.controller.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/avatar_app.component.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/carrousel_image_app.component.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/text_app.component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final itemsTopMenu = [
      CardModel(
        Icons.badge_outlined,
        'Carteira',
        'Visualize as informações \nda sua carteirinha do plano.',
      ),
      CardModel(
        Icons.assignment_outlined,
        'Meu Plano',
        'Consulte a cobertura \ne detalhes do seu plano.',
      ),
      CardModel(
        Icons.account_balance_wallet_outlined,
        'Financeiro',
        'Boletos, reembolsos \ne histórico financeiro.',
      ),
      CardModel(
        Icons.verified_user_outlined,
        'Autorizações',
        'Solicite e acompanhe \nsuas autorizações.',
      ),
      CardModel(
        Icons.video_camera_front_outlined,
        'Telessaúde',
        'Realize consultas \nmédicas online.',
      ),
    ];

    final itemsBottomMenu = [
      CardModel(
        Icons.person_outline,
        'Perfil',
        'Gerencie suas \ninformações pessoais.',
      ),

      CardModel(
        Icons.notifications_active_outlined,
        'Notificações',
        'Acompanhe avisos\n e atualizações.',
      ),
      CardModel(
        Icons.manage_accounts_outlined,
        'Atualização',
        'Atualize seus \ndados cadastrais.',
      ),
      CardModel(
        Icons.headset_mic_outlined,
        'Fale Conosco',
        'Envie dúvidas ou\n fale com a central.',
      ),
      CardModel(
        Icons.book_outlined,
        'Manuais',
        'Acesse os manuais\n do usuário.',
      ),

      CardModel(
        Icons.help_center_outlined,
        'FAQ',
        'Consulte dúvidas\n frequentes.',
      ),
    ];

    return Scaffold(
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
                  itemCount: itemsTopMenu.length,
                  itemBuilder: (context, index) {
                    final item = itemsTopMenu[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: _cardItem(item),
                    );
                  },
                ),
              ),

              /// Serviços
              _sectionTitle('Outros'),

              GridView.builder(
                padding: const EdgeInsets.all(10),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: itemsBottomMenu.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.85,
                ),
                itemBuilder: (context, index) {
                  return _cardItem(itemsBottomMenu[index]);
                },
              ),
            ],
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

  Widget _cardItem(CardModel item) {
    return Container(
      height: 150,
      width: 100,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColor.pantone382C.withAlpha(40),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColor.pantone382C),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Tooltip(
              exitDuration: Duration(seconds: 10),
              message: item.subtitle,
              textStyle: const TextStyle(color: Colors.white),
              decoration: BoxDecoration(
                color: AppColor.pantone7722C,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.help_outline,
                size: 20,
                color: AppColor.pantone7722C,
              ),
            ),
          ),

          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(item.icon, size: 32, color: AppColor.pantone7722C),
                const SizedBox(height: 8),
                TextAppComponent(
                  value: item.title,
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.w600,
                  color: AppColor.pantone7722C,
                  overflow: TextOverflow.ellipsis,
                ),
                TextButton(
                  onPressed: () {
                    onPressedItemMenu();
                  },
                  child: TextAppComponent(
                    value: 'Acessar',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColor.pantone382C,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onPressedItemMenu() {
    print('click');
  }
}

class CardModel {
  final IconData icon;
  final String title;
  final String subtitle;

  CardModel(this.icon, this.title, this.subtitle);
}
