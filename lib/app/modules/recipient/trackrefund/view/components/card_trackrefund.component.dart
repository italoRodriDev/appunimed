import 'package:app_colabora_unimedjp/app/modules/utils/components/button_app.component.dart';
import 'package:flutter/material.dart';

import '../../../../../config/colors/colors.dart';
import '../../../../utils/components/text_app.component.dart';
import '../../../../utils/extensions/date_time_extensions.dart';

class CardTrackRefundComponent extends StatefulWidget {
  final String status;
  final String dueDate;
  final String paymentDate;
  final String value;

  const CardTrackRefundComponent({
    super.key,
    required this.status,
    required this.dueDate,
    required this.paymentDate,
    required this.value,
  });

  @override
  State<CardTrackRefundComponent> createState() =>
      _CardTicketFinanceComponentState();
}

class _CardTicketFinanceComponentState extends State<CardTrackRefundComponent> {
  bool _isExpanded = false;

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
                      Icon(Icons.attach_money, color: AppColor.pantone7722C),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextAppComponent(
                          value: 'Reembolso',
                          fontWeight: FontWeight.w800,
                          color: AppColor.pantone7722C,
                          fontSize: 14,
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
                    TextAppComponent(
                      value: 'Valor: ${widget.value}',
                      color: AppColor.pantone7722C,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    const SizedBox(height: 8),
                    TextAppComponent(
                      value: 'Status: ${widget.status}',
                      color: AppColor.pantone7722C,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    const SizedBox(height: 4),
                    TextAppComponent(
                      value: 'Vencimento: ${formatterDate(widget.dueDate)}',
                      color: AppColor.pantone7722C,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    const SizedBox(height: 4),
                    TextAppComponent(
                      value:
                          'Data de Pagamento: ${formatterDate(widget.paymentDate)}',
                      color: AppColor.pantone7722C,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),

                    if (widget.status == 'Finalizado')
                      Row(
                        children: [
                          ButtonStylizedAppComponent(
                            onPressed: () {},
                            color: AppColor.pantone382C,
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 2,
                            ),
                            label: TextAppComponent(
                              value: 'Comprovante',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColor.pantone7722C,
                            ),
                          ),
                        ],
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

  formatterDate(date) {
    return DateTimeExtensions.formatDate(date, 'dd/MM/yyyy');
  }
}
