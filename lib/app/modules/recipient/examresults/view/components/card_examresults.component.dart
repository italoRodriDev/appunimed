import 'package:app_colabora_unimedjp/app/data/models/examresult.model.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/button_app.component.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../config/colors/colors.dart';
import '../../../../utils/components/preview_pdf.component.dart';
import '../../../../utils/components/text_app.component.dart';
import '../../../../utils/extensions/date_time_extensions.dart';

class CardExamResultsComponent extends StatefulWidget {
  String title;
  List<ExamsResultModel> exams;

  CardExamResultsComponent({
    super.key,
    required this.title,
    required this.exams,
  });

  @override
  State<CardExamResultsComponent> createState() =>
      _CardSlipFinanceComponentState();
}

class _CardSlipFinanceComponentState extends State<CardExamResultsComponent> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        elevation: 0,
        color: AppColor.highlight6.withAlpha(80),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColor.highlight6.withAlpha(50),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Icon(Icons.receipt_long, color: AppColor.pantone7722C),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextAppComponent(
                          value: widget.title,
                          fontWeight: FontWeight.w800,
                          color: AppColor.pantone7722C,
                          fontSize: 16,
                        ),
                      ),
                      Icon(
                        _isExpanded
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: AppColor.pantone7722C,
                        size: 25,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            if (_isExpanded) ...[
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    for (var exam in widget.exams)
                      ListTile(
                        title: TextAppComponent(
                          value: formatterDate(exam.date.toString()),
                          fontWeight: FontWeight.w800,
                          color: AppColor.pantone7722C,
                        ),
                        subtitle: exam.description.isEmpty
                            ? null
                            : TextAppComponent(
                                value: 'Tipo: ${exam.description}',
                                fontWeight: FontWeight.w600,
                                color: AppColor.neutral1,
                              ),
                        trailing: ButtonStylizedAppComponent(
                          onPressed: () {
                            validOpenLink(context: context, url: exam.url);
                          },
                          color: AppColor.pantone382C,
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 2,
                          ),
                          label: TextAppComponent(
                            value: 'Ver exame',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: AppColor.pantone7722C,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  validOpenLink({required BuildContext context, required String url}) async {
    if (url.contains('.pdf')) {
      showPDF(context, url);
    } else {
      await launchUrl(Uri.parse(url));
    }
  }

  showPDF(BuildContext context, String url) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            PreviewPDFComponent(title: 'Exame', url: url, isNetwork: true),
      ),
    );
  }

  formatterDate(date) {
    return DateTimeExtensions.formatDate(date, 'dd/MM/yyyy');
  }
}
