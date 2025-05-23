import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logistics_admin_panel/common_widgets/chat_detail_view.dart';
import 'package:logistics_admin_panel/common_widgets/chat_list_view.dart';
import 'package:logistics_admin_panel/utils/app_colors.dart';
import 'package:logistics_admin_panel/views/chat/controller/chat_controller.dart';

class ChatScreen extends StatelessWidget {
  final ChatController controller = Get.find();

  ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor.withOpacity(0.05),
      body: Row(
        children: [
          Expanded(flex: 2, child: ChatListView()),
          VerticalDivider(width: 1, color: kPrimaryColor),
          Expanded(flex: 5, child: ChatDetailView()),
        ],
      ),
    );
  }
}
