import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:logistics_admin_panel/models/chat_model.dart';

class ChatController extends GetxController {
  var chatRooms = <ChatRoom>[].obs;
  var selectedChatRoom = Rxn<ChatRoom>();
  TextEditingController messageCont = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchChatRooms();
  }

  void fetchChatRooms() {
    chatRooms.value = [
      ChatRoom(
        id: '1',
        participants: [
          ChatUser(
            id: '1',
            name: 'Jane Doe',
            profilePic: 'url',
            isOnline: true,
          ),
          ChatUser(id: '2', name: 'Admin', profilePic: 'url', isOnline: true),
        ],
        lastMessage: Message(
          senderId: '1',
          text: 'Hi, I want to make enquiries about my order',
          sentAt: DateTime.now(),
          isRead: false,
        ),
        messages: [
          Message(
            senderId: '1',
            text: 'Hello, I want to make enquiries about your product',
            sentAt: DateTime.now(),
            isRead: false,
          ),
          Message(
            senderId: '2',
            text: 'Hello Janet, thank you for reaching out',
            sentAt: DateTime.now(),
            isRead: false,
          ),
        ],
        unreadCount: 2,
        timestamp: DateTime.now(),
      ),
      ChatRoom(
        id: '2',
        participants: [
          ChatUser(
            id: '1',
            name: 'Janet Adebayo',
            profilePic: 'url',
            isOnline: true,
          ),
          ChatUser(id: '2', name: 'Admin', profilePic: 'url', isOnline: true),
        ],
        lastMessage: Message(
          senderId: '1',
          text: 'Hi, I want to make enquiries about my order',
          sentAt: DateTime.now(),
          isRead: false,
        ),
        messages: [],
        unreadCount: 1,
        timestamp: DateTime.now(),
      ),
    ];
  }

  void selectChatRoom(ChatRoom chatRoom) {
    selectedChatRoom.value = chatRoom;
  }

  void sendMessage(String text, String senderId) {
    if (selectedChatRoom.value != null) {
      final newMessage = Message(
        senderId: senderId,
        text: text,
        sentAt: DateTime.now(),
        isRead: false,
      );

      selectedChatRoom.value!.messages.add(newMessage);

      selectedChatRoom.value = selectedChatRoom.value!.copyWith(
        lastMessage: newMessage,
        unreadCount: selectedChatRoom.value!.unreadCount + 1,
      );
      messageCont.clear();

      chatRooms.refresh();
    }
  }
}
