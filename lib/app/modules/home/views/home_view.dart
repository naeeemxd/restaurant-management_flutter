import 'package:admin_dashboard/app/modules/analytics/views/analytics_view.dart';
import 'package:admin_dashboard/app/modules/calendar_page/views/calendar_page_view.dart';
import 'package:admin_dashboard/app/modules/chat_page/views/chat_page_view.dart';
import 'package:admin_dashboard/app/modules/custom_widgets/custom_text.dart';
import 'package:admin_dashboard/app/modules/custom_widgets/responsive.dart';
import 'package:admin_dashboard/app/modules/customer_details/views/customer_details_view.dart';
import 'package:admin_dashboard/app/modules/customers/views/customers_view.dart';
import 'package:admin_dashboard/app/modules/fooddetails/views/fooddetails_view.dart';
import 'package:admin_dashboard/app/modules/foods/views/foods_view.dart';
import 'package:admin_dashboard/app/modules/home_landing/views/home_landing_view.dart';
import 'package:admin_dashboard/app/modules/order_details/views/order_details_view.dart';
import 'package:admin_dashboard/app/modules/order_list/views/order_list_view.dart';
import 'package:admin_dashboard/app/modules/reviews/views/reviews_view.dart';
import 'package:admin_dashboard/app/modules/wallet_page/views/wallet_page_view.dart';
import 'package:admin_dashboard/app/services/user_state_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Row(
          children: [
            !Responsive(context).isMobile()
                ? _buildSidebar()
                : SizedBox.shrink(),

            // Pages
            controller.selectedSidebarIndex.value == 0
                ? Expanded(child: HomeLandingView())
                : controller.selectedSidebarIndex.value == 1
                ? Expanded(child: orderlistview())
                : controller.selectedSidebarIndex.value == 2
                ? Expanded(child: OrderDetailsView())
                : controller.selectedSidebarIndex.value == 3
                ? Expanded(child: CustomersView())
                : controller.selectedSidebarIndex.value == 4
                ? Expanded(child: AnalyticsView())
                : controller.selectedSidebarIndex.value == 5
                ? Expanded(child: ReviewsView())
                : controller.selectedSidebarIndex.value == 6
                ? Expanded(child: FoodsView())
                : controller.selectedSidebarIndex.value == 7
                ? Expanded(child: FooddetailsView())
                : controller.selectedSidebarIndex.value == 8
                ? Expanded(child: CustomerDetailsView())
                : controller.selectedSidebarIndex.value == 9
                ? Expanded(child: CalendarPageView())
                : controller.selectedSidebarIndex.value == 10
                ? Expanded(child: ChatPageView())
                : controller.selectedSidebarIndex.value == 11
                ? Expanded(child: WalletPageView())
                : HomeLandingView(),
          ],
        ),
      ),
    );
  }
}

Widget _buildSidebar() {
  var themeMode = Get.find<UserStateController>().themeMode.value;
  return Container(
    width: 250.w,
    color: themeMode == ThemeMode.light ? Colors.white : Color(0xFF1F1E26),
    child: Column(
      children: [
        // Logo
        Padding(
          padding: EdgeInsets.all(20.w),
          child: Row(
            children: [
              Icon(Icons.restaurant, color: Colors.green, size: 32.sp),
              SizedBox(width: 8.w),
              CustomText(
                text: 'Sedap.',
                size: 24,
                weight: FontWeight.bold,
                color: Colors.black,
              ),
            ],
          ),
        ),
        CustomText(
          text: 'Modern Admin Dashboard',
          size: 12,
          color: Colors.grey[600],
        ),
        SizedBox(height: 30.h),

        // Menu items
        Expanded(
          child: ListView(
            children: [
              buildSidebarItem(
                0,
                FontAwesomeIcons.tableColumns,
                'Dashboard',
                true,
              ),
              buildSidebarItem(1, FontAwesomeIcons.list, 'Order List', false),
              buildSidebarItem(
                2,
                FontAwesomeIcons.receipt,
                'Order Detail',
                false,
              ),
              buildSidebarItem(3, Icons.people, 'Customer', false),
              buildSidebarItem(
                4,
                FontAwesomeIcons.chartSimple,
                'Analytics',
                false,
              ),
              buildSidebarItem(5, FontAwesomeIcons.star, 'Reviews', false),
              buildSidebarItem(6, FontAwesomeIcons.utensils, 'Foods', false),
              buildSidebarItem(
                7,
                FontAwesomeIcons.burger,
                'Food Detail',
                false,
              ),
              buildSidebarItem(8, Icons.person, 'Customer Detail', false),
              buildSidebarItem(9, FontAwesomeIcons.calendar, 'Calendar', false),
              buildSidebarItem(10, FontAwesomeIcons.comment, 'Chat', false),
              buildSidebarItem(11, FontAwesomeIcons.wallet, 'Wallet', false),
            ],
          ),
        ),

        // Promotion card
        Container(
          margin: EdgeInsets.all(20.w),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: 'Please, organize your\nmenus through button\nbelow!',
                size: 12,
                color: Colors.white,
              ),
              SizedBox(height: 10.h),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: CustomText(
                  text: 'Add Menus',
                  size: 14,
                  weight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildSidebarItem(
  int index,
  IconData icon,
  String title,
  bool isSelected,
) {
  final controller = Get.find<HomeController>();
  return Obx(
    () => Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      decoration: BoxDecoration(
        color: controller.selectedSidebarIndex.value == index
            ? Colors.green.withOpacity(0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: controller.selectedSidebarIndex.value == index
              ? Colors.green
              : Colors.black,
          size: 20.sp, // optional: use ScreenUtil for icon size
        ),
        title: CustomText(
          text: title,
          size: 14, // or 14.sp, since CustomText uses .sp internally
          color: controller.selectedSidebarIndex.value == index
              ? Colors.green
              : Colors.grey[700],
          weight: controller.selectedSidebarIndex.value == index
              ? FontWeight.w500
              : FontWeight.normal,
        ),
        onTap: () => controller.selectSidebarItem(index),
      ),
    ),
  );
}
