import 'dart:io';

import 'package:app_colabora_unimedjp/app/data/models/contact.model.dart';
import 'package:app_colabora_unimedjp/app/modules/recipient/protocols/view/components/card_contacts.component.dart';
import 'package:app_colabora_unimedjp/app/routers/app_routers.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/fonts/fonts.dart';
import '../../../utils/components/button_app.component.dart';
import '../../../utils/components/inputs/input_app.component.dart';
import '../../../utils/components/preview_pdf.component.dart';
import '../../../utils/components/select_component_app.component.dart';
import '../../../utils/components/text_app.component.dart';
import '../../../utils/components/toolbars/toolbar_app.component.dart';
import '../../declarations/view/components/card_menu_declaration.component.dart';
import '../controller/talktous.controller.dart';

class TalkToUsPage extends GetView<TalkToUsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 0),
          child: ToolbarAppComponent(
            showMenu: false,
            onPressedMenu: () {},
            title: "Fale Conosco",
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
                    value: 'Fale Conosco',
                    fontFamily: AppFont.UnimedSlab,
                    fontWeight: FontWeight.w600,
                    color: AppColor.pantone348C,
                    fontSize: 22,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  TextAppComponent(
                    value: 'Envie dúvidas e encontre outras formas de contato.',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
            Divider(height: 0, color: AppColor.neutral2),
            CardMenuDeclarationComponent(
              title: 'Contatos',
              subtitle: 'Ver contatos',
              onPressed: () {
                openModalContacts(context);
              },
            ),
            CardMenuDeclarationComponent(
              title: 'Enviar mensagem',
              subtitle: 'Acessar',
              onPressed: () {
                openModalSendMessage(context, controller);
              },
            ),
            CardMenuDeclarationComponent(
              title: 'ChatBot - Watsapp',
              subtitle: 'Acessar',
              onPressed: () {
                openWhatsApp('+5583993615361');
              },
            ),
            CardMenuDeclarationComponent(
              title: 'Acompanhar Protocolos',
              subtitle: 'Acessar',
              onPressed: () {
                Get.toNamed(RoutesApp.PROTOCOLS);
              },
            ),
            CardMenuDeclarationComponent(
              title: 'Protocoloes Negados',
              subtitle: 'Acessar',
              onPressed: () {
                showPDF(context);
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

  void openModalSendMessage(
    BuildContext context,
    TalkToUsController controller,
  ) {
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
                      title: 'Nova mensagem',
                    ),
                    TextAppComponent(
                      value: 'Envie sua mensagem',
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
                          'Informe os dados a baixo pra nos enviar uma mensagem, e retornaremos o contato.',
                    ),
                    SizedBox(height: 10),

                    Padding(
                      padding: EdgeInsetsGeometry.all(10),
                      child: Column(
                        children: [
                          SelectAppComponent(
                            labelText: 'Assuntos',
                            borderColor: AppColor.pantone7722C,
                            enabledBorder: true,
                            menuItemData: [
                              MenuItemData(
                                label: 'Autorização de conta em débito',
                                value: 'AUTORIZACAO DE DEBITO EM CONTA',
                              ),
                            ],
                            onChanged: (value) {
                              print('Tipo: $value');
                            },
                            primaryColor: AppColor.pantone382C,
                          ),
                          SizedBox(height: 8),
                          InputTextAppComponent(
                            borderRadius: 16,
                            maxLength: 500,
                            borderColor: AppColor.pantone7722C,
                            labelText: 'E-mail',
                            hintText: 'Informe seu e-mail...',
                          ),
                          SizedBox(height: 8),
                          InputTextAppComponent(
                            labelText: 'Telefone',
                            textInputType: TextInputType.phone,
                            maxLength: 15,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              TelefoneInputFormatter(),
                            ],
                            hintText: 'Informe seu telefone',
                            textInputAction: TextInputAction.next,
                          ),
                          SizedBox(height: 8),
                          InputTextAppComponent(
                            borderRadius: 16,
                            minLines: 5,
                            maxLines: 5,
                            maxLength: 500,
                            borderColor: AppColor.pantone7722C,
                            labelText: 'Observações',
                            hintText: 'Observações...',
                          ),
                          SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              "Os tipos dos arquivos que podem ser anexados: .pdf, .jpeg, .jpg, .png ou .gif; O tamanho do arquivo não deve superar 5MB; Ressaltamos que toda documentação acima é obrigatória para a análise do Reembolso e deve ser enviada completa. Em caso de falta de documentação, será dado um prazo de 5 dias úteis para apresentação da pendência e não apresentando o processo será cancelado e arquivado.",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[700],
                                height: 1.4,
                              ),
                            ),
                          ),
                          const SizedBox(height: 24),
                          InkWell(
                            onTap: () {
                              controller.showAlertOptionsSelectFiles(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: const BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(color: Colors.grey),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ValueListenableBuilder(
                                    valueListenable: controller.documentos,
                                    builder: (context, List<File?> files, child) {
                                      if (files.isNotEmpty) {
                                        return TextAppComponent(
                                          value:
                                              '${files.length} arquivo(s) selecionado(s)',
                                          color: AppColor.pantone7722C,
                                        );
                                      }
                                      return TextAppComponent(
                                        value: "Selecionar arquivos",
                                        color: AppColor.pantone7722C,
                                      );
                                    },
                                  ),
                                  Icon(
                                    Icons.upload,
                                    color: AppColor.pantone382C,
                                  ),
                                ],
                              ),
                            ),
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
                                  value: 'Enviar mensagem',
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 80),
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

  void openModalContacts(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Container(
              margin: EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  // Toolbar fixa no topo do modal
                  ToolbarAppComponent(
                    onPressedMenu: () => Navigator.pop(context),
                    showMenu: false,
                    title: 'Contatos',
                  ),

                  Expanded(
                    child: ValueListenableBuilder<List<ContactModel>>(
                      valueListenable: controller
                          .listContacts, // Escutando a sua lista de unidades
                      builder: (context, contacts, child) {
                        return ListView.builder(
                          padding: const EdgeInsets.only(top: 10, bottom: 20),
                          itemCount: contacts.length,
                          itemBuilder: (context, index) {
                            final item = contacts[index];

                            return CardContactsComponent(
                              data: item,
                              onPressedReportProblem: () {
                                print('Problema em: ${item.nome}');
                              },
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> openWhatsApp(String phone) async {
    final url = Uri.parse(
      "https://wa.me/${phone.replaceAll(RegExp(r'[^0-9]'), '')}",
    );

    await launchUrl(url, mode: LaunchMode.externalApplication);
  }
}
