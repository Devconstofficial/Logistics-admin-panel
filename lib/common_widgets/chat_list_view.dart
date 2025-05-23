import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logistics_admin_panel/utils/app_colors.dart';
import 'package:logistics_admin_panel/utils/app_images.dart';
import 'package:logistics_admin_panel/utils/app_styles.dart';
import 'package:logistics_admin_panel/views/chat/controller/chat_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChatListView extends StatelessWidget {
  final ChatController controller = Get.find();

  ChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: controller.chatRooms.length,
        itemBuilder: (context, index) {
          var chatRoom = controller.chatRooms[index];
          return InkWell(
            onTap: () => controller.selectChatRoom(chatRoom),
            child: Obx(
              () => Container(
                padding: EdgeInsets.only(
                  right: getWidth(7),
                  top: getHeight(12),
                  bottom: getHeight(12),
                ),
                decoration: BoxDecoration(
                  color:
                      controller.selectedChatRoom.value != null &&
                              controller.selectedChatRoom.value!.id ==
                                  chatRoom.id
                          ? kBlueShade1Color.withOpacity(0.19)
                          : Colors.transparent,
                  border: Border(bottom: BorderSide(color: kWhiteColor)),
                ),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        SizedBox(height: getHeight(60), width: getWidth(51)),
                        Positioned(
                          left: 0,
                          child: Container(
                            height: getHeight(60),
                            width: getWidth(48),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: AssetImage(kUser1),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            height: getHeight(12),
                            width: getWidth(12),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: kWhiteColor,
                            ),
                            child: Center(
                              child: Container(
                                height: getHeight(8),
                                width: getWidth(8),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: getWidth(14)),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                chatRoom.participants.first.name,
                                style: AppStyles.whiteTextStyle().copyWith(
                                  fontSize: 14.sp,
                                ),
                              ),
                              chatRoom.unreadCount > 0
                                  ? CircleAvatar(
                                    radius: 10,
                                    backgroundColor: kPrimaryColor,
                                    child: Center(
                                      child: Text(
                                        '${chatRoom.unreadCount}',
                                        style: AppStyles.blackTextStyle()
                                            .copyWith(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                      ),
                                    ),
                                  )
                                  : SizedBox.shrink(),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: getHeight(250),
                                child: Text(
                                  chatRoom.lastMessage.text,
                                  maxLines: 1,
                                  style: AppStyles.whiteTextStyle().copyWith(
                                    color: kGreyShade4Color,
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),

                              Text(
                                DateFormat(
                                  'hh:mm a',
                                ).format(chatRoom.lastMessage.sentAt),
                                style: AppStyles.whiteTextStyle().copyWith(
                                  color: kGreyShade4Color,
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
