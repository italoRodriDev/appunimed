import 'package:flutter/material.dart';

import '../../../../config/colors/colors.dart';
import '../text_app.component.dart';

class SnackbarAppComponent {
  static SnackBar _buildSnackbar({
    BuildContext? context,
    String? text,
    double? elevation,
    IconData? icon,
    bool? isAction,
    String? labelBtnAction,
    Function? onPressedAction,
  }) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      elevation: elevation ?? 1,

      content: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: AppColor.pantone7722C,
        ),
        child: Padding(
          padding: EdgeInsetsGeometry.all(3),
          child: Row(
            spacing: 16,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error, color: AppColor.pantone382C, size: 24),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextAppComponent(
                          value: text.toString(),
                          color: Colors.white,
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: AppColor.pantone7722C,
    );
  }

  static show(
    BuildContext context, {
    String text = "titulo!",
    IconData? icon,
    bool? action = false,
    String labelBtnAction = 'Ok',
    Function? onPressedAction,
  }) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      _buildSnackbar(
        context: context,
        text: text,
        labelBtnAction: labelBtnAction,
        isAction: action,
        icon: icon,
        onPressedAction: onPressedAction,
      ),
    );
  }
}
