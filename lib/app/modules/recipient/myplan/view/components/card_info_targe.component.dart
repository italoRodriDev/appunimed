import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/text_app.component.dart';
import 'package:flutter/material.dart';

class CardInfoTargeComponent extends StatelessWidget {
  String title;
  CardInfoTargeComponent({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(left: 10, right: 10),
      color: AppColor.pantone348C,
      child: Padding(
        padding: EdgeInsets.all(5),
        child: TextAppComponent(value: title, color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600,),
      ),
    );
  }
}
