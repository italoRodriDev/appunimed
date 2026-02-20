import 'package:app_colabora_unimedjp/app/config/fonts/fonts.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/button_app.component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/colors/colors.dart';
import '../../../utils/components/text_app.component.dart';
import '../controller/splash.controller.dart';

class SplashPage extends GetView<SplashController> {
  final double maxPercentSize = 0.66;

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(AssetImage("assets/images/login_background.jpg"), context);

    double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
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
                  SizedBox(height: 20),
                  Image.asset("assets/images/logo_unimedjp.png"),
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
                          TextAppComponent(
                            value: "Que bom ter você aqui!",
                            fontWeight: FontWeight.w800,
                            color: AppColor.pantone382C,
                            fontFamily: AppFont.UnimedSlab,
                            fontSize: 24,
                          ),
                          const SizedBox(height: 18),
                          SizedBox(
                            width: Get.width * maxPercentSize,
                            child: Text(
                              "Para entrar no app Unimed, use seu CPF e senha, caso seja seu primeiro acesso crie uma conta.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                            width: 295,
                            height: 42,
                            child: ButtonAppComponent(
                              label: "Fazer login",
                              padding: const EdgeInsets.all(0),
                              color: AppColor.pantone382C,
                              textColor: AppColor.secondary,
                              onPressed: () {
                                controller.validPermissionsRequested();
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
