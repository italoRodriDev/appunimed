import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/text_app.component.dart';
import 'package:flutter/material.dart';

class CardInfoPlanParagaph extends StatelessWidget {
  String title;
  String text;
  Widget? content;
  CardInfoPlanParagaph({
    super.key,
    required this.title,
    required this.text,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextAppComponent(
            value: title,
            fontWeight: FontWeight.w600,
            color: AppColor.dark,
            fontSize: 18,
          ),
          TextAppComponent(value: text),
        ],
      ),
    );
  }
}
