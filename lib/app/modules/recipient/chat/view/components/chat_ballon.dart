import 'package:app_colabora_unimedjp/app/modules/utils/components/text_app.component.dart';
import 'package:flutter/material.dart';

import '../../../../../config/colors/colors.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final List<String> files;
  final bool isMe;

  const ChatBubble({super.key, required this.message, required this.files, required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            width: 350,
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: isMe ? AppColor.pantone382C : Colors.grey.shade200,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(16),
                topRight: const Radius.circular(16),
                bottomLeft: Radius.circular(isMe ? 16 : 4),
                bottomRight: Radius.circular(isMe ? 4 : 16),
              ),
            ),
            child: Row(
              children: [
                SizedBox(width: 300,
                child: Text(
                  message,
                  style: TextStyle(
                    color: isMe ? AppColor.pantone7722C : AppColor.pantone7722C,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                )),
                for(var i in files)
                InkWell(onTap: () {

                }, 
                child: TextAppComponent(value: 'Ver documento ${files.indexOf(i).toString()}'))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
