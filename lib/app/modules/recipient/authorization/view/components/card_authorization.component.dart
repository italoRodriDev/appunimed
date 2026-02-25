import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:app_colabora_unimedjp/app/data/models/authorization.model.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/text_app.component.dart';
import 'package:flutter/material.dart';

import '../../../../utils/extensions/date_time_extensions.dart';

class CardAuthorizationComponent extends StatefulWidget {
  final AuthorizationModel data;
  final Function() onPressed;

  CardAuthorizationComponent({
    super.key,
    required this.data,
    required this.onPressed,
  });

  @override
  State<CardAuthorizationComponent> createState() =>
      _CardAuthorizationComponentState();
}

class _CardAuthorizationComponentState
    extends State<CardAuthorizationComponent> {
  Map<String, dynamic> _getStatusStyle(String? status) {
    final defaultStyle = {
      'bgColor': AppColor.neutral3,
      'fontColor': AppColor.pantone7722C,
      'icon': Icons.help_outline,
      'iconColor': AppColor.pantone7722C,
      'label': status ?? 'Indefinido',
    };

    final Map<String, Map<String, dynamic>> styles = {
      'AUTORIZADA': {
        'bgColor': AppColor.pantone382C.withOpacity(0.2),
        'fontColor': AppColor.pantone7722C,
        'icon': Icons.check_circle,
        'iconColor': AppColor.pantone7722C,
        'label': 'AUTORIZADA',
      },
      'UTILIZADA': {
        'bgColor': AppColor.neutral3,
        'fontColor': AppColor.pantone7722C,
        'icon': Icons.check_circle_outline,
        'iconColor': AppColor.pantone7722C,
        'label': 'UTILIZADA',
      },
      'AGUARDANDO AUTORIZAÇÃO': {
        'bgColor': AppColor.neutral3,
        'fontColor': AppColor.pantone7722C,
        'icon': Icons.remove_circle_outline,
        'iconColor': AppColor.warning,
        'label': 'Em Análise',
      },
      'Pendente Auditoria': {
        'bgColor': AppColor.neutral3,
        'fontColor': AppColor.pantone7722C,
        'icon': Icons.remove_circle_outline,
        'iconColor': AppColor.warning,
        'label': 'Em Análise',
      },
      'NEGADA': {
        'bgColor': AppColor.neutral3,
        'fontColor': AppColor.danger,
        'icon': Icons.highlight_off,
        'iconColor': AppColor.danger,
        'label': 'Negada',
      },
      'CANCELADA': {
        'bgColor': AppColor.neutral3,
        'fontColor': AppColor.danger,
        'icon': Icons.close_sharp,
        'iconColor': AppColor.danger,
        'label': 'CANCELADA',
      },
      'EM ANÁLISE ADMINISTRATIVA': {
        'bgColor': AppColor.neutral3,
        'fontColor': AppColor.pantone7722C,
        'icon': Icons.access_time,
        'iconColor': AppColor.pantone7722C,
        'label': 'EM ANÁLISE ADMINISTRATIVA',
      },
      // Adicione os demais conforme necessário seguindo este padrão
    };

    return styles[status] ?? defaultStyle;
  }

  @override
  Widget build(BuildContext context) {
    final style = _getStatusStyle(widget.data.status?.toString());

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: widget.onPressed,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: style['bgColor'],
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.black12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // COLUNA DA ESQUERDA (Status)
              SizedBox(
                width: 85,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(style['icon'], color: style['iconColor'], size: 35),
                    const SizedBox(height: 8),
                    TextAppComponent(
                      value: style['label'],
                      fontSize: 10,
                      textAlign: TextAlign.center,
                      fontWeight: FontWeight.w800,
                      color: style['fontColor'],
                    ),
                  ],
                ),
              ),

              // DIVISOR
              Container(
                height: 160, // Altura fixa para manter o alinhamento
                width: 1,
                margin: const EdgeInsets.symmetric(horizontal: 12),
                color: (style['fontColor'] as Color).withOpacity(0.3),
              ),

              // COLUNA DA DIREITA (Dados)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildField(
                      'Vencimento:',
                      formatterDate(widget.data.validade),
                      style['fontColor'],
                    ),
                    if (widget.data.solicitante != null)
                      _buildField(
                        'Solicitante:',
                        widget.data.solicitante!,
                        style['fontColor'],
                      ),
                    _buildField(
                      'Beneficiário:',
                      widget.data.beneficiario ?? '-',
                      style['fontColor'],
                    ),
                    _buildField(
                      'Número de Guia:',
                      widget.data.numeroGuia ?? '-',
                      style['fontColor'],
                    ),
                    _buildField(
                      'Protocolo:',
                      widget.data.protocolo ?? '-',
                      style['fontColor'],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Helper para construir as linhas de informação
  Widget _buildField(String label, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 10, color: color.withOpacity(0.7)),
          ),
          TextAppComponent(
            value: value,
            fontWeight: FontWeight.w700,
            fontSize: 12,
            color: color,
          ),
        ],
      ),
    );
  }

  String formatterDate(dynamic date) {
    if (date == null) return '--/--/----';
    return DateTimeExtensions.formatDate(date.toString(), 'dd/MM/yyyy');
  }
}
