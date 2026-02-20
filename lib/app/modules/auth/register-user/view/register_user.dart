import 'dart:io';

import 'package:app_colabora_unimedjp/app/modules/utils/components/text_app.component.dart';
import 'package:app_colabora_unimedjp/app/services/config.service.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/fonts/fonts.dart';
import '../../../utils/components/avatar_app.component.dart';
import '../../../utils/components/button_app.component.dart';
import '../../../utils/components/inputs/input_app.component.dart';
import '../../../utils/components/progress_app.component.dart';
import '../../../utils/components/toolbars/toolbar_app.component.dart';
import '../controller/register_user.controller.dart';

class RegisterUserPage extends GetView<RegisterUserController> {
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
                title: "Primeiro acesso",
                showMenu: false,
              ),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      TextAppComponent(
                        value: 'É seu primeiro acesso?',
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
                            'Informe seus dados para finalizarmos o cadastro da sua conta.',
                      ),
                      SizedBox(height: 8),
                      ValueListenableBuilder(
                        valueListenable: controller.previewPhotoFile,
                        builder: (context, File? file, child) {
                          return buildAvatar();
                        },
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
                      SizedBox(height: 16),
                      InputTextAppComponent(
                        textEditingController: controller.editDateCtrl,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.number,
                        labelText: "Data de nascimento",
                        hintText: "Informe sua data de nascimento",
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          DataInputFormatter()
                        ],
                      ),
                      SizedBox(height: 16),
                      InputTextAppComponent(
                        textEditingController: controller.editEmailCtrl,
                        textInputAction: TextInputAction.next,
                        labelText: "E-mail",
                        hintText: "Confirme seu e-mail",
                      ),

                      SizedBox(height: 16),
                      InputTextAppComponent(
                        textEditingController: controller.editPhoneCtrl,
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.number,
                        labelText: "Telefone",
                        hintText: "Informe seu telefone",
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter(),
                        ],
                      ),
                      SizedBox(height: 16),
                      InputTextAppComponent(
                        textEditingController: controller.editPasswordCtrl,
                        textInputAction: TextInputAction.next,
                        labelText: "Senha",
                        hintText: "Crie uma senha",
                        obscureText: true,
                      ),

                      SizedBox(height: 16),
                      InputTextAppComponent(
                        textEditingController:
                            controller.editConfirmPasswordCtrl,
                        textInputAction: TextInputAction.next,
                        labelText: "Confirme a senha",
                        hintText: "Repita a senha novamente",
                        obscureText: true,
                      ),

                      SizedBox(height: 16),
                      TextAppComponent(
                        value:
                            'Sua senha pode ser uma combinação de letras e números, e ter no mínimo 8 caracteres.',
                      ),
                      SizedBox(height: 50),
                      Row(
                        children: [
                          Expanded(
                            child: Obx(
                              () => SizedBox(
                                height: 42,
                                child: controller.isLoading.value == true
                                    ? ProgressAppComponent()
                                    : ButtonAppComponent(
                                        label: "Cadastrar",
                                        color: AppColor.pantone382C,
                                        textColor: AppColor.secondary,
                                        padding: const EdgeInsets.all(0),
                                        onPressed: () async {
                                          await controller.sendRegister();
                                        },
                                      ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget buildAvatar() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsetsGeometry.only(
            left: 10,
            right: 10,
            top: 10,
            bottom: 10,
          ),
          child: Center(
            child: ValueListenableBuilder(
              valueListenable: controller.previewPhotoFile,
              builder: (context, value, child) {
                if (value == null) {
                  return AvatarAppComponent(
                    borderColor: AppColor.pantone7722C,
                    radius: 100,
                    imageUrl: 'assets/images/avatar.jpg',
                  );
                } else {
                  return AvatarAppComponent(
                    imageUrl: value.path,
                    imageFile: controller.previewPhotoFile.value,
                    radius: 100,
                    borderColor: AppColor.pantone7722C,
                  );
                }
              },
            ),
          ),
        ),
        Obx(() {
          final isLoading = configService.isLoading;
          return isLoading == false
              ? Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 200,
                          child: ButtonAppComponent(
                            onPressed: () {
                              controller.getPhotoFromCam();
                            },
                            padding: EdgeInsetsGeometry.all(10),
                            borderRadius: 100,
                            label: 'Abrir câmera',
                            color: AppColor.pantone7722C,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 200,
                          child: ButtonAppComponent(
                            padding: EdgeInsetsGeometry.all(10),
                            borderRadius: 100,
                            onPressed: () {
                              controller.getPhotoFromGallery();
                            },
                            label: 'Selecionar da galeria',
                            color: AppColor.pantone7722C,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : Container();
        }),
      ],
    );
  }
}
