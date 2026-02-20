import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:flutter/material.dart';

import '../text_app.component.dart';

enum ThemeAlert {
  info,
  success,
  warning,
  error;

  Color toColor({int shade = 500}) {
    switch (this) {
      case ThemeAlert.info:
        return AppColor.info[shade]!;
      case ThemeAlert.success:
        return AppColor.success[shade]!;
      case ThemeAlert.warning:
        return AppColor.warning[shade]!;
      case ThemeAlert.error:
        return AppColor.danger[shade]!;
    }
  }
}

class AlertScreenApp extends StatefulWidget {
  String? title;
  List<TextSpan> description;
  dynamic iconSvg;
  ThemeAlert theme;
  Function? onPressedClosed;
  final bool canClose;

  AlertScreenApp({
    super.key,
    this.title,
    required this.description,
    this.theme = ThemeAlert.error,
    this.iconSvg,
    this.onPressedClosed,
    this.canClose = true,
  });

  @override
  State<AlertScreenApp> createState() => _AlertErrorAppState();
}

class _AlertErrorAppState extends State<AlertScreenApp> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8, top: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        color: widget.theme.toColor(shade: 100),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Row(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error,
                  color: widget.theme.toColor(shade: 500),
                  size: 24,
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.title != null)
                    Container(
                      padding: EdgeInsets.all(2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextAppComponent(
                            value: widget.title!,
                            color: AppColor.pantone7722C,
                            textAlign: TextAlign.start,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ],
                      ),
                    ),
                  Container(
                    padding: EdgeInsets.all(2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            children: widget.description,
                            style: TextStyle(
                              color: AppColor.highlight10,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (widget.canClose)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      widget.onPressedClosed!();
                    },
                    icon: Icon(Icons.close, size: 16, color: AppColor.dark),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
