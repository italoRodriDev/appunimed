import 'package:app_colabora_unimedjp/app/modules/utils/components/button_app.component.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../config/colors/colors.dart';
import '../../../../../data/models/medical_guide.model.dart';
import '../../../../utils/components/text_app.component.dart';

class CardMedicalGuideComponent extends StatefulWidget {
  final MedicalGuideModel data;
  Function() onPressedFavorite;
  Function() onPressedReportProblem;

  CardMedicalGuideComponent({
    super.key,
    required this.data,
    required this.onPressedFavorite,
    required this.onPressedReportProblem,
  });

  @override
  State<CardMedicalGuideComponent> createState() =>
      _CardMedicalGuideComponentState();
}

class _CardMedicalGuideComponentState extends State<CardMedicalGuideComponent> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Card(
        elevation: 0,
        color: AppColor.highlight6.withAlpha(80),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_buildHeader(), if (_isExpanded) _buildBody()],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.highlight6.withAlpha(50),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              widget.onPressedFavorite();
            },
            icon: Icon(Icons.favorite_outline, color: AppColor.pantone7722C),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextAppComponent(
              value: widget.data.nome ?? '',
              fontWeight: FontWeight.w800,
              color: AppColor.pantone7722C,
              fontSize: 16,
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            icon: Icon(
              _isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: AppColor.pantone7722C,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    final data = widget.data;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          infoItem('Especialidade', data.especialidade),
          infoItem('CRM', data.crm),
          infoItem('Endereço', data.endereco),
          infoItem('Tipo', data.tipo),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonStylizedAppComponent(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                color: AppColor.pantone348C,
                onPressed: () {
                  _openWhatsApp(data.whatsapp.toString());
                },
                label: TextAppComponent(
                  value: data.telefone.toString(),
                  fontSize: 14,
                ),
              ),
              ButtonStylizedOutlineAppComponent(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                outlineColor: AppColor.pantone348C,
                onPressed: () {
                  _openWhatsApp(data.whatsapp.toString());
                },
                label: TextAppComponent(
                  value: data.whatsapp.toString(),
                  fontSize: 14,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonStylizedAppComponent(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                color: AppColor.pantone348C,
                onPressed: () {
                  _openMap(data.localizacao.toString());
                },
                label: Row(
                  children: [
                    Icon(Icons.location_pin, color: Colors.white),
                    SizedBox(width: 5),
                    TextAppComponent(value: 'Ver Como chegar', fontSize: 14),
                  ],
                ),
              ),
              ButtonStylizedOutlineAppComponent(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                outlineColor: AppColor.pantone348C,
                onPressed: () {
                  widget.onPressedReportProblem();
                },
                label: Row(
                  children: [
                    Icon(Icons.warning_amber, color: AppColor.pantone348C),
                    SizedBox(width: 5),
                    TextAppComponent(value: 'Reportar problema', fontSize: 14),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget infoItem(String label, String? value, {bool isLink = false}) {
    if (value == null || value.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: GestureDetector(
        onTap: isLink ? () => _openWhatsApp(value) : null,
        child: RichText(
          text: TextSpan(
            text: '$label: ',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: AppColor.pantone7722C,
            ),
            children: [
              TextSpan(
                text: value,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: isLink ? AppColor.pantone7722C : AppColor.neutral1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _openMap(String address) async {
    if (address.isEmpty) return;

    final encodedAddress = Uri.encodeComponent(address);
    final url = Uri.parse(
      "https://www.google.com/maps/search/?api=1&query=$encodedAddress",
    );

    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  Future<void> _openWhatsApp(String phone) async {
    final url = Uri.parse(
      "https://wa.me/${phone.replaceAll(RegExp(r'[^0-9]'), '')}",
    );

    await launchUrl(url, mode: LaunchMode.externalApplication);
  }
}
