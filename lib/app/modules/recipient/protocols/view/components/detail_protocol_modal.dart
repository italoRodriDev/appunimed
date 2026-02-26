import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:app_colabora_unimedjp/app/data/models/protocol.model.dart';
import 'package:flutter/material.dart';

import '../../../../utils/components/preview_pdf.component.dart';
import '../../../../utils/components/toolbars/toolbar_app.component.dart';

class ProtocolDetailScreen extends StatelessWidget {
  final ProtocolModel data;

  const ProtocolDetailScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 0),
          child: ToolbarAppComponent(
            onPressedMenu: () {},
            showMenu: false,
            title: 'Detalhes do Protocolo',
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2F4F5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.protocolNumber ?? '',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color(0xFF4A4A4A),
                          ),
                        ),
                        const Text(
                          'NÚMERO DO PROTOCOLO',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                InkWell(
                  onTap: () {
                    showPDF(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColor.pantone348C,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.download,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF2F4F5),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.description,
                        color: AppColor.pantone348C,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Detalhes do Protocolo',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF1B4332),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  _buildInfoField('Tipo de Ocorrência', data.occurrenceType),

                  Row(
                    children: [
                      Expanded(
                        child: _buildInfoField(
                          'Data de Abertura',
                          data.openDate,
                        ),
                      ),
                      Expanded(
                        child: _buildInfoField(
                          'Data de Fechamento',
                          data.closeDate,
                        ),
                      ),
                    ],
                  ),

                  _buildInfoField('Nome de Beneficiário', data.beneficiaryName),
                  _buildInfoField('Ocorrência', data.occurrence),
                  _buildInfoField('Status do Protocolo', data.status),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoField(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            value ?? '---',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Color(0xFF4A4A4A),
            ),
          ),
          Text(label, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }

  showPDF(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PreviewPDFComponent(
          title: 'Protocolo',
          url: 'https://pdfobject.com/pdf/sample.pdf',
          isNetwork: true,
        ),
      ),
    );
  }
}
