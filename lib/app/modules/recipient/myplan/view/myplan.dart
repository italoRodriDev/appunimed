import 'package:app_colabora_unimedjp/app/modules/recipient/myplan/controller/myplan.controller.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/myplan/view/components/card_info_plan.components.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/myplan/view/components/card_info_plan_column.component.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/myplan/view/components/card_info_plan_paragaph.component.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/myplan/view/components/card_info_targe.component.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/button_app.component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/fonts/fonts.dart';
import '../../../utils/components/text_app.component.dart';
import '../../../utils/components/toolbars/toolbar_app.component.dart';

class MyPlanPage extends GetView<MyPlanController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 0),
          child: ToolbarAppComponent(
            onPressedMenu: () {},
            showMenu: false,
            title: 'Meu Plano',
          ),
        ),
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsetsGeometry.all(10),
                child: Column(
                  children: [
                    TextAppComponent(
                      value: 'Dados do seu plano',
                      fontFamily: AppFont.UnimedSlab,
                      fontWeight: FontWeight.w600,
                      color: AppColor.pantone348C,
                      fontSize: 22,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    TextAppComponent(
                      value:
                          'Aqui você tem acesso a todas as informações do seu plano.',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsetsGeometry.only(right: 8),
                        child: ButtonAppComponent(
                          label: 'Imprimir',
                          color: AppColor.pantone348C,
                          padding: EdgeInsetsGeometry.symmetric(
                            horizontal: 30,
                            vertical: 5,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(color: AppColor.medium),
              CardInfoPlanComponent(
                title: 'Nome do Beneficiário',
                subtitle: 'ITALO RODRIGUES DOS SANTOS',
              ),
              CardInfoPlanComponent(
                title: 'Data de Nascimento',
                subtitle: 'ITALO RODRIGUES DOS SANTOS',
              ),
              CardInfoPlanComponent(
                title: 'Cartão Nacional de Saúde (CNS)',
                subtitle: 'ITALO RODRIGUES DOS SANTOS',
              ),
              CardInfoPlanComponent(
                title: 'Carteirinha',
                subtitle: 'Texto aqui',
              ),
              CardInfoPlanComponent(
                title: 'Registro da Operadora da ANS',
                subtitle: 'Texto aqui',
              ),
              CardInfoPlanComponent(
                title: 'Nome Fantasia da Operadora',
                subtitle: 'Texto aqui',
              ),
              CardInfoPlanComponent(
                title: 'Nome do Contratante',
                subtitle: 'Texto aqui',
              ),
              CardInfoPlanComponent(
                title: 'Número do Registro do Plano na ANS',
                subtitle: 'Texto aqui',
              ),
              CardInfoPlanComponent(
                title: 'Nome do Plano',
                subtitle: 'Texto aqui',
              ),
              CardInfoPlanComponent(
                title: 'Número do Contrato/Apólice',
                subtitle: 'Texto aqui',
              ),
              CardInfoPlanComponent(
                title: 'Tipo de Contratação',
                subtitle: 'Texto aqui',
              ),
              CardInfoPlanComponent(
                title: 'Informações Sobre a Regulamentação do Plano',
                subtitle: 'Texto aqui',
              ),
              CardInfoPlanComponent(
                title: 'Data da Assinatura do Último Contrato',
                subtitle: 'Texto aqui',
              ),
              CardInfoPlanComponent(
                title: 'Data de início da Cobertura',
                subtitle: 'Texto aqui',
              ),
              CardInfoPlanComponent(
                title: 'Data do término da Cobertura Parcial Temporária (CPT)',
                subtitle: 'Texto aqui',
              ),
              CardInfoPlanComponent(
                title: 'Segmentação Assistencial do Plano',
                subtitle: 'Texto aqui',
              ),
              CardInfoPlanComponent(
                title: 'Acomodação do Plano',
                subtitle: 'Texto aqui',
              ),
              CardInfoPlanComponent(
                title: 'Área de Abrangência Geográfica do Plano',
                subtitle: 'Texto aqui',
              ),

              CardInfoTargeComponent(
                title:
                    'Plano Coletivo Empresarial contratado Empresário Individual',
              ),
              CardInfoPlanColumnComponent(
                title:
                    'Informações de contato com o serviço de atendimento ao cliente',
                textColumn1: 'Telefone',
                textColumn2: '08007251200',
              ),
              CardInfoTargeComponent(title: 'Plano Individual ou Familiar'),
              SizedBox(height: 10),
              CardInfoPlanParagaph(
                title: 'Prazo máximo previsto no contrato para carências',
                text:
                    'Carência para procedimentos ambulatoriais: 60 dias\n Carência para procedimentos ambulatoriais: 60 dias\n Carência para procedimentos ambulatoriais: 60 dias',
              ),
              Container(color: AppColor.pantone348C, height: 3),
            ],
          ),
        ),
      ),
    );
  }
}
