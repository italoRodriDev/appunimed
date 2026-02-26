import 'package:app_colabora_unimedjp/app/modules/recipient/medicalguide/view/components/card_medical_guide.component.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/select_component_app.component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/fonts/fonts.dart';
import '../../../utils/components/alerts/info_list_clear_app.component.dart';
import '../../../utils/components/button_app.component.dart';
import '../../../utils/components/filter_select.component.dart';
import '../../../utils/components/inputs/input_app.component.dart';
import '../../../utils/components/progress_app.component.dart';
import '../../../utils/components/tab_app.component.dart';
import '../../../utils/components/text_app.component.dart';
import '../../../utils/components/toolbars/toolbar_app.component.dart';
import '../controller/medicalguide.controller.dart';

class MedicalGuidePage extends GetView<MedicalGuideController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 0),
          child: ToolbarAppComponent(
            onPressedMenu: () {},
            showMenu: false,
            title: 'Guia Médico',
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
                        value: 'Guia Médico',
                        textAlign: TextAlign.center,
                        fontFamily: AppFont.UnimedSlab,
                        fontWeight: FontWeight.w600,
                        color: AppColor.pantone348C,
                        fontSize: 22,
                      ),
                      SizedBox(height: 8),
                      TextAppComponent(
                        textAlign: TextAlign.center,
                        value: 'Consulte nosso guia local e nacional.',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                TabsAppComponent(
                  fontSize: 14,
                  titlesTabs: ['Favoritos', 'Pesquisar'],
                  contentTabs: [buildTabFavorites(), buildTabResults()],
                  onChangeIndex: (index) {
                    if (index == 1) {
                      openModalFilter(context);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildTabResults() {
    return Column(
      children: [
        Divider(height: 0, color: AppColor.neutral2),
        SizedBox(
          height: 600,
          child: ValueListenableBuilder(
            valueListenable: controller.listMedicalGuide,
            builder: (context, items, child) {
              if (items.isNotEmpty) {
                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return CardMedicalGuideComponent(
                      data: item,
                      onPressedFavorite: () {
                        controller.favoriteMedicalGuide(item);
                      },
                      onPressedReportProblem: () {
                        openModalReportProblem(context);
                      },
                    );
                  },
                );
              }
              if (items.isEmpty) {
                InfoListClearAppComponent(
                  message: 'Nenhum resultado encontrado.',
                );
              }

              return ProgressAppComponent();
            },
          ),
        ),

        Divider(height: 0, color: AppColor.neutral2),
      ],
    );
  }

  buildTabFavorites() {
    return Column(
      children: [
        Divider(height: 0, color: AppColor.neutral2),
        SizedBox(
          height: 600,
          child: ValueListenableBuilder(
            valueListenable: controller.listMedicalGuideFavorites,
            builder: (context, items, child) {
              if (items.isNotEmpty) {
                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return CardMedicalGuideComponent(
                      data: item,
                      onPressedFavorite: () {
                        controller.unfavoriteMedicalGuide(item);
                      },
                      onPressedReportProblem: () {
                        openModalReportProblem(context);
                      },
                    );
                  },
                );
              }
              return InfoListClearAppComponent(
                message: 'Você não possui nenhum guia favorito.',
              );
            },
          ),
        ),

        Divider(height: 0, color: AppColor.neutral2),
      ],
    );
  }

  void openModalFilter(BuildContext context) {
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ToolbarAppComponent(
                      onPressedMenu: () {},
                      showMenu: false,
                      title: 'Filtro Guia Médico Local',
                    ),
                    Padding(
                      padding: EdgeInsetsGeometry.all(10),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          InputTextAppComponent(
                            onChanged: (change) {},
                            borderRadius: 16,
                            borderColor: AppColor.pantone7722C,
                            hintText: 'Buscar por nome',
                            prefixIconData: Icons.search,
                          ),
                          SizedBox(height: 20),
                          FilterSelectComponent<String>(
                            label: 'Tipo de prestador',
                            substringLength: 20,
                            itemsData: controller.listMedicalGuide.value
                                .map(
                                  (el) => MenuItemFilterData(
                                    label: el.tipo.toString(),
                                    value: el.tipo.toString(),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              print('Tipo: $value');
                            },
                          ),
                          SizedBox(height: 20),
                          FilterSelectComponent<String>(
                            label: 'Especialidade',
                            substringLength: 20,
                            itemsData: controller.listMedicalGuide.value
                                .map(
                                  (el) => MenuItemFilterData(
                                    label: el.especialidade.toString(),
                                    value: el.especialidade.toString(),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              print('Especialidade: $value');
                            },
                          ),
                          SizedBox(height: 20),

                          FilterSelectComponent<String>(
                            label: 'Cidade',
                            substringLength: 20,
                            itemsData: controller.listMedicalGuide.value
                                .map(
                                  (el) => MenuItemFilterData(
                                    label: el.cidade.toString(),
                                    value: el.cidade.toString(),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              print('Tipo: $value');
                            },
                          ),
                          SizedBox(height: 20),
                          FilterSelectComponent<String>(
                            label: 'Bairro',
                            substringLength: 20,
                            itemsData: controller.listMedicalGuide.value
                                .map(
                                  (el) => MenuItemFilterData(
                                    label: el.bairro.toString(),
                                    value: el.bairro.toString(),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              print('Tipo: $value');
                            },
                          ),
                          SizedBox(height: 30),
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void openModalReportProblem(BuildContext context) {
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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ToolbarAppComponent(
                      onPressedMenu: () {},
                      showMenu: false,
                      title: 'Reportar problema',
                    ),
                    TextAppComponent(
                      value: 'Dr. Vieira Lima',
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
                          'Você esta preste a reporta um problema de um de nossos prestadores.',
                    ),
                    SizedBox(height: 10),

                    Padding(
                      padding: EdgeInsetsGeometry.all(10),
                      child: SelectAppComponent(
                        labelText: 'Selecione o tipo de problema',
                        borderColor: AppColor.pantone7722C,
                        enabledBorder: true,
                        menuItemData: [
                          MenuItemData(
                            label: 'Não atende o telefone',
                            value: 'NÃO ATENDE O TELEFONE',
                          ),
                          MenuItemData(
                            label: 'Mudou de endereço',
                            value: 'MUDOU DE ENDEREÇO',
                          ),
                        ],
                        onChanged: (value) {
                          print('Tipo: $value');
                        },
                        primaryColor: AppColor.pantone382C,
                      ),
                    ),
                    SizedBox(height: 8),
                    Padding(
                      padding: EdgeInsetsGeometry.all(10),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          InputTextAppComponent(
                            borderRadius: 16,
                            minLines: 5,
                            maxLines: 5,
                            maxLength: 500,
                            borderColor: AppColor.pantone7722C,
                            labelText: 'Observações',
                            hintText: 'Observações...',
                          ),
                          SizedBox(height: 30),
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
                                  value: 'Mudei de ideia',
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
                                  value: 'Reportar',
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
