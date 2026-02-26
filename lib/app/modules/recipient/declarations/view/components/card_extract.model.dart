import 'package:app_colabora_unimedjp/app/data/models/extract.model.dart';
import 'package:flutter/material.dart';

import '../../../../../config/colors/colors.dart';
import '../../../../utils/components/preview_pdf.component.dart';
import '../../../../utils/components/text_app.component.dart';

class CardExtractComponent extends StatefulWidget {
  final ExtractModel data;

  const CardExtractComponent({super.key, required this.data});

  @override
  State<CardExtractComponent> createState() => _CardExtractComponentState();
}

class _CardExtractComponentState extends State<CardExtractComponent> {
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
            showPDF(context);
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
                        Icons.download,
                        color: AppColor.pantone348C,
                        size: 25,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showPDF(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PreviewPDFComponent(
          title: 'Extrato',
          url: 'https://pdfobject.com/pdf/sample.pdf',
          isNetwork: true,
        ),
      ),
    );
  }
}
