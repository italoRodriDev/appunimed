import 'package:flutter/material.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/fonts/fonts.dart';
import '../text_app.component.dart';

class InfoListClearAppComponent extends StatelessWidget {
  String message;

  InfoListClearAppComponent({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextAppComponent(
        value: message,
        color: AppColor.pantone7722C,
        fontFamily: AppFont.UnimedSlab,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
