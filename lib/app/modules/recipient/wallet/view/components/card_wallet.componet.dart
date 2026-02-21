import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/button_app.component.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/text_app.component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crise/components/switch.component.dart';

class CardWalletComponent extends StatefulWidget {
  const CardWalletComponent({super.key});

  @override
  State<CardWalletComponent> createState() => _CardWalletComponentState();
}

class _CardWalletComponentState extends State<CardWalletComponent>
    with SingleTickerProviderStateMixin {
  bool isFront = true;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    const primaryGreen = Color(0xFF0B8F4F);
    const lightGreen = Color(0xFFA7C957);

    return _buildCardView(primaryGreen, lightGreen);
  }

  Widget _buildCardView(Color primaryGreen, Color lightGreen) {
    return Column(
      children: [
        isFront ? _buildFrontCard(primaryGreen, lightGreen) : _buildBackCard(),
        const SizedBox(height: 20),
        _buildToggle(),
        const SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Expanded(
                child: ButtonOutlineAppComponent(
                  label: 'Copiar número da carteira',
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFrontCard(Color primaryGreen, Color lightGreen) {
    return Container(
      height: 500,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: lightGreen,
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: primaryGreen,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
            ),
            child: Column(
              children: [
                Image.asset('assets/images/logo_unimed.png', width: 120),
                SizedBox(height: 8),
                TextAppComponent(
                  value: "UNI MAIS BASICO\nColetivo empresarial",
                  textAlign: TextAlign.center,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
          Container(color: Colors.white, height: 5),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextAppComponent(
                  value: "0 033 540019900804 0",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(height: 12),
                TextAppComponent(
                  value: "ITALO RODRIGUES DOS SANTOS",
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                ),
                TextAppComponent(value: "Nome do Beneficiário", fontSize: 12),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextAppComponent(
                          value: "ENFERMARIA",
                          fontWeight: FontWeight.w800,
                          fontSize: 12,
                        ),
                        TextAppComponent(value: "Acomodação", fontSize: 12),
                      ],
                    ),
                    SizedBox(
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextAppComponent(
                            value: "20/12/2031",
                            fontWeight: FontWeight.w800,
                          ),
                          TextAppComponent(value: "Validade", fontSize: 12),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextAppComponent(
                          value: "REGULAMENTADO",
                          fontWeight: FontWeight.w800,
                          fontSize: 12,
                        ),
                        TextAppComponent(value: "Plano", fontSize: 12),
                      ],
                    ),
                    SizedBox(
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextAppComponent(
                            value: "MU04 BASICO",
                            fontWeight: FontWeight.w800,
                            fontSize: 12,
                          ),
                          TextAppComponent(
                            value: "Rede atendimento",
                            fontSize: 12,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextAppComponent(
                          value: "MUNICIPAL",
                          fontWeight: FontWeight.w800,
                          fontSize: 12,
                        ),
                        TextAppComponent(value: "Abrangência", fontSize: 12),
                      ],
                    ),
                    SizedBox(
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextAppComponent(
                            value: "0 003",
                            fontWeight: FontWeight.w800,
                            fontSize: 12,
                          ),
                          TextAppComponent(value: "Atend."),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                TextAppComponent(
                  value: "AMBULATORIAL + HOSPITALAR COM OBSTETRÍCIA",
                  fontWeight: FontWeight.w800,
                  fontSize: 12,
                ),
                TextAppComponent(
                  value: "Segmentação Assistencial do plano",
                  fontSize: 12,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackCard() {
    return Container(
      height: 500,
      margin: EdgeInsets.all(10),
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColor.mediumSecondary),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextAppComponent(
            value: "SEM CARÊNCIAS A CUMPRIR",
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
          SizedBox(height: 20),
          TextAppComponent(
            value: "488184212",
            fontWeight: FontWeight.w800,
            fontSize: 12,
          ),
          TextAppComponent(
            value: "Cód. Prod. ANS",
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
          SizedBox(height: 20),
          TextAppComponent(
            value: "707004896782137",
            fontWeight: FontWeight.w800,
            fontSize: 12,
          ),
          TextAppComponent(
            value: "CNS",
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
          SizedBox(height: 40),
          const Spacer(),
          Center(
            child: TextAppComponent(
              value:
                  'Eventuais alterações ocorridas na rede de prestadores poderão ser ',
              textAlign: TextAlign.center,
              fontSize: 10,
            ),
          ),
          Center(
            child: TextAppComponent(
              value:
                  'consultadas no www.unimedjp.com.br e no tel. 0800 725 1200',
              textAlign: TextAlign.center,
              fontSize: 10,
            ),
          ),
          Center(
            child: TextAppComponent(
              value:
                  'Urgência/emergência restrita à área de abrangência do produto.',
              textAlign: TextAlign.center,
              fontSize: 10,
            ),
          ),
          Center(
            child: TextAppComponent(
              value: 'Disque ANS 0800 701 9656 www.ans.gov.br',
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w800,
              fontSize: 10,
            ),
          ),
          SizedBox(height: 8),
          Center(
            child: TextAppComponent(
              value: 'SAC/Informacoes \n0800 725 1200',
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w600,
              fontSize: 10,
            ),
          ),
          SizedBox(height: 8),
          Center(child: Image.asset('assets/images/ans.png')),
        ],
      ),
    );
  }

  Widget _buildToggle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextAppComponent(
          value: "Frente",
          color: AppColor.pantone7722C,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(width: 8),
        SwitchComponent(
          initialValue: !isFront,
          onChanged: (value) {
            setState(() {
              isFront = !value;
            });
          },
          color: AppColor.pantone382C,
        ),
        SizedBox(width: 8),
        TextAppComponent(
          value: "Verso",
          color: AppColor.pantone7722C,
          fontWeight: FontWeight.w600,
        ),
      ],
    );
  }
}
