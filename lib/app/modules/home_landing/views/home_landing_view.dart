import 'package:admin_dashboard/app/modules/custom_widgets/custom_text.dart';
import 'package:admin_dashboard/app/modules/home/views/home_view.dart';
import 'package:admin_dashboard/app/modules/home_landing/widgets.dart';
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
      backgroundColor: Color(0xFFF8F9FA),
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
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: Color(0xFFE1E0E5)),
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

          SizedBox(height: 20.h),

          SizedBox(
            height: 300.h, // 👈 responsive fixed height
            child: buildChartsSection(controller),
          ),

          SizedBox(height: 20.h),

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

          SizedBox(height: 20.h),

          customerReview(),
        ],
      ),
    ),
  );
}
