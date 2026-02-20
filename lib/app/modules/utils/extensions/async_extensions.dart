import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;

class AsyncExtension {
  static Future<T> retry<T>(
    Future<T> Function() fn, {
    int retries = 5,
    String? logDebug,
  }) async {
    int attempt = 0;

    while (true) {
      try {
        final result = await fn();
        if (logDebug != null) print('✅ [$logDebug] CARREGADO');
        return result;
      } catch (e) {
        print('[$logDebug]: ${e.toString()}');
        attempt++;
        if (attempt >= retries) {
          rethrow;
        }

        final delay = Duration(seconds: 3 << (attempt - 1));
        await Future.delayed(delay);
      }
    }
  }

  static compressImage({required File file, required int quality}) async {
    return await compute(_compressAndEncode, {
      'path': file.path,
      'quality': quality,
    });
  }

  static Future<String?> _compressAndEncode(
    Map<String, dynamic> payload,
  ) async {
    final String path = payload['path'] as String;
    final int quality = payload['quality'] as int;

    final file = File(path);
    if (!await file.exists()) return null;

    final bytes = await file.readAsBytes();
    final image = img.decodeImage(bytes);
    if (image == null) return null;

    final compressed = img.encodeJpg(image, quality: quality);
    return base64Encode(compressed);
  }
}
