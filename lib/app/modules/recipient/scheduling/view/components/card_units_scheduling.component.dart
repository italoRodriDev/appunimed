import 'package:flutter/material.dart';

import '../../../../../config/colors/colors.dart';
import '../../../../utils/components/text_app.component.dart';

class CardUnitsSchedulingComponent extends StatefulWidget {
  String title;
  String subtitle;
  String location;
  Function onPressed;
  CardUnitsSchedulingComponent({
    super.key,
    required this.title,
    required this.subtitle,
    required this.location,
    required this.onPressed,
  });

  @override
  State<CardUnitsSchedulingComponent> createState() =>
      _CardServiceTelehealthComponentState();
}

class _CardServiceTelehealthComponentState
    extends State<CardUnitsSchedulingComponent> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onPressed();
      },
      child: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Container(
          height: 90,
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
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColor.pantone7722C,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_pin,
                          size: 14,
                          color: AppColor.pantone7722C,
                        ),
                        SizedBox(width: 5),
                        TextAppComponent(
                          value: widget.location,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColor.pantone7722C,
                        ),
                      ],
                    ),
                    Spacer(),
                    TextAppComponent(
                      value: widget.subtitle,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColor.pantone382C,
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
