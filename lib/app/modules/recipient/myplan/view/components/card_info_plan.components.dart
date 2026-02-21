import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/text_app.component.dart';
import 'package:flutter/material.dart';

class CardInfoPlanComponent extends StatelessWidget {
  String title;
  String subtitle;
  CardInfoPlanComponent({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextAppComponent(
            value: '$title:',
            fontWeight: FontWeight.w600,
            fontSize: 16,
            color: AppColor.pantone7722C,
          ),
          TextAppComponent(value: subtitle, color: AppColor.dark),
          Divider(color: AppColor.pantone7722C.withAlpha(60)),
        ],
      ),
    );
  }
}
