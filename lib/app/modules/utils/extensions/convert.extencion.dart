import 'dart:convert';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class ConvertData {
  static String sanitizeBase64(String? input) {
    if (input == null || input.isEmpty) return '';

    if (input.contains(',')) {
      input = input.split(',').last;
    }

    input = input.replaceAll(RegExp(r'\s+'), '');

    return input;
  }

  static Future<File?> base64ToFile(String? base64Str, String filename) async {
    final cleanBase64 = sanitizeBase64(base64Str);

    if (cleanBase64.isEmpty) {
      return null;
    }

    try {
      final bytes = base64Decode(cleanBase64);
      final dir = await getTemporaryDirectory();
      final file = File('${dir.path}/$filename');
      await file.writeAsBytes(bytes);
      return file;
    } catch (e) {
      return null;
    }
  }
}
