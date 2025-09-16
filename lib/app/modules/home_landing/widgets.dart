import 'package:admin_dashboard/app/common_functions.dart';
import 'package:admin_dashboard/app/modules/custom_widgets/custom_text.dart';
import 'package:admin_dashboard/app/modules/home_landing/controllers/home_landing_controller.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

double screenWidth = 1.sw; // same as MediaQuery.of(context).size.width
double screenHeight = 1.sh;



Widget customSearchBar() {
  return Container(
    width: 300.w,
    height: 55.h,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(14.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 8.r,
          offset: Offset(0, 4.h),
        ),
      ],
    ),
    child: TextField(
      style: TextStyle(fontSize: 14.sp, color: Colors.black87),
      decoration: InputDecoration(
        hintText: 'Search here',
        hintStyle: TextStyle(
          fontSize: 14.sp,
          color: Colors.grey[500],
          fontFamily: 'Segoe UI',
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Icon(
            FontAwesomeIcons.search,
            color: Colors.grey[400],
            size: 22.sp,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 12.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.r),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: appBackgroundColor(darkColor: Color(0xFF1F1E26)),
      ),
    ),
  );
}


Widget customerReview() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // 🔹 Header Row
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 0.0),
            child: CustomText(
              text: "Customer Reviews",
              size: 18,
              weight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          GestureDetector(
            onTap: () {
              // navigate to all reviews
            },
            child: CustomText(
              text: "See all",
              size: 14,
              color: Colors.blue,
              weight: FontWeight.w500,
            ),
          ),
        ],
      ),

      SizedBox(height: 30.h),

      // 🔹 Review Card
      Container(
        width: screenWidth / 3,
        padding: EdgeInsets.all(20.r),
        decoration: BoxDecoration(
          color: appBackgroundColor(darkColor: darkContainer),
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 Avatar + Name + Time
            Row(
              children: [
                CircleAvatar(
                  radius: 24.r,
                  backgroundImage: const NetworkImage(
                    'https://static.vecteezy.com/system/resources/previews/024/183/502/non_2x/male-avatar-portrait-of-a-young-man-with-a-beard-illustration-of-male-character-in-modern-color-style-vector.jpg',
                  ),
                ),
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: 'Jons Sena',
                      color: Colors.black,
                      size: 16,
                      weight: FontWeight.w600,
                    ),
                    CustomText(
                      text: '2 days ago',
                      color: Colors.grey,
                      size: 12,
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 16.h),

            // 🔹 Review Text
            CustomText(
              text:
                  'Dolxor Lorem nulla quis veniam qui esse adipisicing consectetur voluptate incididunt ad id et. Fugiat irure duis eu esse reprehenderit cillum.',
              size: 14,
              color: Colors.black87,
              height: 1.4,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),

            SizedBox(height: 12.h),

            // 🔹 Star Rating
            Row(
              children: List.generate(
                5,
                (index) => Padding(
                  padding: EdgeInsets.only(right: 4.w),
                  child: Icon(
                    Icons.star,
                    color: index < 4 ? Colors.amber : Colors.grey[300],
                    size: 20.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget buildCustomerMapSection() {
  return Container(
    padding: EdgeInsets.all(20.r),
    decoration: BoxDecoration(
      color: appBackgroundColor(darkColor: darkContainer),
      borderRadius: BorderRadius.circular(12.r),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: 'Customer Map',
          size: 16.sp,
          weight: FontWeight.bold,
          color: Colors.black87,
        ),
        SizedBox(height: 20.h),
        SizedBox(
          height: 300.h, // specify chart height
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 100,
              barTouchData: BarTouchData(enabled: false),

              // ✅ Axis titles
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      return Text(
                        value.toInt().toString(),
                        style: TextStyle(fontSize: 10, color: Colors.black87),
                      );
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30,
                    interval: 20,
                    getTitlesWidget: (value, meta) {
                      return Text(
                        value.toInt().toString(),
                        style: TextStyle(fontSize: 10, color: Colors.black87),
                      );
                    },
                  ),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),

              borderData: FlBorderData(show: false),
              gridData: FlGridData(show: false),

              // ✅ Bars with horizontal top line
              barGroups: [
                BarChartGroupData(
                  x: 0,
                  barRods: [
                    BarChartRodData(
                      toY: 80,
                      color: Colors.red,
                      width: 15.w,
                      borderRadius: BorderRadius.zero,
                    ),
                  ],
                ),
                BarChartGroupData(
                  x: 1,
                  barRods: [
                    BarChartRodData(
                      toY: 60,
                      color: Colors.orange,
                      width: 15.w,
                      borderRadius: BorderRadius.zero,
                    ),
                  ],
                ),
                BarChartGroupData(
                  x: 2,
                  barRods: [
                    BarChartRodData(
                      toY: 90,
                      color: Colors.yellow,
                      width: 15.w,
                      borderRadius: BorderRadius.zero,
                    ),
                  ],
                ),
                BarChartGroupData(
                  x: 3,
                  barRods: [
                    BarChartRodData(
                      toY: 70,
                      color: Colors.yellow,
                      width: 15.w,
                      borderRadius: BorderRadius.zero,
                    ),
                  ],
                ),
                BarChartGroupData(
                  x: 4,
                  barRods: [
                    BarChartRodData(
                      toY: 50,
                      color: Colors.red,
                      width: 15.w,
                      borderRadius: BorderRadius.zero,
                    ),
                  ],
                ),
                BarChartGroupData(
                  x: 5,
                  barRods: [
                    BarChartRodData(
                      toY: 85,
                      color: Colors.red,
                      width: 15.w,
                      borderRadius: BorderRadius.zero,
                    ),
                  ],
                ),
                BarChartGroupData(
                  x: 6,
                  barRods: [
                    BarChartRodData(
                      toY: 40,
                      color: Colors.orange,
                      width: 15.w,
                      borderRadius: BorderRadius.zero,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildRevenueChart(controller) {
  return Container(
    padding: EdgeInsets.all(20.w), // ✅ responsive padding
    decoration: BoxDecoration(
      color: appBackgroundColor(darkColor: darkContainer),
      borderRadius: BorderRadius.circular(12.r),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: 'Total Revenue',
          size: 16, // ✅ will auto-scale with .sp
          weight: FontWeight.bold,
        ),
        SizedBox(height: 20.h),
        Expanded(
          child: Obx(
            () => LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: true, // ✅ only vertical lines
                  drawHorizontalLine: false, // ❌ no horizontal lines
                  verticalInterval: 1,
                  getDrawingVerticalLine: (value) {
                    return FlLine(
                      color: Colors.grey.withOpacity(0.3),
                      strokeWidth: 1,
                    );
                  },
                ),

                // ✅ Titles for X (bottom) & Y (left)
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      interval: 1, // every 1 step on X-axis
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFFA3A3A3),
                          ),
                        );
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      interval: 20, // Y-axis steps: 0, 20, 40, 60...
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFFA3A3A3),
                          ),
                        );
                      },
                    ),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),

                borderData: FlBorderData(show: false),
                minX: 0,
                maxX: 11,
                minY: 0,
                maxY: 100,

                lineBarsData: [
                  LineChartBarData(
                    dotData: FlDotData(show: false),
                    spots: controller.revenueData,
                    isCurved: true,
                    color: Colors.blue,
                    barWidth: 2.w, // responsive thickness
                    isStrokeCapRound: true,
                    belowBarData: BarAreaData(show: false),
                  ),
                  LineChartBarData(
                    dotData: FlDotData(show: false),
                    spots: [
                      FlSpot(0, 60),
                      FlSpot(1, 50),
                      FlSpot(2, 70),
                      FlSpot(3, 55),
                      FlSpot(4, 80),
                      FlSpot(5, 45),
                      FlSpot(6, 90),
                      FlSpot(7, 75),
                      FlSpot(8, 100),
                      FlSpot(9, 85),
                      FlSpot(10, 95),
                      FlSpot(11, 100),
                    ],
                    isCurved: true,
                    color: Colors.red,
                    barWidth: 2.w,
                    isStrokeCapRound: true,
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget buildChartsSection(controller) {
  return Row(
    children: [
      Expanded(
        flex: 3, // make this bigger
        child: buildPieChartSection(controller),
      ),
      SizedBox(width: 20.w), // responsive spacing
      Expanded(
        flex: 2, // smaller
        child: buildChartOrderSection(),
      ),
    ],
  );
}

Widget buildPieChartSection(controller) {
  return Container(
    height: 300.h, // ✅ responsive height
    padding: EdgeInsets.all(20.w),
    decoration: BoxDecoration(
      color: appBackgroundColor(darkColor: darkContainer),
      borderRadius: BorderRadius.circular(12.r),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomText(text: 'Pie Chart', size: 16, weight: FontWeight.bold),
            const Spacer(),
            Obx(
              () => Row(
                children: [
                  Checkbox(
                    value: controller.showPieChartValue.value,
                    onChanged: (value) => controller.toggleChartValue(),
                    activeColor: Colors.green,
                  ),
                  CustomText(
                    text: 'Show Value',
                    size: 12,
                    color: Colors.grey[700],
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        Expanded(
          child: Row(
            children: [
              Expanded(child: _buildPieChart('Total Order', '81%', Colors.red)),
              // SizedBox(height: 15.h),
              Expanded(
                child: _buildPieChart('Customer Growth', '22%', Colors.green),
              ),
              // SizedBox(width: 20.w),
              Expanded(
                child: _buildPieChart('Total Revenue', '62%', Colors.blue),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildChartOrderSection() {
  final controller = Get.find<HomeLandingController>();
  return Container(
    height: 300.h, // ✅ responsive height
    padding: EdgeInsets.all(25.w), // ✅ responsive padding
    decoration: BoxDecoration(
      color: appBackgroundColor(darkColor: darkContainer),
      borderRadius: BorderRadius.circular(12.r), // ✅ responsive radius
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomText(
              text: 'Chart Order',
              size: 16.sp, // ✅ responsive text
              weight: FontWeight.bold,
            ),
            const Spacer(),
            Container(
              padding: EdgeInsets.all(3.w), // ✅ responsive padding
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 1.w),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  Gap(4.w),
                  Icon(
                    FontAwesomeIcons.download,
                    color: Colors.blue,
                    size: 14.sp, // ✅ responsive icon
                  ),
                  TextButton(
                    onPressed: () {},
                    child: CustomText(
                      text: 'Save Report',
                      size: 12.sp, // ✅ responsive text
                      color: Colors.blue,
                      weight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h), // ✅ responsive spacing
        Expanded(
          child: Obx(
            () => LineChart(
              LineChartData(
                gridData: FlGridData(show: false),

                // ✅ Axis Titles
                titlesData: FlTitlesData(
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30.h,
                      interval: 1,
                      getTitlesWidget: (value, meta) {
                        switch (value.toInt()) {
                          case 0:
                            return CustomText(
                              text: "Mon",
                              size: 10.sp,
                              color: Colors.black,
                            );
                          case 1:
                            return CustomText(
                              text: "Tue",
                              size: 10.sp,
                              color: Colors.black,
                            );
                          case 2:
                            return CustomText(
                              text: "Wed",
                              size: 10.sp,
                              color: Colors.black,
                            );
                          case 3:
                            return CustomText(
                              text: "Thu",
                              size: 10.sp,
                              color: Colors.black,
                            );
                          case 4:
                            return CustomText(
                              text: "Fri",
                              size: 10.sp,
                              color: Colors.black,
                            );
                          case 5:
                            return CustomText(
                              text: "Sat",
                              size: 10.sp,
                              color: Colors.black,
                            );
                          case 6:
                            return CustomText(
                              text: "Sun",
                              size: 10.sp,
                              color: Colors.black,
                            );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),

                borderData: FlBorderData(show: false),
                minX: 0,
                maxX: 6,
                minY: 0,
                maxY: 60,

                lineBarsData: [
                  LineChartBarData(
                    spots: controller.orderData,
                    isCurved: true,
                    color: Colors.blue,
                    barWidth: 2.w, // ✅ responsive stroke width
                    isStrokeCapRound: true,
                    dotData: FlDotData(show: false),
                    belowBarData: BarAreaData(
                      show: true,
                      color: Colors.blue.withOpacity(0.1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildPieChart(String title, String percentage, Color color) {
  final controller = Get.find<HomeLandingController>();
  return Column(
    children: [
      Expanded(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 80.w, // ✅ responsive size
              height: 80.w,
              child: CircularProgressIndicator(
                value: double.parse(percentage.replaceAll('%', '')) / 100,
                strokeWidth: 20.w, // ✅ responsive stroke
                backgroundColor: color == Colors.blue
                    ? Colors.blue.shade100
                    : color == Colors.red
                    ? Colors.red.shade100
                    : color == Colors.green
                    ? Colors.green.shade100
                    : Colors.grey.shade200, // default fallback

                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
            ),
            Obx(
              () => controller.showPieChartValue.value
                  ? CustomText(
                      text: percentage,
                      weight: FontWeight.bold,
                      size: 14, // ✅ sp handled inside CustomText
                      align: TextAlign.center,
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
      SizedBox(height: 8.h),
      CustomText(
        text: title,
        size: 12,
        color: Colors.grey[600],
        align: TextAlign.center,
      ),
    ],
  );
}

Widget buildStatsCards() {
  return Row(
    children: [
      Expanded(
        child: buildStatsCard(
          '75',
          'Total Orders',
          Colors.green,
          FontAwesomeIcons.cartShopping,
        ),
      ),
      SizedBox(width: 15.w),
      Expanded(
        child: buildStatsCard(
          '357',
          'Total Delivered',
          Colors.blue,
          Icons.delivery_dining,
        ),
      ),
      SizedBox(width: 15.w),
      Expanded(
        child: buildStatsCard('65', 'Total Canceled', Colors.red, Icons.cancel),
      ),
      SizedBox(width: 15.w),
      Expanded(
        child: buildStatsCard(
          '\$128',
          'Total Revenue',
          Colors.green,
          FontAwesomeIcons.dollarSign,
        ),
      ),
    ],
  );
}

Widget buildStatsCard(String value, String title, Color color, IconData icon) {
  return Container(
    padding: EdgeInsets.all(20.w),
    decoration: BoxDecoration(
      color: appBackgroundColor(darkColor: darkContainer),
      borderRadius: BorderRadius.circular(12.r),
      // boxShadow: [
      //   BoxShadow(
      //     color: Colors.grey.withOpacity(0.1),
      //     spreadRadius: 1,
      //     blurRadius: 10,
      //     offset: const Offset(0, 1),
      //   ),
      // ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(icon, color: color, size: 20.sp),
            ),
            const Spacer(),
            CustomText(text: '↗ +3.5%', size: 12, color: Colors.green),
          ],
        ),
        SizedBox(height: 15.h),
        CustomText(
          text: value,
          size: 28,
          weight: FontWeight.bold,
          color: Colors.black,
        ),
        SizedBox(height: 5.h),
        CustomText(text: title, size: 14, color: Colors.grey[600]),
      ],
    ),
  );
}
