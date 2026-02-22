import 'package:app_colabora_unimedjp/app/modules/auth/login/bindings/login.bind.dart';
import 'package:app_colabora_unimedjp/app/modules/auth/not-found/not_found.page.dart';
import 'package:app_colabora_unimedjp/app/modules/auth/permissions/bindings/permissions.bind.dart';
import 'package:app_colabora_unimedjp/app/modules/auth/permissions/view/permissions.dart';
import 'package:app_colabora_unimedjp/app/modules/auth/recovery-password/view/recovery_password.dart';
import 'package:app_colabora_unimedjp/app/modules/auth/splash/bindings/splash.bind.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/faq/binding/faq.bind.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/faq/view/faq.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/finances/bindings/assistence_reimbursement.bind.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/finances/bindings/finances.bind.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/finances/bindings/financial_reimbursement.bind.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/finances/view/finances.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/home/bindings/home.bind.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/home/view/home.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/manuals/bindings/manuals.bind.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/myplan/bindings/myplan.bind.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/telehealth/bindings/promptservice.bind.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/telehealth/bindings/teleconsultation.bind.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/telehealth/view/components/card_telehealth_consultantion.component.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/telehealth/view/telehealth.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/wallet/bindings/wallet.bind.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/wallet/view/preview_wallet.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/wallet/view/wallet.dart';
import 'package:app_colabora_unimedjp/app/routers/app_routers.dart';
import 'package:get/get.dart';

import '../modules/auth/login/view/login.dart';
import '../modules/auth/recovery-password/bindings/recovery_password.bind.dart';
import '../modules/auth/splash/view/splash.dart';
import '../modules/recipient/manuals/view/manuals.dart';
import '../modules/recipient/myplan/view/myplan.dart';
import '../modules/recipient/telehealth/bindings/telehealth.bind.dart';
import '../modules/recipient/wallet/bindings/preview_wallet.bind.dart';

const animation = Transition.circularReveal;
const timeAnimation = 300;

class AppPages {
  static final routes = [
    GetPage(
      name: RoutesApp.SPLASH,
      page: () => SplashPage(),
      transition: animation,
      transitionDuration: const Duration(milliseconds: timeAnimation),
      binding: SplashBinding(),
    ),
    GetPage(
      name: RoutesApp.PERMISSOES,
      page: () => PermissionsPage(),
      transition: animation,
      transitionDuration: const Duration(milliseconds: timeAnimation),
      binding: PermissionsBinding(),
    ),
    GetPage(
      name: RoutesApp.LOGIN,
      page: () => LoginPage(),
      transition: animation,
      transitionDuration: const Duration(milliseconds: timeAnimation),
      binding: LoginBinding(),
    ),
    GetPage(
      name: RoutesApp.RECOVERY_PASSWORD,
      page: () => RecoveryPasswordPage(),
      transition: animation,
      transitionDuration: const Duration(milliseconds: timeAnimation),
      binding: RecoveryPasswordBinding(),
    ),
    GetPage(
      name: RoutesApp.HOME,
      page: () => HomePage(),
      transition: animation,
      transitionDuration: const Duration(milliseconds: timeAnimation),
      binding: HomeBinding(),
    ),
    GetPage(
      name: RoutesApp.WALLET,
      page: () => WalletPage(),
      transition: animation,
      transitionDuration: const Duration(milliseconds: timeAnimation),
      binding: WalletBinding(),
    ),
    GetPage(
      name: RoutesApp.PREVIEW_WALLET,
      page: () => PreviewWalletPage(),
      transition: animation,
      transitionDuration: const Duration(milliseconds: timeAnimation),
      binding: PreviewWalletBinding(),
    ),
    GetPage(
      name: RoutesApp.MYPLAN,
      page: () => MyPlanPage(),
      transition: animation,
      transitionDuration: const Duration(milliseconds: timeAnimation),
      binding: MyPlanBinding(),
    ),
    GetPage(
      name: RoutesApp.FINANCES,
      page: () => FinancesPage(),
      transition: animation,
      transitionDuration: const Duration(milliseconds: timeAnimation),
      binding: FinancesBinding(),
      bindings: [
        AssistenceReimbursementBinding(),
        FinancialReimbursementBinding(),
      ],
    ),
    GetPage(
      name: RoutesApp.TELEHEALTH,
      page: () => TeleHealthPage(),
      transition: animation,
      transitionDuration: const Duration(milliseconds: timeAnimation),
      binding: TeleHealthBinding(),
      bindings: [PromptServiceBinding(), TeleConsultationBinding()],
    ),
    GetPage(
      name: RoutesApp.FAQ,
      page: () => FaqPage(),
      transition: animation,
      transitionDuration: const Duration(milliseconds: timeAnimation),
      binding: FaqBinding(),
    ),
    GetPage(
      name: RoutesApp.MANUALS,
      page: () => ManualsPage(),
      transition: animation,
      transitionDuration: const Duration(milliseconds: timeAnimation),
      binding: ManualsBinding(),
    ),
    GetPage(
      name: RoutesApp.INEXISTENTE,
      page: () => NotFoundPage(),
      transition: animation,
      transitionDuration: const Duration(milliseconds: timeAnimation),
    ),
  ];
}
