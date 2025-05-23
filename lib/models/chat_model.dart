class ChatRoom {
  final String id;
  final List<ChatUser> participants;
  final Message lastMessage;
  final List<Message> messages;
  final int unreadCount;
  final DateTime timestamp;

  ChatRoom({
    required this.id,
    required this.participants,
    required this.lastMessage,
    required this.messages,
    required this.unreadCount,
    required this.timestamp,
  });

  ChatRoom copyWith({
    String? id,
    List<ChatUser>? participants,
    Message? lastMessage,
    List<Message>? messages,
    int? unreadCount,
    DateTime? timestamp,
  }) {
    return ChatRoom(
      id: id ?? this.id,
      participants: participants ?? this.participants,
      lastMessage: lastMessage ?? this.lastMessage,
      messages: messages ?? List.from(this.messages),
      unreadCount: unreadCount ?? this.unreadCount,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}

class ChatUser {
  final String id;
  final String name;
  final String profilePic;
  final bool isOnline;

  ChatUser({
    required this.id,
    required this.name,
    required this.profilePic,
    required this.isOnline,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'profilePic': profilePic,
      'isOnline': isOnline,
    };
  }
}

class Message {
  final String senderId;
  final String text;
  final DateTime sentAt;
  final bool isRead;

  Message({
    required this.senderId,
    required this.text,
    required this.sentAt,
    required this.isRead,
  });
}
