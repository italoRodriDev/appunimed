import 'package:app_colabora_unimedjp/app/services/authentication.service.dart';
import 'package:app_colabora_unimedjp/app/services/biometric.service.dart';
import 'package:app_colabora_unimedjp/app/services/config.service.dart';
import 'package:app_colabora_unimedjp/app/services/contracts.service.dart';
import 'package:app_colabora_unimedjp/app/services/notifications.service.dart';
import 'package:app_colabora_unimedjp/app/services/process_image.service.dart';
import 'package:app_colabora_unimedjp/app/services/profile.service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'app/config/global/app_theme.dart';
import 'app/routers/app_pages.dart';
import 'app/routers/app_routers.dart';

void main() async {
  initServices();
  runApp(
    GetMaterialApp(
      title: 'Unimed JP',
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      initialRoute: RoutesApp.SPLASH,
      theme: appThemeData,
      locale: const Locale('pt', 'BR'),
      supportedLocales: const [Locale('pt', 'BR')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    ),
  );
}

initServices() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync<ConfigService>(() async => await ConfigService().init());
  await Get.putAsync<ProcessImageService>(
    () async => await ProcessImageService().init(),
  );
  await Get.putAsync<AuthenticationService>(
    () async => await AuthenticationService().init(),
  );
  await Get.putAsync<BiometricService>(
    () async => await BiometricService().init(),
  );
  await Get.putAsync<ContractsService>(
    () async => await ContractsService().init(),
  );
  await Get.putAsync<ProfileService>(() async => await ProfileService().init());
  await NotificationService.initialize();
}
