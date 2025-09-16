import 'package:admin_dashboard/app/modules/chat_page/views/chat_page_model.dart';
import 'package:admin_dashboard/app/modules/custom_widgets/custom_text.dart';
import 'package:admin_dashboard/app/modules/home_landing/views/home_landing_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/chat_page_controller.dart';

class ChatPageView extends GetView<ChatPageController> {
  const ChatPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      body: Column(
        children: [
          buildTopBar(),
          Expanded(
            child: Row(
              children: [
                // Left Chat List
                Container(
                  width: 300.w,
                  color: Colors.white,
                  child: Column(
                    children: [
                      _buildChatHeader(),
                      _buildSearchBar(),
                      Expanded(
                        child: Column(
                          children: [
                            _buildPinnedMessages(),
                            _buildRecentMessages(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Right Chat Area
                Expanded(
                  child: Obx(() {
                    if (controller.selectedUser.value == null) {
                      return _buildEmptyState();
                    }
                    return _buildChatArea();
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatHeader() {
    return Container(
      padding: EdgeInsets.all(20.w),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: Color(0xFF38A169),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(Icons.add, color: Colors.white, size: 20.sp),
          ),
          SizedBox(width: 12.w),
          CustomText(
            text: 'Chat',
            size: 20,
            weight: FontWeight.w600,
            color: Color(0xFF2D3748),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      child: TextField(
        controller: controller.searchController,
        onChanged: controller.updateSearchQuery,
        decoration: InputDecoration(
          hintText: 'Search here...',
          hintStyle: GoogleFonts.lexend(
            fontSize: 14.sp,
            color: Color(0xFF718096),
          ),
          prefixIcon: Icon(Icons.search, color: Color(0xFF718096), size: 20.sp),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Color(0xFFE2E8F0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Color(0xFFE2E8F0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Color(0xFF38A169)),
          ),
          filled: true,
          fillColor: Color(0xFFF7FAFC),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12.h,
          ),
        ),
      ),
    );
  }

  Widget _buildPinnedMessages() {
    return Container(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: 'Pinned Message',
            size: 14,
            weight: FontWeight.w500,
            color: Color(0xFF718096),
          ),
          SizedBox(height: 12.h),
          Obx(
            () => Column(
              children: controller.pinnedMessages
                  .map((user) => _buildChatUserItem(user, isPinned: true))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentMessages() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'Recent Message',
              size: 14,
              weight: FontWeight.w500,
              color: Color(0xFF718096),
            ),
            SizedBox(height: 12.h),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.filteredRecentMessages.length,
                  itemBuilder: (context, index) {
                    return _buildChatUserItem(
                      controller.filteredRecentMessages[index],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatUserItem(ChatUser user, {bool isPinned = false}) {
    return InkWell(
      onTap: () => controller.selectUser(user),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 24.r,
                  backgroundColor: Color(0xFF38A169),
                  child: CustomText(
                    text: user.name[0].toUpperCase(),
                    size: 16,
                    color: Colors.white,
                    weight: FontWeight.w600,
                  ),
                ),
                if (user.isOnline)
                  Positioned(
                    bottom: 2.h,
                    right: 2.w,
                    child: Container(
                      width: 12.w,
                      height: 12.h,
                      decoration: BoxDecoration(
                        color: Color(0xFF38A169),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(
                        text: user.name,
                        size: 14,
                        weight: FontWeight.w600,
                        color: Color(0xFF2D3748),
                      ),
                      if (user.lastMessageTime != null)
                        CustomText(
                          text: user.lastMessageTime!,
                          size: 12,
                          color: Color(0xFF718096),
                        ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Expanded(
                        child: CustomText(
                          text: user.lastMessage ?? '',
                          size: 12,
                          color: Color(0xFF718096),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (user.hasUnreadMessages && user.unreadCount != null)
                        Container(
                          padding: EdgeInsets.all(6.w),
                          decoration: BoxDecoration(
                            color: Color(0xFF3182CE),
                            shape: BoxShape.circle,
                          ),
                          child: CustomText(
                            text: user.unreadCount.toString(),
                            size: 10,
                            color: Colors.white,
                            weight: FontWeight.w600,
                          ),
                        )
                      else if (user.isRead)
                        Icon(
                          Icons.done_all,
                          size: 16.sp,
                          color: Color(0xFF38A169),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChatArea() {
    return Column(
      children: [
        _buildChatHeader(),
        Expanded(child: _buildMessagesList()),
        _buildMessageInput(),
      ],
    );
  }

  Widget _buildChatAreaHeader() {
    return Obx(() {
      final user = controller.selectedUser.value!;
      return Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0xFF000000).withOpacity(0.05),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Stack(
              children: [
                CircleAvatar(
                  radius: 24.r,
                  backgroundColor: Color(0xFF38A169),
                  child: CustomText(
                    text: user.name[0].toUpperCase(),
                    size: 16,
                    color: Colors.white,
                    weight: FontWeight.w600,
                  ),
                ),
                if (user.isOnline)
                  Positioned(
                    bottom: 2.h,
                    right: 2.w,
                    child: Container(
                      width: 12.w,
                      height: 12.h,
                      decoration: BoxDecoration(
                        color: Color(0xFF38A169),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: user.name,
                    size: 16,
                    weight: FontWeight.w600,
                    color: Color(0xFF2D3748),
                  ),
                  CustomText(
                    text: user.isOnline ? 'Online' : 'Offline',
                    size: 12,
                    color: user.isOnline
                        ? Color(0xFF38A169)
                        : Color(0xFF718096),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.push_pin_outlined, color: Color(0xFF718096)),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search, color: Color(0xFF718096)),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.info_outline, color: Color(0xFF718096)),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.more_vert, color: Color(0xFF718096)),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }

  Widget _buildMessagesList() {
    return Container(
      color: Color(0xFFF8F9FA),
      child: Obx(
        () => ListView.builder(
          padding: EdgeInsets.all(20.w),
          reverse: true,
          itemCount: controller.currentMessages.reversed.length,
          itemBuilder: (context, index) {
            final messages = controller.currentMessages.reversed.toList();
            return _buildMessageBubble(messages[index]);
          },
        ),
      ),
    );
  }

  Widget _buildMessageBubble(ChatMessage message) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        mainAxisAlignment: message.isMe
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!message.isMe) ...[
            CircleAvatar(
              radius: 16.r,
              backgroundColor: Color(0xFF38A169),
              child: CustomText(
                text: message.senderName[0].toUpperCase(),
                size: 12,
                color: Colors.white,
                weight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 8.w),
          ],

          Flexible(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              decoration: BoxDecoration(
                color: message.isMe ? Color(0xFF3182CE) : Colors.white,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF000000).withOpacity(0.05),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: CustomText(
                text: message.content,
                size: 14,
                color: message.isMe ? Colors.white : Color(0xFF2D3748),
                height: 1.4,
              ),
            ),
          ),

          if (message.isMe) ...[
            SizedBox(width: 8.w),
            CircleAvatar(
              radius: 16.r,
              backgroundColor: Color(0xFF2D3748),
              child: CustomText(
                text: 'E',
                size: 12,
                color: Colors.white,
                weight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xFF000000).withOpacity(0.05),
            blurRadius: 4,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Formatting toolbar
          Row(
            children: [
              _buildFormatButton(Icons.format_bold, false),
              _buildFormatButton(Icons.format_italic, false),
              _buildFormatButton(Icons.format_underlined, false),
              _buildFormatButton(Icons.strikethrough_s, false),
              SizedBox(width: 16.w),
              _buildFormatButton(Icons.format_align_left, false),
              _buildFormatButton(Icons.format_align_center, false),
              _buildFormatButton(Icons.format_align_right, false),
              SizedBox(width: 16.w),
              _buildFormatButton(Icons.attach_file, false),
              _buildFormatButton(Icons.image, false),
              _buildFormatButton(Icons.more_horiz, false),
              Spacer(),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Color(0xFFE2E8F0)),
                ),
                child: CustomText(
                  text: 'Cancel',
                  size: 14,
                  color: Color(0xFF718096),
                ),
              ),
              SizedBox(width: 12.w),
              ElevatedButton(
                onPressed: controller.sendMessage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF38A169),
                ),
                child: CustomText(text: 'Send', size: 14, color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          // Message input
          TextField(
            controller: controller.messageController,
            maxLines: 3,
            minLines: 1,
            decoration: InputDecoration(
              hintText: 'Write your message here...',
              hintStyle: GoogleFonts.lexend(
                fontSize: 14.sp,
                color: Color(0xFF718096),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: Color(0xFFE2E8F0)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: Color(0xFFE2E8F0)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: Color(0xFF38A169)),
              ),
              filled: true,
              fillColor: Color(0xFFF7FAFC),
              contentPadding: EdgeInsets.all(16.w),
            ),
            onSubmitted: (_) => controller.sendMessage(),
          ),
        ],
      ),
    );
  }

  Widget _buildFormatButton(IconData icon, bool isActive) {
    return Container(
      margin: EdgeInsets.only(right: 4.w),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          icon,
          size: 18.sp,
          color: isActive ? Color(0xFF38A169) : Color(0xFF718096),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: CustomText(
        text: 'Select a conversation to start chatting',
        size: 16,
        color: Color(0xFF718096),
      ),
    );
  }
}
