import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/telehealth/controller/promptservice.controller.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/text_app.component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/components/form_swipe.dart';

class Step1FormPromptService extends StatelessWidget implements LiquidStep {
  final PromptServiceController ctrl = Get.put(PromptServiceController());
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
                  value: 'Solicitação de Reembolso Financeiro',
                  fontSize: 18,
                  color: AppColor.pantone348C,
                  fontWeight: FontWeight.w600,
                ),

                SizedBox(height: 20),
                TextAppComponent(
                  value:
                      'Reembolso por coparticipação ou mensalidade indevida, mensalidade paga em duplicidade, óbito, tanto do titular quanto do dependente, e transporte.',
                  fontSize: 16,
                  height: 1.5,
                ),
                SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      height: 1.5,
                    ),
                    children: [
                      TextSpan(text: 'Para os casos de reembolso por '),
                      TextSpan(
                        text: 'coparticipação indevida ou transporte',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: ', é preciso realizar um contato prévio e ',
                      ),
                      TextSpan(
                        text:
                            'informar o protocolo quando for solicitar o reembolso',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: '.'),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      height: 1.5,
                    ),
                    children: [
                      TextSpan(text: 'Acesse o '),
                      TextSpan(
                        text: 'Fale Conosco',
                        style: TextStyle(
                          color: AppColor.pantone348C,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text:
                            ', preencha o formulário, selecionando o "Assunto" como "Outros", anexe uma evidência e faça o envio da mensagem. Em alguns dias, acesse sua caixa de e-mails para ',
                      ),
                      TextSpan(
                        text: 'conseguir o protocolo do seu contato prévio',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text:
                            ', ele será necessário para realizar a solicitação.',
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      height: 1.5,
                    ),
                    children: [
                      TextSpan(
                        text:
                            'Em caso de dúvidas, entre em contato com o atendimento ao cliente através do ',
                      ),
                      TextSpan(
                        text: 'Fale Conosco',
                        style: TextStyle(
                          color: AppColor.pantone348C,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(text: ' ou pelo SAC 0800 725 1200.'),
                    ],
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
}
