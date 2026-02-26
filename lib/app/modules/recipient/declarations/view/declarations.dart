import 'package:app_colabora_unimedjp/app/modules/recipient/declarations/controller/declarations.controller.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/declarations/view/components/card_extract.model.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/alerts/info_list_clear_app.component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/fonts/fonts.dart';
import '../../../utils/components/button_app.component.dart';
import '../../../utils/components/filter_select.component.dart';
import '../../../utils/components/preview_pdf.component.dart';
import '../../../utils/components/text_app.component.dart';
import '../../../utils/components/toolbars/toolbar_app.component.dart';
import 'components/card_menu_declaration.component.dart';

class DeclarationsPage extends GetView<DeclarationsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 0),
          child: ToolbarAppComponent(
            showMenu: false,
            onPressedMenu: () {},
            title: "Declarações e Extrato",
          ),
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsGeometry.all(10),
              child: Column(
                children: [
                  TextAppComponent(
                    value: 'Declarações e Extrato',
                    fontFamily: AppFont.UnimedSlab,
                    fontWeight: FontWeight.w600,
                    color: AppColor.pantone348C,
                    fontSize: 22,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  TextAppComponent(
                    value: 'Emita os documentos em PDF.',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
            Divider(height: 0, color: AppColor.neutral2),
            CardMenuDeclarationComponent(
              title: 'Declaração de tempo de permanencia',
              subtitle: 'Visualizar',
              onPressed: () {
                showPDF(context);
              },
            ),
            CardMenuDeclarationComponent(
              title: 'Extrato de utilização',
              subtitle: 'Acessar',
              onPressed: () {
                openModalFilterExtract(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  showPDF(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PreviewPDFComponent(
          title: 'Declaração',
          url: 'https://pdfobject.com/pdf/sample.pdf',
          isNetwork: true,
        ),
      ),
    );
  }

  void openModalFilterExtract(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Scaffold(
          body: SafeArea(
            child: Container(
              margin: EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  ToolbarAppComponent(
                    onPressedMenu: () {},
                    showMenu: false,
                    title: 'Filtro extrato de utilização',
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.all(10),
                    child: Column(
                      children: [
                        SizedBox(height: 20),
                        FilterSelectComponent<String>(
                          label: 'Mês',
                          substringLength: 20,
                          itemsData: controller.listDeclarations.value
                              .map(
                                (el) => MenuItemFilterData(
                                  label: el.mes.toString(),
                                  value: el.mes.toString(),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            print('Mês: $value');
                          },
                        ),
                        SizedBox(height: 20),
                        FilterSelectComponent<String>(
                          label: 'Ano',
                          substringLength: 20,
                          itemsData: controller.listDeclarations.value
                              .map(
                                (el) => MenuItemFilterData(
                                  label: el.ano.toString(),
                                  value: el.ano.toString(),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            print('Ano: $value');
                          },
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ButtonStylizedAppComponent(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              color: AppColor.pantone348C,
                              onPressed: () {},
                              label: TextAppComponent(
                                value: 'Limpar filtros',
                                fontSize: 14,
                              ),
                            ),
                            ButtonStylizedAppComponent(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              color: AppColor.pantone348C,
                              onPressed: () {},
                              label: TextAppComponent(
                                value: 'Pesquisar',
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Divider(height: 0, color: AppColor.neutral2),
                  SizedBox(
                    height: 400,
                    child: ValueListenableBuilder(
                      valueListenable: controller.listDeclarations,
                      builder: (context, items, child) {
                        if (items.isNotEmpty) {
                          return ListView.builder(
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              final item = items[index];
                              return CardExtractComponent(data: item);
                            },
                          );
                        }
                        return InfoListClearAppComponent(
                          message: 'Nenhum documento foi encontrado.',
                        );
                      },
                    ),
                  ),
                  Divider(height: 0, color: AppColor.neutral2),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
