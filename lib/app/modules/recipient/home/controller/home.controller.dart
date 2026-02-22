import 'package:app_colabora_unimedjp/app/data/models/authentication_response.model.dart';
import 'package:app_colabora_unimedjp/app/data/provider/sqlite.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../routers/app_routers.dart';
import '../view/home.dart';

class HomeController extends GetxController {
  ValueNotifier<AuthResponseModel?> dataProfile = ValueNotifier(null);

  final itemsTopMenu = [
    CardModel(
      Icons.badge_outlined,
      'Carteira',
      'Visualize as informações \nda sua carteirinha do plano.',
      RoutesApp.WALLET,
    ),
    CardModel(
      Icons.assignment_outlined,
      'Meu Plano',
      'Consulte a cobertura \ne detalhes do seu plano.',
      RoutesApp.MYPLAN,
    ),
    CardModel(
      Icons.account_balance_wallet_outlined,
      'Financeiro',
      'Boletos, reembolsos \ne histórico financeiro.',
      RoutesApp.FINANCES,
    ),
    CardModel(
      Icons.verified_user_outlined,
      'Autorizações',
      'Solicite e acompanhe \nsuas autorizações.',
      RoutesApp.INEXISTENTE,
    ),
    CardModel(
      Icons.video_camera_front_outlined,
      'Telessaúde',
      'Realize consultas \nmédicas online.',
      RoutesApp.TELEHEALTH,
    ),
  ];

  final itemsBottomMenu = [
    CardModel(
      Icons.person_outline,
      'Perfil',
      'Gerencie suas \ninformações pessoais.',
      RoutesApp.INEXISTENTE,
    ),

    CardModel(
      Icons.notifications_active_outlined,
      'Notificações',
      'Acompanhe avisos\n e atualizações.',
      RoutesApp.INEXISTENTE,
    ),
    CardModel(
      Icons.manage_accounts_outlined,
      'Atualização',
      'Atualize seus \ndados cadastrais.',
      RoutesApp.INEXISTENTE,
    ),
    CardModel(
      Icons.headset_mic_outlined,
      'Fale Conosco',
      'Envie dúvidas ou\n fale com a central.',
      RoutesApp.INEXISTENTE,
    ),
    CardModel(
      Icons.book_outlined,
      'Manuais',
      'Acesse os manuais\n do usuário.',
      RoutesApp.MANUALS,
    ),

    CardModel(
      Icons.help_center_outlined,
      'FAQ',
      'Consulte dúvidas\n frequentes.',
      RoutesApp.FAQ,
    ),
  ];

  @override
  void onInit() {
    getDataProfile();
    super.onInit();
  }

  getDataProfile() async {
    List<AuthResponseModel> data = await SqliteApi.getProfile();
    dataProfile.value = data[0];
  }
}
