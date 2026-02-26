import 'package:app_colabora_unimedjp/app/data/models/protocol.model.dart';
import 'package:flutter/material.dart';

class CardProtocolComponent extends StatelessWidget {
  ProtocolModel data;
  Function() onPressed;

  CardProtocolComponent({
    super.key,
    required this.data,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // Definimos as cores e ícones baseados no status
    final bool isFinalizado =
        data.status.toString().toLowerCase() == 'finalizado';
    final Color statusColor = isFinalizado
        ? const Color(0xFF00A86B)
        : Colors.grey;
    final IconData statusIcon = isFinalizado ? Icons.check_circle : Icons.info;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Barra lateral colorida
              Container(width: 6, color: statusColor),
              // Conteúdo do Card
              Expanded(
                child: InkWell(
                  onTap: () {
                    onPressed();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Cabeçalho do Status
                              Row(
                                children: [
                                  Icon(
                                    statusIcon,
                                    color: statusColor,
                                    size: 20,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    data.status.toString(),
                                    style: TextStyle(
                                      color: statusColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              // Número do Protocolo
                              RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                    color: Color(0xFF1B4332),
                                    fontSize: 14,
                                  ),
                                  children: [
                                    const TextSpan(
                                      text: 'Protocolo: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(text: data.protocolNumber),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              // Nome do Usuário
                              Text(
                                data.userName.toString().toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Ícone de seta lateral
                        const Icon(Icons.chevron_right, color: Colors.grey),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
