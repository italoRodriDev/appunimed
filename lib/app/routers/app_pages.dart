import 'package:app_colabora_unimedjp/app/modules/auth/login/bindings/login.bind.dart';
import 'package:app_colabora_unimedjp/app/modules/auth/not-found/not_found.page.dart';
import 'package:app_colabora_unimedjp/app/modules/auth/permissions/bindings/permissions.bind.dart';
import 'package:app_colabora_unimedjp/app/modules/auth/permissions/view/permissions.dart';
import 'package:app_colabora_unimedjp/app/modules/auth/recovery-password/view/recovery_password.dart';
import 'package:app_colabora_unimedjp/app/modules/auth/splash/bindings/splash.bind.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/home/bindings/splash.bind.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/home/view/home.dart';
import 'package:app_colabora_unimedjp/app/routers/app_routers.dart';
import 'package:get/get.dart';

import '../modules/auth/login/view/login.dart';
import '../modules/auth/recovery-password/bindings/recovery_password.bind.dart';
import '../modules/auth/register-user/bindings/register_user.bind.dart';
import '../modules/auth/register-user/view/register_user.dart';
import '../modules/auth/splash/view/splash.dart';

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
      name: RoutesApp.INEXISTENTE,
      page: () => NotFoundPage(),
      transition: animation,
      transitionDuration: const Duration(milliseconds: timeAnimation),
    ),
  ];
}
