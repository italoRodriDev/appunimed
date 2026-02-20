import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/fonts/fonts.dart';

class PopupAppComponent {
  static SimpleDialog _buildPopupDialog({
    BuildContext? context,
    String titleText = 'titulo',
    String contentText = 'Descrição',
    String imageUrl = '',
    String titleButton = '',
    double fontSizeTitle = 18,
    Color colorText = Colors.black,
    Color colorTitle = Colors.black,
    Function? onPressedConfirm,
  }) {
    final double horizontalPadding = 16;

    Widget buildImage(String url) {
      if (url.contains('https://')) {
        return Image.network(url);
      } else if (url.contains('assets')) {
        return Image.asset(url);
      } else if (url.contains('.svg')) {
        return SvgPicture.asset(url, height: 80);
      } else {
        return Image.asset(url);
      }
    }

    return SimpleDialog(
      titlePadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      contentPadding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 8,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10),
          imageUrl.isNotEmpty
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: buildImage(imageUrl),
                )
              : Container(),
          Padding(
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
        ],
      ),
      children: [
        Text(
          contentText,
          style: TextStyle(color: AppColor.neutral1, fontSize: 14),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context!);
                  if (onPressedConfirm != null) {
                    onPressedConfirm();
                  }
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: AppColor.pantone348C, width: 2),
                  backgroundColor: AppColor.pantone348C,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 5,
                  ),
                ),
                child: Text(
                  titleButton,
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  static Future<void> show(
    BuildContext context, {
    required String titleText,
    String contentText = "",
    required String titleButton,
    String imageUrl = "",
    double fontSizeTitle = 18,
    Color colorText = Colors.black,
    Color colorTitle = AppColor.pantone348C,
    bool? isImageBackground,
    Function? onPressedConfirm,
  }) async {
    await showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return _buildPopupDialog(
          context: context,
          imageUrl: imageUrl,
          titleText: titleText,
          titleButton: titleButton,
          contentText: contentText,
          colorText: colorText,
          colorTitle: colorTitle,
          fontSizeTitle: fontSizeTitle,
          onPressedConfirm: onPressedConfirm,
        );
      },
    );
  }
}
