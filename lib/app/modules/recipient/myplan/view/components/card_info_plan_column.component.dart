import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/text_app.component.dart';
import 'package:flutter/material.dart';

class CardInfoPlanColumnComponent extends StatelessWidget {
  String title;
  String textColumn1;
  String textColumn2;
  CardInfoPlanColumnComponent({
    super.key,
    required this.title,
    required this.textColumn1,
    required this.textColumn2,
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
            fontSize: 16,
            color: AppColor.dark,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  TextAppComponent(
                    value: textColumn1,
                    color: AppColor.dark,
                    fontSize: 18,
                  ),
                ],
              ),
              Column(
                children: [
                  TextAppComponent(
                    value: textColumn2,
                    color: AppColor.dark,
                    fontSize: 18,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
