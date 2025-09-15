import 'package:admin_dashboard/app/common_functions.dart';
import 'package:admin_dashboard/app/modules/custom_widgets/custom_text.dart';
import 'package:admin_dashboard/app/modules/home_landing/widgets.dart';
import 'package:admin_dashboard/app/services/user_state_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../controllers/home_landing_controller.dart';

class HomeLandingView extends GetView<HomeLandingController> {
  const HomeLandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          buildTopBar(),
          Expanded(child: buildMainContent()),
        ],
      ),
    );
  }
}

Widget buildMainContent() {
  final controller = Get.find<HomeLandingController>();

  return Padding(
    padding: EdgeInsets.all(20.w), // ✅ responsive padding
    child: SingleChildScrollView(
      child: Column(
        children: [
          // Filter button
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Obx(
                () => Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    color: appBackgroundColor(darkColor: darkContainer),
                    borderRadius: BorderRadius.circular(8.r),
                    // border: Border.all(color: Color(0xFFE1E0E5)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: const Icon(
                            FontAwesomeIcons.calendar,
                            size: 16,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      CustomText(
                        text: controller.filterPeriod.value,
                        size: 12,
                        // color: Colors.blue,
                        weight: FontWeight.w500,
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        size: 16,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 20.h),

          // Stats cards and charts
          buildStatsCards(),

          SizedBox(height: 40.h),

          SizedBox(
            height: 300.h, // 👈 responsive fixed height
            child: buildChartsSection(controller),
          ),

          SizedBox(height: 40.h),

          // Revenue chart + Customer map
          SizedBox(
            height: 400.h,
            child: Row(
              children: [
                Expanded(flex: 2, child: buildRevenueChart(controller)),
                SizedBox(width: 20.w),
                Expanded(flex: 1, child: buildCustomerMapSection()),
              ],
            ),
          ),

          SizedBox(height: 40.h),

          customerReview(),
        ],
      ),
    ),
  );
}

Widget buildTopBar() {
  return Container(
    height: 100.h, // responsive height
    color: appBackgroundColor(darkColor: Color(0xFF17161E)),
    padding: EdgeInsets.symmetric(horizontal: 20.w),
    child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: 'Dashboard',
              size: 20, // will convert to sp in CustomText
              weight: FontWeight.bold,
            ),
            SizedBox(height: 10),
            CustomText(
              text: 'Hi, Samantha. Welcome back to Sedap Admin!',
              size: 14,
              color: Colors.grey[600],
            ),
          ],
        ),
        Spacer(),
        // Search bar
        customSearchBar(),
        SizedBox(width: 20.w),
        // Notification icons
        _buildNotificationIcon(FontAwesomeIcons.heart, 3, Colors.pink),
        SizedBox(width: 15.w),
        _buildNotificationIcon(FontAwesomeIcons.comment, 1, Colors.blue),
        SizedBox(width: 15.w),
        _buildNotificationIcon(FontAwesomeIcons.bell, 2, Colors.orange),
        SizedBox(width: 15.w),
        GestureDetector(
          onTap: () {
            Get.find<UserStateController>().toggleTheme();
          },
          child: _buildNotificationIcon(
            Get.isDarkMode ? FontAwesomeIcons.moon : Icons.sunny,
            0,
            Colors.yellow,
          ),
        ),

        SizedBox(width: 20.w),
        // Profile
        Row(
          children: [
            CustomText(text: 'Hello, Samantha', size: 14),
            SizedBox(width: 10.w),
            CircleAvatar(
              radius: 18.r,
              backgroundImage: NetworkImage(
                'https://static.vecteezy.com/system/resources/previews/024/183/502/non_2x/male-avatar-portrait-of-a-young-man-with-a-beard-illustration-of-male-character-in-modern-color-style-vector.jpg',
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildNotificationIcon(IconData icon, int count, Color color) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Icon(icon, color: color, size: 20.sp),
      ),
      if (count > 0)
        Positioned(
          right: -4.w,
          top: -4.h,
          child: Container(
            padding: EdgeInsets.all(2.w),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10.r),
            ),
            constraints: BoxConstraints(minWidth: 16.w, minHeight: 16.h),
            child: Center(
              child: CustomText(
                text: '$count',
                size: 10,
                color: Colors.white,
                weight: FontWeight.bold,
                align: TextAlign.center,
              ),
            ),
          ),
        ),
    ],
  );
}
