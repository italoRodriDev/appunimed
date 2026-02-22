import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:app_colabora_unimedjp/app/config/fonts/fonts.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/preview_pdf.component.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/text_app.component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/components/form_swipe.dart';
import '../../../controller/financial_reimbursement.controller.dart';

class Step1FormAssistence extends StatelessWidget implements LiquidStep {
  final FinancialReimbursementController ctrl = Get.put(
    FinancialReimbursementController(),
  );
  final _formKey = GlobalKey<FormState>();

  @override
  bool validate() => _formKey.currentState?.validate() ?? false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      color: AppColor.background,
      height: MediaQuery.of(
        context,
      ).size.height, // Garante que o container preencha a tela
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextAppComponent(
                  value: 'Solicitação de Reembolso Assistencial',
                  fontSize: 18,
                  color: AppColor.pantone348C,
                  fontWeight: FontWeight.w600,
                ),

                SizedBox(height: 8),
                TextAppComponent(
                  value:
                      """Antes de solicitar o reembolso assistencial, é fundamental ler o guia de orientação a baixo para saber em quais situações ele se aplica, quem pode fazer a solicitação, como é o pagamento, o prazo, entre outras informações que vão garantir a sua satisfação.""",
                  fontSize: 16,
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    showPDFGuia(context);
                  },
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColor.pantone382C.withAlpha(60),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 160,
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsetsGeometry.only(left: 12),
                                child: TextAppComponent(
                                  value: 'Tire suas dúvidas sobre o reembolso.',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  height: 0,
                                  fontStyle: FontStyle.italic,
                                  fontFamily: AppFont.UnimedSlab,
                                  color: AppColor.pantone348C,
                                ),
                              ),
                              TextAppComponent(
                                value: 'Leia o guia clicando aqui',
                                color: AppColor.pantone382C,
                                fontWeight: FontWeight.w800,
                                fontSize: 12,
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.arrow_forward, color: AppColor.pantone382C),
                        Spacer(),
                        TweenAnimationBuilder<double>(
                          tween: Tween<double>(begin: 1.0, end: 1.1),
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.easeInOutSine,
                          builder: (context, scale, child) {
                            return Transform.scale(scale: scale, child: child);
                          },
                          onEnd: () {},
                          child: Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                            ),
                            child: Image.asset(
                              'assets/images/guiareembolso.png',
                              width: 80,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }

  showPDFGuia(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PreviewPDFComponent(
          title: 'Reembolso assistencial',
          url:
              'https://ontheline.trincoll.edu/images/bookdown/sample-local-pdf.pdf',
          isNetwork: true,
        ),
      ),
    );
  }
}
