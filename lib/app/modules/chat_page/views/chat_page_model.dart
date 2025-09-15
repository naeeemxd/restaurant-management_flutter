class ChatUser {
  final String id;
  final String name;
  final String? lastMessage;
  final String? lastMessageTime;
  final bool isOnline;
  final String avatar;
  final bool hasUnreadMessages;
  final int? unreadCount;
  final bool isRead;

  ChatUser({
    required this.id,
    required this.name,
    this.lastMessage,
    this.lastMessageTime,
    required this.isOnline,
    required this.avatar,
    this.hasUnreadMessages = false,
    this.unreadCount,
    this.isRead = true,
  });
}

class ChatMessage {
  final String id;
  final String senderId;
  final String senderName;
  final String content;
  final DateTime timestamp;
  final bool isMe;
  final String? avatar;

  ChatMessage({
    required this.id,
    required this.senderId,
    required this.senderName,
    required this.content,
    required this.timestamp,
    required this.isMe,
    this.avatar,
  });
}

