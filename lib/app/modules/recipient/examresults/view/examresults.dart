import 'package:app_colabora_unimedjp/app/data/models/examresult.model.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/slips/controller/myslips.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/fonts/fonts.dart';
import '../../../utils/components/text_app.component.dart';
import '../../../utils/components/toolbars/toolbar_app.component.dart';
import '../../../utils/extensions/date_time_extensions.dart';
import 'components/card_examresults.component.dart';

class ExamResultsPage extends GetView<MySlipsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 0),
          child: ToolbarAppComponent(
            onPressedMenu: () {},
            showMenu: false,
            title: 'Resultados de exames',
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsetsGeometry.all(16),
                  child: Column(
                    children: [
                      TextAppComponent(
                        value: 'Resultados de exames',
                        textAlign: TextAlign.center,
                        fontFamily: AppFont.UnimedSlab,
                        fontWeight: FontWeight.w600,
                        color: AppColor.pantone348C,
                        fontSize: 22,
                      ),
                      SizedBox(height: 8),
                      TextAppComponent(
                        textAlign: TextAlign.center,
                        value:
                            'Resultados dos exames realizados no Hospital Alberto Urquiza Wanderley e no Hospital Pediátrico Unimed João Pessoa a partir de ${formatterDate(DateTime.now().toIso8601String())}.',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Column(
                  children: [
                    CardExamResultsComponent(
                      title: 'Exames de COVID-19',
                      exams: [
                        ExamsResultModel(
                          date: DateTime.now().toIso8601String(),
                          url: 'https://google.com.br',
                          description: '',
                        ),
                        ExamsResultModel(
                          date: DateTime.now().toIso8601String(),
                          url: 'https://pdfobject.com/pdf/sample.pdf',
                          description: '',
                        ),
                        ExamsResultModel(
                          date: DateTime.now().toIso8601String(),
                          url: 'https://pdfobject.com/pdf/sample.pdf',
                          description: '',
                        ),
                      ],
                    ),
                    CardExamResultsComponent(
                      title: 'Exames do Centro de Diagnóstico por Imagem',
                      exams: [
                        ExamsResultModel(
                          date: DateTime.now().toIso8601String(),
                          url: 'https://pdfobject.com/pdf/sample.pdf',
                          description: 'TC DE FACE',
                        ),
                        ExamsResultModel(
                          date: DateTime.now().toIso8601String(),
                          url: 'https://pdfobject.com/pdf/sample.pdf',
                          description: 'TC DE FACE',
                        ),
                        ExamsResultModel(
                          date: DateTime.now().toIso8601String(),
                          url: 'https://pdfobject.com/pdf/sample.pdf',
                          description: 'TC DE FACE',
                        ),
                      ],
                    ),
                    CardExamResultsComponent(
                      title: 'Exames Laboratoriais',
                      exams: [
                        ExamsResultModel(
                          date: DateTime.now().toIso8601String(),
                          url: 'https://pdfobject.com/pdf/sample.pdf',
                          description: 'TC DE FACE',
                        ),
                        ExamsResultModel(
                          date: DateTime.now().toIso8601String(),
                          url: 'https://pdfobject.com/pdf/sample.pdf',
                          description: 'TC DE FACE',
                        ),
                        ExamsResultModel(
                          date: DateTime.now().toIso8601String(),
                          url: 'https://pdfobject.com/pdf/sample.pdf',
                          description: 'TC DE FACE',
                        ),
                      ],
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

  formatterDate(date) {
    return DateTimeExtensions.formatDate(date, 'dd/MM/yyyy');
  }
}
