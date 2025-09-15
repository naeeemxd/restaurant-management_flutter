import 'package:admin_dashboard/app/modules/chat_page/views/chat_page_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPageController extends GetxController {
  var selectedUser = Rx<ChatUser?>(null);
  var chatUsers = <ChatUser>[].obs;
  var pinnedMessages = <ChatUser>[].obs;
  var recentMessages = <ChatUser>[].obs;
  var currentMessages = <ChatMessage>[].obs;
  var messageController = TextEditingController();
  var searchController = TextEditingController();
  var searchQuery = ''.obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadChatData();
  }

  void loadChatData() {
    isLoading.value = true;
    
    Future.delayed(Duration(milliseconds: 500), () {
      // Load pinned messages
      pinnedMessages.value = [
        ChatUser(
          id: '1',
          name: 'Robert Johanson',
          lastMessage: 'Hi David, can you send your...',
          lastMessageTime: '2min ago',
          isOnline: false,
          avatar: 'assets/robert.jpg',
          hasUnreadMessages: true,
          unreadCount: 2,
        ),
        ChatUser(
          id: '2',
          name: 'Chloe Jess',
          lastMessage: 'I have done my task last week...',
          lastMessageTime: '5min ago',
          isOnline: true,
          avatar: 'assets/chloe.jpg',
          isRead: true,
        ),
      ];

      // Load recent messages
      recentMessages.value = [
        ChatUser(
          id: '3',
          name: 'Roberto',
          lastMessage: 'Last week, do you remember?',
          lastMessageTime: '02:45 AM',
          isOnline: false,
          avatar: 'assets/roberto.jpg',
          isRead: true,
        ),
        ChatUser(
          id: '4',
          name: 'Lisa Blekcurrent',
          lastMessage: 'My boss give me that task last...',
          lastMessageTime: '2 min ago',
          isOnline: true,
          avatar: 'assets/lisa.jpg',
        ),
        ChatUser(
          id: '5',
          name: 'Olivia Braun',
          lastMessage: 'Hey, you forget to upload submi...',
          lastMessageTime: 'Yesterday',
          isOnline: false,
          avatar: 'assets/olivia.jpg',
        ),
        ChatUser(
          id: '6',
          name: 'James Sudayat',
          lastMessage: 'Hi David, can you send your...',
          lastMessageTime: 'Yesterday',
          isOnline: true,
          avatar: 'assets/james.jpg',
        ),
      ];

      // Set Roberto as selected by default
      selectedUser.value = ChatUser(
        id: '3',
        name: 'Roberto',
        isOnline: true,
        avatar: 'assets/roberto.jpg',
      );

      // Load messages for Roberto
      loadMessagesForUser(selectedUser.value!);
      
      isLoading.value = false;
    });
  }

  void loadMessagesForUser(ChatUser user) {
    currentMessages.value = [
      ChatMessage(
        id: '1',
        senderId: user.id,
        senderName: user.name,
        content: 'Hi everyone! Let\'s start our discussion now about kick off meeting next week.',
        timestamp: DateTime.now().subtract(Duration(minutes: 30)),
        isMe: false,
        avatar: user.avatar,
      ),
      ChatMessage(
        id: '2',
        senderId: user.id,
        senderName: user.name,
        content: 'Is everyone ok about that schedule?',
        timestamp: DateTime.now().subtract(Duration(minutes: 25)),
        isMe: false,
        avatar: user.avatar,
      ),
      ChatMessage(
        id: '3',
        senderId: 'me',
        senderName: 'Eren Yeager',
        content: 'Uhm, can I reschedule meeting?',
        timestamp: DateTime.now().subtract(Duration(minutes: 20)),
        isMe: true,
      ),
      ChatMessage(
        id: '4',
        senderId: 'me',
        senderName: 'Me',
        content: 'I still have 2 task left at that day, I worried can\'t attend that meeting',
        timestamp: DateTime.now().subtract(Duration(minutes: 18)),
        isMe: true,
      ),
    ];
  }

  void selectUser(ChatUser user) {
    selectedUser.value = user;
    loadMessagesForUser(user);
  }

  void sendMessage() {
    if (messageController.text.trim().isNotEmpty) {
      final message = ChatMessage(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        senderId: 'me',
        senderName: 'Me',
        content: messageController.text.trim(),
        timestamp: DateTime.now(),
        isMe: true,
      );
      
      currentMessages.add(message);
      messageController.clear();
    }
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }

  List<ChatUser> get filteredRecentMessages {
    if (searchQuery.value.isEmpty) {
      return recentMessages;
    }
    return recentMessages.where((user) => 
      user.name.toLowerCase().contains(searchQuery.value.toLowerCase())
    ).toList();
  }

  String formatMessageTime(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);
    
    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else {
      return '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
    }
  }

  @override
  void onClose() {
    messageController.dispose();
    searchController.dispose();
    super.onClose();
  }

}
