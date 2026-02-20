import 'package:app_colabora_unimedjp/app/config/fonts/fonts.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/button_app.component.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/progress_app.component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/colors/colors.dart';
import '../controller/permissions.controller.dart';

class PermissionsPage extends GetView<PermissionsController> {
  final double maxPercentSize = 0.66;

  const PermissionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("assets/images/login_background.jpg"), context);

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Color(0xFF069A5C),
        body: Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: 0.9,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/unimed_bg.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Image.asset(
                          "assets/images/logo_unimedjp.png",
                          width: 45,
                        ),
                        SizedBox(height: 20),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: TextStyle(fontSize: 32),
                            children: [
                              TextSpan(
                                text: "Unimed\n",
                                style: TextStyle(
                                  height: 0.96,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: AppColor.pantone382C,
                                ),
                              ),
                              TextSpan(
                                text: "João Pessoa",
                                style: TextStyle(
                                  height: 0.96,
                                  fontSize: 16,
                                  color: Color(0xFFEEF4DA),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30),
                        Obx(() {
                          return controller.loadContent.value == false
                              ? ProgressAppComponent()
                              : Container();
                        }),
                      ],
                    ),
                    Obx(() {
                      return AnimatedCrossFade(
                        crossFadeState: controller.loadContent.value
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        duration: const Duration(milliseconds: 950),
                        firstCurve: Curves.decelerate,
                        sizeCurve: Curves.linearToEaseOut,
                        secondChild: Container(),
                        firstChild: Column(
                          children: [
                            const SizedBox(height: 40),
                            Text(
                              "Precisamos da sua permissão",
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: AppColor.pantone382C,
                                fontFamily: AppFont.UnimedSlab,
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 18),
                            SizedBox(
                              width: Get.width * maxPercentSize,
                              child: Text(
                                "Para oferecer a melhor experiência, este aplicativo solicita acesso a alguns recursos do seu dispositivo.",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(height: 30),
                            SizedBox(
                              width: 295,
                              height: 42,
                              child: ButtonAppComponent(
                                label: "Continuar",
                                padding: const EdgeInsets.all(0),
                                color: AppColor.pantone382C,
                                textColor: AppColor.secondary,
                                onPressed: () {
                                  controller.acceptPermissions();
                                },
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                    SizedBox(height: 60),
                    Image.asset("assets/images/logo_unimedjp.png", width: 80),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
