import 'dart:io';

import 'package:app_colabora_unimedjp/app/modules/utils/components/alerts/popup_app.component.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/alerts/snackbar_app.component.dart';
import 'package:app_colabora_unimedjp/app/services/config.service.dart';
import 'package:app_colabora_unimedjp/app/services/process_image.service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/colors/colors.dart';

class RegisterUserController extends GetxController {
  final ConfigService configService = Get.find<ConfigService>();
  final ProcessImageService processImageService =
      Get.find<ProcessImageService>();

  RxBool isLoading = false.obs;
  final ValueNotifier<File?> previewPhotoFile = ValueNotifier(null);
  final ValueNotifier<dynamic> photoBase64 = ValueNotifier(null);
  TextEditingController editCpfCtrl = TextEditingController();
  TextEditingController editDateCtrl = TextEditingController();
  TextEditingController editEmailCtrl = TextEditingController();
  TextEditingController editPhoneCtrl = TextEditingController();
  TextEditingController editPasswordCtrl = TextEditingController();
  TextEditingController editConfirmPasswordCtrl = TextEditingController();

  showAlertSuccess(BuildContext context) async {
    await PopupAppComponent.show(
      context,
      titleText: 'Cadastro realizado com sucesso',
      contentText: 'Agora você poder realizar seu login.',
      imageUrl: '',
      titleButton: 'Fazer login',
      colorTitle: AppColor.pantone348C,
      colorText: AppColor.pantone348C,
      fontSizeTitle: 18,
      onPressedConfirm: () {
        Get.back();
      },
    );
  }

  Future<void> getPhotoFromCam() async {
    final result = await processImageService.getPhotoFromCam();

    if (result != null) {
      previewPhotoFile.value = result.previewFile;
      photoBase64.value = result.base64;
    }
  }

  Future<void> getPhotoFromGallery() async {
    final result = await processImageService.getPhotoFromGallery();

    if (result != null) {
      previewPhotoFile.value = result.previewFile;
      photoBase64.value = result.base64;
    }
  }

  sendRegister() async {
    if (editCpfCtrl.text.isNotEmpty &&
        editDateCtrl.text.isNotEmpty &&
        editEmailCtrl.text.isNotEmpty &&
        editPhoneCtrl.text.isNotEmpty &&
        editPasswordCtrl.text.isNotEmpty &&
        editConfirmPasswordCtrl.text.isNotEmpty) {
      if (previewPhotoFile.value != null) {
        if (editPasswordCtrl.text == editConfirmPasswordCtrl.text) {
          showAlertSuccess(Get.context!);
          resetData();
        } else {
          await SnackbarAppComponent.show(
            Get.context!,
            text: 'As senhas não batem',
          );
        }
      } else {
        await SnackbarAppComponent.show(
          Get.context!,
          text: 'Selecione uma foto',
        );
      }
    } else {
      await SnackbarAppComponent.show(
        Get.context!,
        text: 'Preencha todos os campos',
      );
    }
  }

  void resetData() {
    editCpfCtrl.clear();
    editDateCtrl.clear();
    editEmailCtrl.clear();
    editPhoneCtrl.clear();
    editPasswordCtrl.clear();
    editConfirmPasswordCtrl.clear();
    previewPhotoFile.value = null;
    photoBase64.value = null;
  }
}
