import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logistics_admin_panel/utils/app_colors.dart';
import 'package:logistics_admin_panel/utils/app_images.dart';
import 'package:logistics_admin_panel/utils/app_styles.dart';
import 'package:logistics_admin_panel/views/chat/controller/chat_controller.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChatDetailView extends StatelessWidget {
  final ChatController controller = Get.find();

  ChatDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () =>
          controller.selectedChatRoom.value == null
              ? Center(
                child: Text(
                  'Select a chat to view',
                  style: AppStyles.whiteTextStyle().copyWith(fontSize: 16.sp),
                ),
              )
              : Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: getHeight(15)),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: kWhiteColor)),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(kUser1),
                        ),
                        SizedBox(width: getWidth(14)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              controller
                                  .selectedChatRoom
                                  .value!
                                  .participants
                                  .first
                                  .name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(height: getHeight(8)),
                            Row(
                              children: [
                                Container(
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
                                SizedBox(width: getWidth(3)),
                                Text(
                                  'Online',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                  ),
                                ),
                                SizedBox(width: getWidth(8)),
                                Text(
                                  '12:55 PM',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child:
                        controller.selectedChatRoom.value!.messages.isEmpty
                            ? Center(
                              child: Text(
                                'No messages',
                                style: AppStyles.whiteTextStyle(),
                              ),
                            )
                            : ListView.builder(
                              padding: EdgeInsets.symmetric(
                                horizontal: getWidth(24),
                                vertical: getHeight(15),
                              ),
                              itemCount:
                                  controller
                                      .selectedChatRoom
                                      .value!
                                      .messages
                                      .length,
                              itemBuilder: (context, index) {
                                final message =
                                    controller
                                        .selectedChatRoom
                                        .value!
                                        .messages[index];
                                final isMe = message.senderId == '2';
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: getHeight(10),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        isMe
                                            ? CrossAxisAlignment.end
                                            : CrossAxisAlignment.start,
                                    children: [
                                      Align(
                                        alignment:
                                            isMe
                                                ? Alignment.centerRight
                                                : Alignment.centerLeft,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            vertical: getHeight(12),
                                            horizontal: getWidth(12),
                                          ),
                                          constraints: BoxConstraints(
                                            maxWidth: getWidth(330),
                                          ),
                                          decoration: BoxDecoration(
                                            color:
                                                isMe
                                                    ? kPrimaryColor
                                                    : kWhiteShade1Color,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(16),
                                              topRight: Radius.circular(16),
                                              bottomLeft: Radius.circular(
                                                isMe ? 16 : 0,
                                              ),
                                              bottomRight: Radius.circular(
                                                isMe ? 0 : 16,
                                              ),
                                            ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                isMe
                                                    ? CrossAxisAlignment.end
                                                    : CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                message.text,
                                                style:
                                                    AppStyles.blackTextStyle()
                                                        .copyWith(
                                                          fontSize: 14.sp,
                                                        ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: getHeight(5)),
                                      Text(
                                        DateFormat(
                                          'hh:mm a',
                                        ).format(message.sentAt),
                                        style: AppStyles.whiteTextStyle()
                                            .copyWith(fontSize: 12.sp),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getWidth(24),
                      vertical: getHeight(10),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: getWidth(12),
                        vertical: getHeight(12),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: kWhiteColor),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: getWidth(32),
                            height: getHeight(40),

                            decoration: BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Icon(Icons.add, color: kSecondaryColor),
                            ),
                          ),
                          SizedBox(width: getWidth(15)),
                          Expanded(
                            child: TextField(
                              controller: controller.messageCont,
                              style: AppStyles.whiteTextStyle().copyWith(
                                fontSize: 14.sp,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Your message',
                                hintStyle: AppStyles.whiteTextStyle().copyWith(
                                  fontSize: 14.sp,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.sendMessage(
                                controller.messageCont.text,
                                '2',
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: getWidth(16),
                                vertical: getHeight(8),
                              ),
                              decoration: BoxDecoration(
                                color: kPrimaryColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Send',
                                    style: AppStyles.blackTextStyle().copyWith(
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  SizedBox(width: getWidth(8)),
                                  Image.asset(
                                    kSendIcon,
                                    height: getHeight(20),
                                    width: getWidth(20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: getHeight(40)),
                ],
              ),
    );
  }
}
