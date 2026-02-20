import 'dart:math';

import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:app_colabora_unimedjp/app/config/fonts/fonts.dart';
import 'package:app_colabora_unimedjp/app/modules/auth/login/controller/login.controller.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/alerts/alert_message_screen_app.component.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/button_app.component.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/inputs/input_app.component.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/progress_app.component.dart';
import 'package:app_colabora_unimedjp/app/routers/app_routers.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_crise/components/text.component.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  final double ratePositionLogo = 0.40;

  const LoginPage({super.key});

  Widget renderBody(BuildContext context) {
    return Obx(() {
      if (controller.isLoginBiometric.value) {
        return renderBiometricLogin();
      }

      return renderForm(context);
    });
  }

  Column renderBiometricLogin() {
    return Column(
      children: [
        const SizedBox(height: 10),
        Material(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: GestureDetector(
            onTap: () {
              controller.loginBiometric();
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.neutral5,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.all(16),
              child: Obx(() {
                if (controller.isLoading.value == true) {
                  return ProgressAppComponent();
                }

                return Row(
                  spacing: 12,
                  children: [
                    Icon(
                      Icons.fingerprint_rounded,
                      size: 40,
                      color: AppColor.primary,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Entrar como:",
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: AppFont.UnimedSans,
                            color: AppColor.primary,
                          ),
                        ),
                        Text(
                          controller.authenticationService.username,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            fontFamily: AppFont.UnimedSans,
                            color: AppColor.highlight10,
                          ),
                        ),
                      ],
                    ),
                    Obx(() {
                      return controller.isLoading.value == true
                          ? Column(
                              children: [
                                ProgressAppComponent(),
                                SizedBox(height: 10),
                              ],
                            )
                          : Row(
                              children: [
                                Expanded(
                                  child: ButtonAppComponent(
                                    label: "Entrar",
                                    onPressed: () {},
                                  ),
                                ),
                              ],
                            );
                    }),
                  ],
                );
              }),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {
              if (controller.isLoading.value) {
                return;
              }
              controller.isLoginBiometric.value = false;
            },
            child: TextComponent(
              value: "Entrar em outra conta",
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColor.pantone348C,
              fontFamily: AppFont.UnimedSans,
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Column renderForm(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        InputTextAppComponent(
          textInputAction: TextInputAction.next,
          onTap: () {
            Future.delayed(const Duration(milliseconds: 550)).then((val) {
              controller.scrollController.animateTo(
                controller.scrollController.position.maxScrollExtent,
                duration: Duration(milliseconds: 600),
                curve: Curves.fastOutSlowIn,
              );
            });
          },
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            CpfInputFormatter(),
          ],
          textInputType: TextInputType.number,
          textEditingController: controller.editUserCtrl,
          labelText: "Usuário",
          hintText: "Informe seu CPF",
          validator: (value) {
            return !(controller.error.value != null && value.isEmpty);
          },
        ),
        SizedBox(height: 16),
        InputTextAppComponent(
          onTap: () {
            Future.delayed(const Duration(milliseconds: 550)).then((val) {
              controller.scrollController.animateTo(
                controller.scrollController.position.maxScrollExtent,
                duration: Duration(milliseconds: 600),
                curve: Curves.fastOutSlowIn,
              );
            });
          },
          textEditingController: controller.editPasswordCtrl,
          textInputAction: TextInputAction.next,
          labelText: "Senha",
          obscureText: true,
          hintText: "Informe sua senha",
          onChanged: (value) {
            controller.error.value = null;
          },
          validator: (value) {
            return !(controller.error.value != null && value.isEmpty);
          },
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  Get.toNamed(RoutesApp.RECOVERY_PASSWORD);
                },
                child: TextComponent(
                  value: "Esqueci a senha",
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: AppColor.pantone348C,
                  fontFamily: AppFont.UnimedSans,
                ),
              ),
            ),
          ],
        ),
        Obx(() {
          return AnimatedCrossFade(
            duration: const Duration(milliseconds: 550),
            firstCurve: Curves.easeInOut,
            secondCurve: Curves.easeInOut,
            crossFadeState: controller.error.value != null
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstChild: Column(
              children: [
                AlertScreenApp(
                  title: "Falha no login",
                  description: [TextSpan(text: controller.error.value)],
                  theme: ThemeAlert.error,
                  onPressedClosed: () {
                    controller.error.value = null;
                  },
                ),
                SizedBox(height: 20),
              ],
            ),
            secondChild: Container(),
          );
        }),
        Row(
          children: [
            Expanded(
              child: Obx(
                () => SizedBox(
                  height: 80,
                  child: controller.isLoading.value == true
                      ? ProgressAppComponent()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ButtonAppComponent(
                                label: "Entrar",
                                color: AppColor.pantone382C,
                                textColor: AppColor.secondary,
                                padding: const EdgeInsets.all(0),
                                onPressed: () {
                                  controller.loginForm();
                                },
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: AppColor.highlight8,
        body: SafeArea(
          child: SingleChildScrollView(
            controller: controller.scrollController,
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: height),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    bottom: height * -ratePositionLogo,
                    child: Opacity(
                      opacity: 0.6,
                      child: Image.asset("assets/images/logo_unimedjp.png"),
                    ),
                  ),
                  Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Column(
                            children: [
                              ClipPath(
                                clipper: ClipperBackgroundLogin(
                                  angleDegrees: -140,
                                ),
                                child: Image.asset(
                                  "assets/images/splash_background.png",
                                ),
                              ),
                              const SizedBox(height: 45),
                            ],
                          ),
                          Image.asset("assets/images/logo_unimedjp.png"),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 26),
                        child: Column(children: [renderBody(context)]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ClipperBackgroundLogin extends CustomClipper<Path> {
  final double angleDegrees;

  ClipperBackgroundLogin({required this.angleDegrees});

  @override
  Path getClip(Size size) {
    final path = Path();

    double startX = 0;
    double startY = size.height - 60;
    double endX = size.width;
    double endY = size.height - 60;

    double distance = 100; // Tamanho da "força" da curva
    double angleRadians = angleDegrees * (pi / 180);

    double controlX = size.width / 2;
    double controlY =
        startY - distance * sin(angleRadians); // ângulo afeta a altura

    path.moveTo(startX, 0);
    path.lineTo(startX, startY);
    path.quadraticBezierTo(controlX, controlY, endX, endY);
    path.lineTo(endX, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
