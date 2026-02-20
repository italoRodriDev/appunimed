import 'package:flutter/widgets.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

extension StringExtensions on String {
  Color toColor() {
    String hex = replaceAll("#", "");

    if (hex.length == 6) {
      hex = "FF$hex";
    }

    return Color(int.parse(hex, radix: 16));
  }

  static String formateCEP(text) {
    final cepMask = MaskTextInputFormatter(
      mask: '#####-###',
      filter: {'#': RegExp(r'[0-9]')},
    );

    return cepMask.maskText(text);
  }

  static String formatePhone(text) {
    final phoneMask = MaskTextInputFormatter(
      mask: '(##) #####-####',
      filter: {'#': RegExp(r'[0-9]')},
    );
    return phoneMask.maskText(text);
  }

  static String capitalizeFirst(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }
}
