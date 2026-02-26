import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/colors/colors.dart';
import '../../../../data/models/contact.model.dart';
import '../../../../services/config.service.dart';
import '../../../../services/process_image.service.dart';
import '../../../utils/components/alerts/popup_double_app.component.dart';

class TalkToUsController extends GetxController {
  final ConfigService configService = Get.find<ConfigService>();
  final ProcessImageService processImageService =
      Get.find<ProcessImageService>();

  final ValueNotifier<List<File?>> documentos = ValueNotifier([]);
  final ValueNotifier<List<dynamic>> documentosBase64 = ValueNotifier([]);
  ValueNotifier<List<ContactModel>> listContacts = ValueNotifier([
    ContactModel(
      id: 1,
      nome: 'Hospital Alberto Urquiza Wanderley',
      especialidade: 'Hospital Geral / Urgência e Emergência',
      crm: 'PJ-001',
      tipo: 'Hospital Próprio',
      endereco: 'Av. Min. José Américo de Almeida, 1450',
      bairro: 'Torre',
      cidade: 'João Pessoa',
      telefone: '(83) 3506-8000',
      whatsapp: '(83) 99113-0000',
      localizacao: '-7.1265,-34.8631',
    ),
  ]);

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
      documentos.value.add(File(result.files.single.path!));
      documentos.notifyListeners();
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
}
