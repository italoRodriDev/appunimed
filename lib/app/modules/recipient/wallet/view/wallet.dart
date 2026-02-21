import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:app_colabora_unimedjp/app/config/fonts/fonts.dart';
import 'package:app_colabora_unimedjp/app/data/models/contract.model.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/text_app.component.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/toolbars/toolbar_app.component.dart';
import 'package:app_colabora_unimedjp/app/routers/app_routers.dart';
import 'package:app_colabora_unimedjp/app/services/contracts.service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/wallet.controller.dart';

class WalletPage extends GetView<WalletController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 0),
          child: ToolbarAppComponent(
            onPressedMenu: () {},
            showMenu: false,
            title: 'Carteiras',
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
                      value: 'Qual carteira deseja visualizar?',
                      fontFamily: AppFont.UnimedSlab,
                      fontWeight: FontWeight.w600,
                      color: AppColor.pantone348C,
                      fontSize: 22,
                    ),
                    SizedBox(height: 20),
                    TextAppComponent(
                      value: 'Selecione uma carteira para visualizar.',
                    ),
                    SizedBox(height: 8),
                    ValueListenableBuilder(
                      valueListenable: Get.find<ContractsService>().contract,
                      builder: (context, ContractModel? contract, child) {
                        if (contract != null) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextAppComponent(
                                value: 'Termo: ${contract.contratoCodigo}',
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: AppColor.pantone7722C,
                              ),
                              SizedBox(height: 8),
                              TextAppComponent(
                                value: 'Contrato: ${contract.contratoCodigo}',
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: AppColor.pantone7722C,
                              ),
                            ],
                          );
                        }
                        return Container();
                      },
                    ),

                    SizedBox(height: 8),
                  ],
                ),
              ),
              Divider(color: AppColor.medium),
              SizedBox(
                height: 500,
                child: Column(
                  children: [
                    _buildCard(
                      context: context,
                      title: 'Italo Rodrigues dos Santos',
                      subtitle: 'Titular',
                    ),
                  ],
                ),
              ),
              /* 
              SizedBox(
                height: 500,
                child: ValueListenableBuilder(
                  valueListenable: controller.listContracts,
                  builder: (context, List<ContractModel> wallets, child) {
                    if (wallets.isNotEmpty) {
                      return ListView.builder(
                        itemBuilder: (context, index) {
                          ContractModel wallet = wallets[index];
                          return _buildCard(title: '', subtitle: '');
                        },
                        itemCount: wallets.length,
                      );
                    }
                    if (wallets.isEmpty) {
                      return InfoListClearAppComponent(
                        message: 'Nenhuma carteira encontrada',
                      );
                    }

                    return ProgressAppComponent();
                  },
                ),
              ),
              */
              Divider(color: AppColor.medium),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCard({
    required BuildContext context,
    required String title,
    required String subtitle,
  }) {
    return InkWell(
      onTap: () {
        Get.toNamed(RoutesApp.PREVIEW_WALLET);
      },
      child: Padding(
        padding: EdgeInsetsGeometry.all(10),
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: AppColor.pantone382C.withAlpha(60),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextAppComponent(
                      value: title,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: AppColor.pantone7722C,
                    ),
                    TextAppComponent(
                      value: subtitle,
                      fontSize: 14,
                      color: AppColor.pantone7722C,
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
}
