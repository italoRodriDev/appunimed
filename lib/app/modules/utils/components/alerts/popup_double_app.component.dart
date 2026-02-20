import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/fonts/fonts.dart';

class PopupDoubleAppComponent {
  static SimpleDialog _buildPopupDialog({
    BuildContext? context,
    String titleText = 'titulo',
    dynamic contentText = 'Descrição',
    String imageUrl = '',
    String titleButton1 = '',
    String titleButton2 = '',
    double fontSizeTitle = 18,
    Color colorText = Colors.black,
    Color colorTitle = Colors.black,
    Color? borderColorBtn1,
    Color? backgroundColorBtn1,
    Color? textColorBtn1,
    Color? borderColorBtn2,
    Color? backgroundColorBtn2,
    Color? textColorBtn2,
    Function? onPressedBtn1,
    Function? onPressedBtn2,
    bool? isWidgetDescription,
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
          const SizedBox(height: 10),
          imageUrl.isNotEmpty
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                  child: buildImage(imageUrl),
                )
              : Container(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Text(
              titleText,
              style: TextStyle(
                color: colorTitle,
                fontWeight: FontWeight.bold,
                fontFamily: AppFont.UnimedSlab,
                fontSize: fontSizeTitle,
              ),
            ),
          ),
        ],
      ),
      children: [
        isWidgetDescription == true && contentText is Widget
            ? contentText
            : Text(
                contentText,
                style: TextStyle(color: colorText, fontSize: 14),
                textAlign: TextAlign.center,
              ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context!);
                  if (onPressedBtn1 != null) onPressedBtn1();
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: borderColorBtn1 ?? AppColor.pantone348C,
                    width: 2,
                  ),
                  backgroundColor: backgroundColorBtn1, // pode ter fundo
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 5,
                  ),
                ),
                child: Text(
                  titleButton1,
                  style: TextStyle(
                    color:
                        textColorBtn1 ??
                        borderColorBtn1 ??
                        AppColor.pantone348C,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context!);
                  if (onPressedBtn2 != null) onPressedBtn2();
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: borderColorBtn2 ?? AppColor.pantone348C,
                    width: 2,
                  ),
                  backgroundColor: backgroundColorBtn2, // também pode ter fundo
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 5,
                  ),
                ),
                child: Text(
                  titleButton2,
                  style: TextStyle(
                    color: textColorBtn2 ?? Colors.white,
                    fontSize: 14,
                  ),
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
    required String imageUrl,
    required String titleText,
    required dynamic contentText,
    required String titleButton2,
    required String titleButton1,
    required Color colorTitle,
    required double fontSizeTitle,
    required Color colorText,
    bool? isWidgetDescription,
    Color? borderColorBtn1,
    Color? backgroundColorBtn1,
    Color? textColorBtn1,
    Color? borderColorBtn2,
    Color? backgroundColorBtn2,
    Color? textColorBtn2,
    Function? onPressedBtn1,
    Function? onPressedBtn2,
  }) async {
    await showDialog<bool?>(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return _buildPopupDialog(
          context: context,
          imageUrl: imageUrl,
          colorText: colorText,
          colorTitle: colorTitle,
          fontSizeTitle: fontSizeTitle,
          titleText: titleText,
          contentText: contentText,
          titleButton1: titleButton1,
          titleButton2: titleButton2,
          borderColorBtn1: borderColorBtn1,
          isWidgetDescription: isWidgetDescription,
          backgroundColorBtn1: backgroundColorBtn1,
          textColorBtn1: textColorBtn1,
          borderColorBtn2: borderColorBtn2,
          backgroundColorBtn2: backgroundColorBtn2,
          textColorBtn2: textColorBtn2,
          onPressedBtn1: onPressedBtn1,
          onPressedBtn2: onPressedBtn2,
        );
      },
    );
  }
}
