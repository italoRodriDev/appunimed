import 'dart:io';

import 'package:app_colabora_unimedjp/app/services/config.service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../config/colors/colors.dart';
import '../modules/utils/components/alerts/snackbar_app.component.dart';
import '../modules/utils/extensions/async_extensions.dart';

const int MAX_FILE_BYTES = 7 * 1024 * 1024;
const int CROP_MAX_SIDE = 1024;

class ProcessedImageResult {
  final File previewFile;
  final String base64;

  ProcessedImageResult({required this.previewFile, required this.base64});
}

class ProcessImageService extends GetxService {
  final ConfigService configService = Get.find<ConfigService>();

  Future<ProcessImageService> init() async {
    return this;
  }

  Future<ProcessedImageResult?> getPhotoFromCam() async {
    final ImagePicker picker = ImagePicker();

    final XFile? data = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      preferredCameraDevice: CameraDevice.front,
    );

    if (data == null) return null;

    return await _cropperPhoto(data);
  }

  Future<ProcessedImageResult?> getPhotoFromGallery() async {
    final ImagePicker picker = ImagePicker();

    final XFile? data = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );

    if (data == null) return null;

    return await _cropperPhoto(data);
  }

  Future<ProcessedImageResult?> _cropperPhoto(XFile file) async {
    final cropped = await ImageCropper().cropImage(
      sourcePath: file.path,
      maxWidth: CROP_MAX_SIDE,
      maxHeight: CROP_MAX_SIDE,
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Ajuste sua foto',
          toolbarColor: AppColor.pantone348C,
          toolbarWidgetColor: Colors.white,
          activeControlsWidgetColor: AppColor.pantone382C,
          backgroundColor: AppColor.pantone7722C,
          cropGridColor: AppColor.pantone382C,
          cropFrameColor: AppColor.pantone348C,
          dimmedLayerColor: AppColor.pantone7722C,
          lockAspectRatio: true,
          aspectRatioPresets: [CropAspectRatioPreset.square],
        ),
        IOSUiSettings(
          title: 'Ajuste sua foto',
          cancelButtonTitle: 'Cancelar',
          doneButtonTitle: 'Confirmar',
          aspectRatioPresets: [CropAspectRatioPreset.square],
        ),
      ],
    );

    if (cropped == null) return null;

    configService.increasseLoadingQueue();

    try {
      final File previewFile = File(cropped.path);

      final String? base64 = await _convertFileToBase64Compressed(
        previewFile,
        quality: 70,
      );

      if (base64 == null) {
        await SnackbarAppComponent.show(
          Get.context!,
          text: 'Erro ao processar a imagem.',
        );
        return null;
      }

      return ProcessedImageResult(previewFile: previewFile, base64: base64);
    } catch (e) {
      await SnackbarAppComponent.show(
        Get.context!,
        text: 'Erro inesperado ao processar a imagem.',
      );
      return null;
    } finally {
      configService.decreasseLoadingQueue();
    }
  }

  Future<String?> _convertFileToBase64Compressed(
    File file, {
    int quality = 50,
  }) async {
    final int bytes = await file.length();

    if (bytes > MAX_FILE_BYTES) {
      await SnackbarAppComponent.show(
        Get.context!,
        text: 'Imagem muito grande. Escolha uma menor.',
      );
      return null;
    }

    final result = await AsyncExtension.compressImage(
      file: file,
      quality: quality,
    );

    return result;
  }
}
