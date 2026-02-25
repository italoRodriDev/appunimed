import 'dart:io';

import 'package:app_colabora_unimedjp/app/data/models/chat.model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../config/colors/colors.dart';
import '../../../../services/process_image.service.dart';
import '../../../utils/components/alerts/popup_double_app.component.dart';

class ChatController extends GetxController {
  final ProcessImageService processImageService =
      Get.find<ProcessImageService>();
  final ValueNotifier<List<File>> files = ValueNotifier([]);
  final ValueNotifier<List<dynamic>> filesBase64 = ValueNotifier([]);

  var messages = <ChatModel>[].obs;

  void sendMessage(String text) {
    messages.add(ChatModel(text: text, isMe: 0, files: files.value));

    Future.delayed(const Duration(seconds: 1), () {
      messages.add(ChatModel(text: "Resposta automática", isMe: 1));
    });
  }

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
        pickPdf();
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

  Future<void> pickPdf() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      files.value.add(File(result.files.single.path!));
      files.notifyListeners();
    }
  }

  Future<void> getPhotoFromCam() async {
    final result = await processImageService.getPhotoFromCam();

    if (result != null) {
      files.value.add(result.previewFile);
      filesBase64.value.add(result.base64);
      files.notifyListeners();
      filesBase64.notifyListeners();
    }
  }

  Future<void> getPhotoFromGallery() async {
    final result = await processImageService.getPhotoFromGallery();

    if (result != null) {
      files.value.add(result.previewFile);
      filesBase64.value.add(result.base64);
      files.notifyListeners();
      filesBase64.notifyListeners();
    }
  }
}
