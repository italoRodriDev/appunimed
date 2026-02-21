import 'package:app_colabora_unimedjp/app/data/models/faq.model.dart';
import 'package:flutter/material.dart';

import '../../../../../config/colors/colors.dart';
import '../../../../utils/components/text_app.component.dart';

class CardFaqComponent extends StatefulWidget {
  final FaqModel data;

  const CardFaqComponent({super.key, required this.data});

  @override
  State<CardFaqComponent> createState() => _CardFaqComponentState();
}

class _CardFaqComponentState extends State<CardFaqComponent> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Card(
        elevation: 0,
        color: AppColor.highlight6.withAlpha(80),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColor.highlight6.withAlpha(50),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: EdgeInsetsGeometry.only(
                    left: 20,
                    right: 20,
                    top: 10,
                    bottom: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextAppComponent(
                          value: widget.data.title.toString(),
                          fontWeight: FontWeight.w800,
                          color: AppColor.pantone7722C,
                          fontSize: 14,
                        ),
                      ),
                      Icon(
                        _isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: AppColor.pantone348C,
                        size: 25,
                      ),
                    ],
                  ),
                ),
              ),
              if (_isExpanded) ...[
                const SizedBox(height: 12),
                Padding(
                  padding: EdgeInsetsGeometry.only(
                    left: 20,
                    right: 20,
                    top: 10,
                    bottom: 20,
                  ),
                  child: TextAppComponent(
                    value: widget.data.description.toString(),
                    color: AppColor.pantone7722C,
                    fontSize: 14,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
