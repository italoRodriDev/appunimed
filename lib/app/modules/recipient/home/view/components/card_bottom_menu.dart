import 'package:app_colabora_unimedjp/app/modules/recipient/home/view/home.dart';
import 'package:flutter/material.dart';

import '../../../../../config/colors/colors.dart';
import '../../../../utils/components/text_app.component.dart';

class CardBottomMenuHome extends StatefulWidget {
  final CardModel item;
  final Function onPressed;
  const CardBottomMenuHome({
    super.key,
    required this.item,
    required this.onPressed,
  });

  @override
  State<CardBottomMenuHome> createState() => _CardBottomMenuHomeState();
}

class _CardBottomMenuHomeState extends State<CardBottomMenuHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 100,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColor.pantone382C.withAlpha(40),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColor.pantone382C),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Tooltip(
              exitDuration: Duration(seconds: 10),
              message: widget.item.subtitle,
              textStyle: const TextStyle(color: Colors.white),
              decoration: BoxDecoration(
                color: AppColor.pantone7722C,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.help_outline,
                size: 20,
                color: AppColor.pantone7722C,
              ),
            ),
          ),

          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        onTap: () {
                          widget.onPressed();
                        },
                        child: Column(
                          children: [
                            Icon(
                              widget.item.icon,
                              size: 25,
                              color: AppColor.pantone7722C,
                            ),
                            const SizedBox(height: 8),

                            TextAppComponent(
                              value: widget.item.title,
                              textAlign: TextAlign.center,
                              fontWeight: FontWeight.w600,
                              color: AppColor.pantone7722C,
                              fontSize: 12,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 8),
                            TextAppComponent(
                              value: 'Acessar',
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: AppColor.pantone382C,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
