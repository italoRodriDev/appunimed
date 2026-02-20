import 'dart:async';

import 'package:app_colabora_unimedjp/app/data/repository/reset_password.repository.dart';
import 'package:app_colabora_unimedjp/app/data/utils/statuscode_validator.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/alerts/snackbar_app.component.dart';
import 'package:app_colabora_unimedjp/app/routers/app_routers.dart';
import 'package:app_colabora_unimedjp/app/services/config.service.dart';
import 'package:app_colabora_unimedjp/app/services/process_image.service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecoveryPasswordController extends GetxController {
  ResetPasswordRepository repo = ResetPasswordRepository();
  final ConfigService configService = Get.find<ConfigService>();
  final ProcessImageService processImageService =
      Get.find<ProcessImageService>();

  final ValueNotifier<int> currentStep = ValueNotifier(0);
  final ValueNotifier<String> selectedMethod = ValueNotifier('');
  final ValueNotifier<int> timeSendCode = ValueNotifier(0);
  TextEditingController editCpfCtrl = TextEditingController();
  TextEditingController editPasswordCtrl = TextEditingController();
  TextEditingController editConfirmPasswordCtrl = TextEditingController();
  RxBool isLoading = false.obs;

  TextEditingController editCode1 = TextEditingController();
  TextEditingController editCode2 = TextEditingController();
  TextEditingController editCode3 = TextEditingController();
  TextEditingController editCode4 = TextEditingController();
  TextEditingController editCode5 = TextEditingController();
  TextEditingController editCode6 = TextEditingController();

  startTime() {
    timeSendCode.value = 60;
    Timer.periodic(Duration(seconds: 1), (timer) {
      timeSendCode.value--;
      if (timeSendCode.value == 0) {
        timer.cancel();
      }
    });
  }

  validBackSteps() {
    if (currentStep.value > 0 && currentStep.value < 3) {
      currentStep.value--;
    } else {
      Get.offAndToNamed(RoutesApp.LOGIN);
    }
  }

  validNextSteps() {
    FocusManager.instance.primaryFocus?.unfocus();
    switch (currentStep.value) {
      case 0:
        validCPF();
      case 1:
        validMethodSelect();
      case 2:
        validCodeVerification();
      case 3:
        sendUpdatePassword();
      case 4:
        resetData();
        Get.offAndToNamed(RoutesApp.LOGIN);
    }
  }

  validCPF() async {
    if (editCpfCtrl.text.isNotEmpty) {
      String doc = editCpfCtrl.text.replaceAll('.', '').replaceAll('-', '');
      Response res = await repo.getContacts(cpf: doc);
      print(res.body);
      await AuthStatusCode.getStatus(res, (success) {
        print(res.body);
        currentStep.value++;
      }, (error) {});
    } else {
      await SnackbarAppComponent.show(
        Get.context!,
        text: 'Preencha todos os campos',
      );
    }
  }

  validMethodSelect() async {
    if (selectedMethod.value != '') {
      currentStep.value++;
    } else {
      await SnackbarAppComponent.show(
        Get.context!,
        text: 'Selecione o metodo de recuperação.',
      );
    }
  }

  validCodeVerification() async {
    if (editCode1.text.isNotEmpty &&
        editCode2.text.isNotEmpty &&
        editCode3.text.isNotEmpty &&
        editCode4.text.isNotEmpty &&
        editCode5.text.isNotEmpty &&
        editCode6.text.isNotEmpty) {
      currentStep.value++;
    } else {
      await SnackbarAppComponent.show(
        Get.context!,
        text: 'Digite o código de 6 digitos.',
      );
    }
  }

  sendUpdatePassword() {
    currentStep.value = 4;
  }

  void resetData() {
    editCpfCtrl.clear();
    editPasswordCtrl.clear();
    editConfirmPasswordCtrl.clear();
    selectedMethod.value = '';
    currentStep.value = 0;
  }
}
