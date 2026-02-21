import 'package:flutter/material.dart';

import '../../../../../config/colors/colors.dart';
import '../../../../utils/components/text_app.component.dart';

class CardContractWalletComponent extends StatefulWidget {
  String title;
  String subtitle;
  Function onPressed;
  CardContractWalletComponent({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onPressed,
  });

  @override
  State<CardContractWalletComponent> createState() =>
      _CardContractWalletComponentState();
}

class _CardContractWalletComponentState
    extends State<CardContractWalletComponent> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onPressed();
      },
      child: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: AppColor.pantone382C.withAlpha(60),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextAppComponent(
                      value: widget.title,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: AppColor.pantone7722C,
                    ),
                    TextAppComponent(
                      value: widget.subtitle,
                      fontSize: 14,
                      color: AppColor.pantone7722C,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
