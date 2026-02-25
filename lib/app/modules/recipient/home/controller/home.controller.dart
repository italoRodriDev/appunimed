import 'package:app_colabora_unimedjp/app/data/models/authentication_response.model.dart';
import 'package:app_colabora_unimedjp/app/data/provider/sqlite.provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../routers/app_routers.dart';
import '../view/components/list_menu_home.component.dart';

class HomeController extends GetxController {
  ValueNotifier<AuthResponseModel?> dataProfile = ValueNotifier(null);
  final RxBool stopHomeAnimations = false.obs;
  final itemsMenu = [
    CardModel(
      Icons.badge_outlined,
      'Carteira',
      'Visualize as informações da sua carteirinha do plano.',
      RoutesApp.WALLET,
    ),
    CardModel(
      Icons.assignment_outlined,
      'Meu Plano',
      'Consulte a cobertura e detalhes do seu plano.',
      RoutesApp.MYPLAN,
    ),
    CardModel(
      Icons.account_balance_wallet_outlined,
      'Financeiro',
      'Boletos, reembolsos e histórico financeiro.',
      RoutesApp.FINANCES,
    ),
    CardModel(
      Icons.verified_user_outlined,
      'Autorizações',
      'Solicite e acompanhe suas autorizações.',
      RoutesApp.AUTHORIZATION,
    ),
    CardModel(
      Icons.video_camera_front_outlined,
      'Telessaúde',
      'Realize consultas médicas online.',
      RoutesApp.TELEHEALTH,
    ),
    CardModel(
      Icons.calendar_month_outlined,
      'Agendamentos',
      'Agende consultas e serviços em nossas unidades online.',
      RoutesApp.SCHEDULING,
    ),

    CardModel(
      Icons.medical_information_outlined,
      'Resultado de exames',
      'Consulte resultados de exames da rede própria.',
      RoutesApp.EXAM_RESULTS,
    ),
    CardModel(
      Icons.medical_information_outlined,
      'Guia Médico',
      'Consulte nosso guia local e nacional.',
      RoutesApp.EXAM_RESULTS,
    ),
    CardModel(
      Icons.manage_accounts_outlined,
      'Atualização cadastral',
      'Atualize seus dados cadastrais.',
      RoutesApp.INEXISTENTE,
    ),
    CardModel(
      Icons.document_scanner_outlined,
      'Declaração e Extratos',
      'Emita os documentos em PDF.',
      RoutesApp.INEXISTENTE,
    ),
    CardModel(
      Icons.book_outlined,
      'Manuais',
      'Acesse os manuais do usuário.',
      RoutesApp.MANUALS,
    ),
    CardModel(
      Icons.headset_mic_outlined,
      'Fale Conosco',
      'Envie dúvidas ou fale com a central.',
      RoutesApp.INEXISTENTE,
    ),
    CardModel(
      Icons.help_center_outlined,
      'FAQ - Dúvidas Frêquentes',
      'Consulte dúvidas frequentes.',
      RoutesApp.FAQ,
    ),
    CardModel(
      Icons.person_outline,
      'Perfil',
      'Gerencie suas informações pessoais.',
      RoutesApp.INEXISTENTE,
    ),
    CardModel(
      Icons.notifications_active_outlined,
      'Notificações',
      'Acompanhe avisos e atualizações.',
      RoutesApp.INEXISTENTE,
    ),
  ];

  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 2), () {
      stopHomeAnimations.value = true;
    });
    getDataProfile();
    super.onInit();
  }

  getDataProfile() async {
    List<AuthResponseModel> data = await SqliteApi.getProfile();
    dataProfile.value = data[0];
  }
}
