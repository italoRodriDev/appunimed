import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AlertToastScreenAppComponent extends StatelessWidget {
  final String message;
  final VoidCallback onClose;

  const AlertToastScreenAppComponent({
    super.key,
    required this.message,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFEBEB), // fundo rosa claro
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          SvgPicture.asset('assets/svg/falha.svg'),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(color: Colors.black87, fontSize: 14),
            ),
          ),
          InkWell(
            onTap: onClose,
            child: const Icon(Icons.close, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
