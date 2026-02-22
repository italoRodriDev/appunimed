import 'dart:io' show File;

import 'package:app_colabora_unimedjp/app/modules/utils/components/alerts/popup_double_app.component.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/colors/colors.dart';
import '../../../../services/config.service.dart';
import '../../../../services/process_image.service.dart';
import '../../../utils/components/alerts/snackbar_app.component.dart';
import '../view/forms/send_solicitation_modal.dart';

class AssistenceReimbursementController extends GetxController {
  final ConfigService configService = Get.find<ConfigService>();
  final ProcessImageService processImageService =
      Get.find<ProcessImageService>();

  final ValueNotifier<List<File?>> documentos = ValueNotifier([]);
  final ValueNotifier<List<dynamic>> documentosBase64 = ValueNotifier([]);
  final ValueNotifier<File?> formularioAutorizacao = ValueNotifier(null);

  TextEditingController rg = TextEditingController();
  TextEditingController cpf = TextEditingController();
  TextEditingController beneficiario = TextEditingController();
  TextEditingController tipoInfoBancaria = TextEditingController();
  TextEditingController nome = TextEditingController();
  TextEditingController cpfConta = TextEditingController();
  TextEditingController banco = TextEditingController();
  TextEditingController agencia = TextEditingController();
  TextEditingController conta = TextEditingController();
  TextEditingController tipoConta = TextEditingController();

  TextEditingController tipoReembolso = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController telefone = TextEditingController();
  TextEditingController motivo = TextEditingController();
  TextEditingController valorReembolso = TextEditingController();
  TextEditingController descricao = TextEditingController();
  ValueNotifier<bool> termsEvent = ValueNotifier(false);

  showAlertOptionsSelectFiles(BuildContext context) async {
    await PopupDoubleAppComponent.show(
      context,
      imageUrl: '',
      titleText: 'Qual o tipo de documento?',
      contentText: 'Selecione umas das opções abaixo.',
      titleButton1: 'Arquivos',
      titleButton2: 'Câmera/galeria',
      colorTitle: AppColor.pantone348C,
      fontSizeTitle: 18,
      colorText: AppColor.neutral1,
      textColorBtn1: AppColor.pantone348C,
      textColorBtn2: AppColor.pantone348C,
      onPressedBtn1: () {
        pickPdf('DOCUMENTOS');
      },
      onPressedBtn2: () {
        showAlertCamAndGallery(context);
      },
    );
  }

  showAlertCamAndGallery(BuildContext context) async {
    await PopupDoubleAppComponent.show(
      context,
      imageUrl: '',
      titleText: 'Como deseja selecionar?',
      contentText: 'Selecione umas das opções abaixo.',
      titleButton1: 'Abrir câmera',
      titleButton2: 'Abrir galeria',
      colorTitle: AppColor.pantone348C,
      fontSizeTitle: 18,
      colorText: AppColor.neutral1,
      textColorBtn1: AppColor.pantone348C,
      textColorBtn2: AppColor.pantone348C,
      onPressedBtn1: () {
        getPhotoFromCam();
      },
      onPressedBtn2: () {
        getPhotoFromGallery();
      },
    );
  }

  Future<void> pickPdf(type) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      if (type == 'FORMULARIO') {
        formularioAutorizacao.value = File(result.files.single.path!);
        formularioAutorizacao.notifyListeners();
      } else {
        documentos.value.add(File(result.files.single.path!));
        documentos.notifyListeners();
      }
    }
  }

  Future<void> getPhotoFromCam() async {
    final result = await processImageService.getPhotoFromCam();

    if (result != null) {
      documentos.value.add(result.previewFile);
      documentosBase64.value.add(result.base64);
      documentos.notifyListeners();
      documentosBase64.notifyListeners();
    }
  }

  Future<void> getPhotoFromGallery() async {
    final result = await processImageService.getPhotoFromGallery();

    if (result != null) {
      documentos.value.add(result.previewFile);
      documentosBase64.value.add(result.base64);
      documentos.notifyListeners();
      documentosBase64.notifyListeners();
    }
  }

  sendSolucitation() async {
    if (cpf.text.isNotEmpty &&
        beneficiario.text.isNotEmpty &&
        tipoInfoBancaria.text.isNotEmpty &&
        nome.text.isNotEmpty &&
        cpfConta.text.isNotEmpty &&
        banco.text.isNotEmpty &&
        agencia.text.isNotEmpty &&
        conta.text.isNotEmpty &&
        tipoConta.text.isNotEmpty &&
        tipoReembolso.text.isNotEmpty &&
        email.text.isNotEmpty &&
        telefone.text.isNotEmpty &&
        motivo.text.isNotEmpty &&
        valorReembolso.text.isNotEmpty &&
        descricao.text.isNotEmpty &&
        documentos.value.isNotEmpty) {
      if (termsEvent.value == true) {
        Get.back();
        Navigator.push(
          Get.context!,
          MaterialPageRoute(builder: (context) => SendSolicitationModal()),
        );
        resetData();
      } else {
        await SnackbarAppComponent.show(
          Get.context!,
          text: 'Você precisa aceitar os termos e condições.',
        );
      }
    } else {
      await SnackbarAppComponent.show(
        Get.context!,
        text: 'Preencha todos os campos e anexe os documentos obrigatórios.',
      );
    }
  }

  void resetData() {
    rg.clear();
    cpf.clear();
    beneficiario.clear();
    tipoInfoBancaria.clear();
    nome.clear();
    cpfConta.clear();
    banco.clear();
    agencia.clear();
    conta.clear();
    tipoConta.clear();
    tipoReembolso.clear();
    email.clear();
    telefone.clear();
    motivo.clear();
    valorReembolso.clear();
    descricao.clear();
    termsEvent.value = false;
    documentos.value = [];
    documentosBase64.value = [];
    formularioAutorizacao.value = null;
  }
}
