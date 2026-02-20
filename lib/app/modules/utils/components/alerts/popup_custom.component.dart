import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:flutter/material.dart';

import '../../../../config/fonts/fonts.dart';

class PopupCustomComponent {
  static SimpleDialog _buildPopupDialog({
    BuildContext? context,
    required String titleText,
    required String contentText,
    required double fontSizeTitle,
    required Color colorTitle,
    required List<Widget> children,
  }) {
    final double horizontalPadding = 16;

    return SimpleDialog(
      titlePadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      contentPadding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 8,
      ),
      title: Padding(
        padding: EdgeInsets.only(
          left: horizontalPadding,
          right: horizontalPadding,
          top: 16,
        ),
        child: Text(
          titleText,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: colorTitle,
            fontFamily: AppFont.UnimedSans,
            fontWeight: FontWeight.bold,
            fontSize: fontSizeTitle,
          ),
        ),
      ),
      children: [
        const SizedBox(height: 8),
        Text(
          contentText,
          style: TextStyle(color: Colors.black, fontSize: 14),
          textAlign: TextAlign.left,
        ),
        const SizedBox(height: 16),
        ...children,
      ],
    );
  }

  static Future<void> show(
    BuildContext context, {
    String titleText = 'titulo',
    String contentText = 'Descrição',
    double fontSizeTitle = 18,
    Color colorTitle = AppColor.pantone348C,
    List<Widget> children = const [],
  }) async {
    await showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return _buildPopupDialog(
          context: context,
          titleText: titleText,
          contentText: contentText,
          colorTitle: colorTitle,
          fontSizeTitle: fontSizeTitle,
          children: children,
        );
      },
    );
  }
}
