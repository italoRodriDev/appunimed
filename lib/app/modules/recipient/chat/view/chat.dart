import 'package:app_colabora_unimedjp/app/config/colors/colors.dart';
import 'package:app_colabora_unimedjp/app/modules/utils/components/inputs/input_app.component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/components/toolbars/toolbar_app.component.dart';
import '../controller/chat.controller.dart';
import 'components/chat_ballon.dart';

class ChatPage extends GetView<ChatController> {
  ChatPage({super.key});

  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 0),
          child: ToolbarAppComponent(
            onPressedMenu: () {},
            showMenu: false,
            title: 'Chat',
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => ListView.builder(
                  padding: const EdgeInsets.only(top: 10),
                  itemCount: controller.messages.length,
                  itemBuilder: (context, index) {
                    final message = controller.messages[index];

                    return ChatBubble(
                      message: message.text.toString(),
                      isMe: message.isMe == 1 ? true : false,
                      files: [],
                    );
                  },
                ),
              ),
            ),
            _buildInputBar(context),
          ],
        ),
      ),
    );
  }

  Widget _buildInputBar(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(blurRadius: 4, color: Colors.black12)],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: AppColor.pantone7722C,
            child: IconButton(
              icon: const Icon(Icons.upload, color: Colors.white),
              onPressed: () {
                controller.showAlertOptionsSelectFiles(context);
              },
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: InputTextAppComponent(
              borderColor: AppColor.neutral2,
              textEditingController: messageController,
              minLines: 1,
              maxLines: 4,
              hintText: "Digite sua mensagem...",
              borderRadius: 8,
            ),
          ),

          const SizedBox(width: 8),
          
          CircleAvatar(
            radius: 24,
            backgroundColor: AppColor.pantone382C,
            child: IconButton(
              icon: const Icon(Icons.send, color: Colors.white),
              onPressed: () {
                if (messageController.text.trim().isEmpty) return;

                controller.sendMessage(messageController.text.trim());

                messageController.clear();
              },
            ),
          ),
        ],
      ),
    );
  }
}
