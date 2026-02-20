import 'package:app_colabora_unimedjp/app/modules/auth/recovery-password/controller/recovery_password.controller.dart';
import 'package:app_colabora_unimedjp/app/modules/auth/recovery-password/view/components/select_radio.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/text_app.component.dart';
import 'package:app_colabora_unimedjp/app/services/config.service.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_crise/components/text.component.dart';
import 'package:flutter_crise/components/verification_code_input.component.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/fonts/fonts.dart';
import '../../../utils/components/button_app.component.dart';
import '../../../utils/components/inputs/input_app.component.dart';
import '../../../utils/components/progress_app.component.dart';
import '../../../utils/components/toolbars/toolbar_app.component.dart';

class RecoveryPasswordPage extends GetView<RecoveryPasswordController> {
  ConfigService configService = Get.find<ConfigService>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return LoadingOverlay(
        color: Colors.black.withAlpha(40),
        isLoading: configService.isLoading,
        progressIndicator: ProgressAppComponent(),
        child: Scaffold(
          appBar: AppBar(
            bottom: PreferredSize(
              preferredSize: Size(double.infinity, 0),
              child: ToolbarAppComponent(
                onPressedMenu: () {},
                onPressedBack: () {
                  controller.validBackSteps();
                },
                title: "Recuperar senha",
                showMenu: false,
              ),
            ),
          ),
          body: SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      ValueListenableBuilder(
                        valueListenable: controller.currentStep,
                        builder: (context, int step, child) {
                          if (step == 0) {
                            return buildStepOne(step: step);
                          }

                          if (step == 1) {
                            return buildStepTwo(step: step);
                          }

                          if (step == 2) {
                            return buildStepThree(step: step);
                          }

                          if (step == 3) {
                            return buildStepFour(step: step);
                          }

                          if (step == 4) {
                            return buildStepFinish(step: step);
                          }

                          return Container();
                        },
                      ),

                      SizedBox(height: 50),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: ValueListenableBuilder(
                    valueListenable: controller.currentStep,
                    builder: (context, int step, child) {
                      return Padding(
                        padding: EdgeInsetsGeometry.all(50),
                        child: Row(
                          children: [
                            Expanded(
                              child: Obx(
                                () => SizedBox(
                                  height: 42,
                                  child: controller.isLoading.value == true
                                      ? ProgressAppComponent()
                                      : buildButtonNext(step: step),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget buildStepOne({required int step}) {
    return Column(
      children: [
        SizedBox(height: 30),
        TextAppComponent(
          value: 'Esqueceu sua senha?',
          color: AppColor.pantone348C,
          fontSize: 24,
          fontFamily: AppFont.UnimedSlab,
          fontWeight: FontWeight.w300,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
        TextAppComponent(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          textAlign: TextAlign.center,
          fontFamily: AppFont.UnimedSans,
          color: AppColor.pantone7722C,
          value: 'Informe seu CPF para recuperar suas conta.',
        ),
        SizedBox(height: 16),
        InputTextAppComponent(
          textEditingController: controller.editCpfCtrl,
          textInputAction: TextInputAction.next,
          textInputType: TextInputType.number,
          labelText: "CPF",
          hintText: "Informe seu CPF",
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            CpfInputFormatter(),
          ],
        ),
      ],
    );
  }

  Widget buildStepTwo({required int step}) {
    return Column(
      children: [
        SizedBox(height: 30),
        TextAppComponent(
          value: 'Como deseja recuperar sua senha?',
          color: AppColor.pantone348C,
          fontSize: 24,
          fontFamily: AppFont.UnimedSlab,
          fontWeight: FontWeight.w300,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
        TextAppComponent(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          textAlign: TextAlign.center,
          fontFamily: AppFont.UnimedSans,
          color: AppColor.pantone7722C,
          value: 'Escolha o método que deseja recuperar sua senha.',
        ),
        SizedBox(height: 20),
        ValueListenableBuilder(
          valueListenable: controller.selectedMethod,
          builder: (context, String method, child) {
            return Column(
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.only(left: 8),
                  child: SelectRadioTile(
                    selected: controller.selectedMethod.value == 'EMAIL',
                    title:
                        'Quero receber um código de validação no e-mail a baixo.',
                    subtitle: '********@gmail.com',
                    onTap: () {
                      controller.selectedMethod.value = 'EMAIL';
                    },
                  ),
                ),
                SizedBox(height: 20),

                Padding(
                  padding: EdgeInsetsGeometry.only(left: 8),
                  child: SelectRadioTile(
                    selected: controller.selectedMethod.value == 'PHONE',
                    title:
                        'Quero receber um código de validação no telefone a baixo.',
                    subtitle: '******-4003',
                    onTap: () {
                      controller.selectedMethod.value = 'PHONE';
                    },
                  ),
                ),
                SizedBox(height: 16),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget buildStepThree({required int step}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 30),
        TextAppComponent(
          value: 'Envio realizado',
          color: AppColor.pantone348C,
          fontSize: 24,
          fontFamily: AppFont.UnimedSlab,
          fontWeight: FontWeight.w300,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
        TextAppComponent(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          textAlign: TextAlign.center,
          fontFamily: AppFont.UnimedSans,
          color: AppColor.pantone7722C,
          value:
              'Digite o código que enviamos para você via ${controller.selectedMethod.value == 'EMAIL' ? 'e-mail' : 'SMS'}',
        ),
        SizedBox(height: 20),
        VerificationCodeInputComponent(
          onChanged: () {},
          colorInput: AppColor.pantone7722C,
          controllers: [
            controller.editCode1,
            controller.editCode2,
            controller.editCode3,
            controller.editCode4,
            controller.editCode5,
            controller.editCode6,
          ],
        ),
        SizedBox(height: 10),
        ValueListenableBuilder(
          valueListenable: controller.timeSendCode,
          builder: (context, int time, child) {
            if (time > 0) {
              return Column(
                children: [
                  TextAppComponent(
                    value:
                        'Você poderá enviar outro código em ${time} segundos.',
                  ),
                ],
              );
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      controller.startTime();
                    },
                    child: TextComponent(
                      value: "Reenviar código",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColor.pantone348C,
                      fontFamily: AppFont.UnimedSans,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget buildStepFour({required int step}) {
    return Column(
      children: [
        SizedBox(height: 30),
        TextAppComponent(
          value: 'Nova senha',
          color: AppColor.pantone348C,
          fontSize: 24,
          fontFamily: AppFont.UnimedSlab,
          fontWeight: FontWeight.w300,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 8),
        TextAppComponent(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          textAlign: TextAlign.center,
          fontFamily: AppFont.UnimedSans,
          color: AppColor.pantone7722C,
          value: 'Insira nos campos abaixo a nova senha que deseja cadastrar.',
        ),
        SizedBox(height: 20),
        InputTextAppComponent(
          textEditingController: controller.editPasswordCtrl,
          textInputAction: TextInputAction.next,
          labelText: "Nova senha",
          hintText: "Crie uma nova senha",
          obscureText: true,
        ),

        SizedBox(height: 16),
        InputTextAppComponent(
          textEditingController: controller.editConfirmPasswordCtrl,
          textInputAction: TextInputAction.next,
          labelText: "Confirme sua nova senha",
          hintText: "Repita a senha novamente",
          obscureText: true,
        ),

        SizedBox(height: 16),
        TextAppComponent(
          value:
              'Sua senha pode ser uma combinação de letras e números, e ter no mínimo 8 caracteres.',
        ),
      ],
    );
  }

  Widget buildStepFinish({required int step}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 250),
      child: Column(
        children: [
          TextAppComponent(
            value: 'Senha recuperada com sucesso',
            color: AppColor.pantone348C,
            fontSize: 24,
            fontFamily: AppFont.UnimedSlab,
            fontWeight: FontWeight.w300,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          TextAppComponent(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            textAlign: TextAlign.center,
            fontFamily: AppFont.UnimedSans,
            color: AppColor.pantone7722C,
            value: 'Agora você poder realizar seu login com sua nova senha.',
          ),
        ],
      ),
    );
  }

  Widget buildButtonNext({required int step}) {
    return Row(
      children: [
        Expanded(
          child: Obx(
            () => SizedBox(
              height: 42,
              child: controller.isLoading.value == true
                  ? ProgressAppComponent()
                  : ButtonAppComponent(
                      label: getLabel(step),
                      color: AppColor.pantone382C,
                      textColor: AppColor.secondary,
                      padding: const EdgeInsets.all(0),
                      onPressed: () async {
                        await controller.validNextSteps();
                      },
                    ),
            ),
          ),
        ),
      ],
    );
  }

  String getLabel(int step) {
    switch (step) {
      case 0:
        return 'Continuar';
      case 1:
        return 'Enviar código de verificação';
      case 2:
        return 'Validar código de verificação';
      case 3:
        return 'Confirmar alteração';
      case 4:
        return 'Voltar ao login';
      default:
        return 'Continuar';
    }
  }
}
