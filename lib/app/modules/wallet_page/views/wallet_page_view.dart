import 'package:admin_dashboard/app/modules/custom_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/wallet_page_controller.dart';

class WalletPageView extends GetView<WalletPageController> {
  const WalletPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Main Content
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header with search and notifications
                        _buildHeader(),
                        SizedBox(height: 32.h),

                        // Main Balance Card and Chart
                        Row(
                          children: [
                            Expanded(child: _buildMainBalanceCard()),
                            SizedBox(width: 24.w),
                            // Expanded(child: _buildChartSection()),
                          ],
                        ),
                        SizedBox(height: 32.h),

                        // Payment History
                        _buildPaymentHistory(),
                      ],
                    ),
                  ),
                  SizedBox(width: 24.w),

                  // Right Sidebar
                  Container(
                    width: 300.w,
                    child: Column(
                      children: [
                        _buildWalletCard(),
                        SizedBox(height: 24.h),
                        _buildInvoicesSection(),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 48.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: const Color(0xFFE5E7EB)),
            ),
            child: Row(
              children: [
                SizedBox(width: 16.w),
                Icon(Icons.search, color: Colors.grey[400], size: 20.sp),
                SizedBox(width: 12.w),
                Expanded(
                  child: CustomText(
                    text: "Search here",
                    color: Colors.grey[400],
                    size: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 16.w),
        _buildNotificationIcon(Icons.favorite_border, Colors.blue, "1"),
        SizedBox(width: 12.w),
        _buildNotificationIcon(Icons.message_outlined, Colors.blue, "5"),
        SizedBox(width: 12.w),
        _buildNotificationIcon(Icons.shopping_cart_outlined, Colors.grey, "6"),
        SizedBox(width: 12.w),
        _buildNotificationIcon(Icons.notifications_outlined, Colors.red, "3"),
        SizedBox(width: 16.w),
        Row(
          children: [
            CustomText(
              text: "Hello, Samantha",
              size: 14,
              weight: FontWeight.w500,
            ),
            SizedBox(width: 8.w),
            CircleAvatar(
              radius: 18.r,
              backgroundColor: Colors.grey[300],
              child: Icon(Icons.person, size: 18.sp, color: Colors.grey[600]),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNotificationIcon(IconData icon, Color color, String count) {
    return Stack(
      children: [
        Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: const Color(0xFFE5E7EB)),
          ),
          child: Icon(icon, color: color, size: 18.sp),
        ),
        if (count.isNotEmpty)
          Positioned(
            top: -2,
            right: -2,
            child: Container(
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: color == Colors.red ? Colors.red : Colors.blue,
                borderRadius: BorderRadius.circular(10.r),
              ),
              constraints: BoxConstraints(minWidth: 16.w, minHeight: 16.h),
              child: CustomText(
                text: count,
                color: Colors.white,
                size: 10,
                align: TextAlign.center,
                weight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildMainBalanceCard() {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: "Main Balance",
                size: 16,
                weight: FontWeight.w500,
                color: Colors.grey[600],
              ),
              Icon(Icons.more_horiz, color: Colors.grey[400], size: 20.sp),
            ],
          ),
          SizedBox(height: 8.h),
          CustomText(
            text: "\$673,412.66",
            size: 32,
            weight: FontWeight.bold,
            color: Colors.black,
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "VALID THRU",
                    size: 10,
                    color: Colors.grey[500],
                    letterSpacing: 1.2,
                  ),
                  CustomText(text: "08/21", size: 14, weight: FontWeight.w500),
                ],
              ),
              SizedBox(width: 40.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "CARD HOLDER",
                    size: 10,
                    color: Colors.grey[500],
                    letterSpacing: 1.2,
                  ),
                  CustomText(
                    text: "Samantha Anderson",
                    size: 14,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
              const Spacer(),
              CustomText(
                text: "**** **** **** 1234",
                size: 14,
                weight: FontWeight.w500,
                letterSpacing: 2,
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Container(
            height: 4.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.r),
              gradient: const LinearGradient(
                colors: [Color(0xFF10B981), Color(0xFF34D399)],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChartSection() {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: "Earning Category",
            size: 16,
            weight: FontWeight.w500,
            color: Colors.grey[800],
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              // Pie Chart
              Container(
                width: 100.w,
                height: 100.h,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const SweepGradient(
                          startAngle: 0,
                          colors: [
                            Color(0xFF10B981),
                            Color(0xFFEF4444),
                            Color(0xFFE5E7EB),
                          ],
                          stops: [0.3, 0.76, 1.0],
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: 50.w,
                        height: 50.h,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 24.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLegendItem(const Color(0xFF10B981), "Income", "30%"),
                    SizedBox(height: 8.h),
                    _buildLegendItem(const Color(0xFFEF4444), "Expense", "46%"),
                    SizedBox(height: 8.h),
                    _buildLegendItem(const Color(0xFFE5E7EB), "Unknown", "10%"),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          // Line Chart Area
          Container(
            height: 80.h,
            child: CustomPaint(
              painter: LineChartPainter(),
              size: Size(double.infinity, 80.h),
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
                .map(
                  (day) =>
                      CustomText(text: day, size: 12, color: Colors.grey[500]),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildLegendItem(Color color, String label, String percentage) {
    return Row(
      children: [
        Container(
          width: 12.w,
          height: 12.h,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        SizedBox(width: 8.w),
        CustomText(text: label, size: 14, color: Colors.grey[600]),
        const Spacer(),
        CustomText(text: percentage, size: 14, weight: FontWeight.w500),
      ],
    );
  }

  Widget _buildPaymentHistory() {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "Payment History",
                    size: 18,
                    weight: FontWeight.w600,
                  ),
                  CustomText(
                    text: "Lorem ipsum dolor sit amet, consectetur",
                    size: 12,
                    color: Colors.grey[500],
                  ),
                ],
              ),
              Row(
                children: [
                  _buildFilterTab("Monthly", 0),
                  _buildFilterTab("Weekly", 1),
                  _buildFilterTab("Today", 2),
                ],
              ),
            ],
          ),
          SizedBox(height: 24.h),
          _buildPaymentItem(
            "Peterdraw",
            "Online Shop",
            "June 5, 2020, 08:22 AM",
            "+\$5,553",
            "MasterCard 404",
            "Pending",
            const Color(0xFFEF4444),
            Icons.error_outline,
          ),
          _buildPaymentItem(
            "Olivia Brownlee",
            "",
            "June 4, 2020, 08:22 AM",
            "+\$5,553",
            "MasterCard 404",
            "Completed",
            const Color(0xFF10B981),
            Icons.check_circle_outline,
          ),
          _buildPaymentItem(
            "Angela Moss",
            "",
            "June 3, 2020, 08:22 AM",
            "+\$5,553",
            "MasterCard 404",
            "Cancelled",
            Colors.grey,
            Icons.cancel_outlined,
          ),
          _buildPaymentItem(
            "XYZ Store ID",
            "Online Shop",
            "June 1, 2020, 08:22 AM",
            "+\$5,553",
            "MasterCard 404",
            "Completed",
            const Color(0xFF10B981),
            Icons.check_circle_outline,
          ),
          _buildPaymentItem(
            "Peter Parkur",
            "",
            "June 10, 2020, 08:22 AM",
            "+\$5,553",
            "MasterCard 404",
            "Pending",
            const Color(0xFFEF4444),
            Icons.error_outline,
          ),
        ],
      ),
    );
  }

  Widget _buildFilterTab(String text, int index) {
    return Obx(
      () => GestureDetector(
        onTap: () => controller.changePaymentFilter(index),
        child: Container(
          margin: EdgeInsets.only(left: index > 0 ? 8.w : 0),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          decoration: BoxDecoration(
            color: controller.selectedPaymentFilter.value == index
                ? const Color(0xFF10B981)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: CustomText(
            text: text,
            size: 14,
            color: controller.selectedPaymentFilter.value == index
                ? Colors.white
                : Colors.grey[600],
            weight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentItem(
    String name,
    String subtitle,
    String date,
    String amount,
    String cardType,
    String status,
    Color statusColor,
    IconData statusIcon,
  ) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey[200]!, width: 1)),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundColor: Colors.grey[300],
                child: Icon(Icons.person, size: 18.sp, color: Colors.grey[600]),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 16.w,
                  height: 16.h,
                  decoration: BoxDecoration(
                    color: statusColor,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Icon(statusIcon, size: 8.sp, color: Colors.white),
                ),
              ),
            ],
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: name, size: 14, weight: FontWeight.w500),
                if (subtitle.isNotEmpty) ...[
                  SizedBox(height: 2.h),
                  CustomText(text: subtitle, size: 12, color: Colors.grey[500]),
                ],
              ],
            ),
          ),
          SizedBox(width: 12.w),
          CustomText(text: date, size: 12, color: Colors.grey[500]),
          SizedBox(width: 12.w),
          CustomText(
            text: amount,
            size: 14,
            weight: FontWeight.w600,
            color: const Color(0xFF10B981),
          ),
          SizedBox(width: 12.w),
          CustomText(text: cardType, size: 12, color: Colors.grey[500]),
          SizedBox(width: 12.w),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: CustomText(
              text: status,
              size: 12,
              color: statusColor,
              weight: FontWeight.w500,
            ),
          ),
          SizedBox(width: 8.w),
          Icon(Icons.chevron_right, size: 16.sp, color: Colors.grey[400]),
        ],
      ),
    );
  }

  Widget _buildWalletCard() {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF6366F1), Color(0xFF4F46E5)],
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Icon(
                  Icons.account_balance_wallet,
                  color: Colors.white,
                  size: 20.sp,
                ),
              ),
              const Spacer(),
              Container(
                width: 60.w,
                height: 30.h,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          CustomText(
            text: "\$824,571.93",
            size: 28,
            weight: FontWeight.bold,
            color: Colors.white,
          ),
          SizedBox(height: 4.h),
          CustomText(
            text: "Wallet Balance",
            size: 14,
            color: Colors.white.withOpacity(0.8),
          ),
          SizedBox(height: 16.h),
          CustomText(
            text: "+0.8% than last week",
            size: 12,
            color: Colors.white.withOpacity(0.8),
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.add, color: Colors.white, size: 20.sp),
                      SizedBox(height: 8.h),
                      CustomText(text: "Top Up", size: 12, color: Colors.white),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    children: [
                      Icon(Icons.north_east, color: Colors.white, size: 20.sp),
                      SizedBox(height: 8.h),
                      CustomText(
                        text: "Withdraw",
                        size: 12,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInvoicesSection() {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: "Invoices Sent",
                size: 16,
                weight: FontWeight.w600,
              ),
            ],
          ),
          SizedBox(height: 4.h),
          CustomText(
            text: "Lorem ipsum dolor sit amet, consectetur",
            size: 12,
            color: Colors.grey[500],
          ),
          SizedBox(height: 20.h),
          _buildInvoiceItem("Stevan Store", "\$562"),
          _buildInvoiceItem("David Ignis", "\$672"),
          _buildInvoiceItem("Olivia Johan..", "\$769"),
          _buildInvoiceItem("Melanie Wong", "\$45"),
          _buildInvoiceItem("Roberto", "\$778"),
          SizedBox(height: 16.h),
          Center(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 12.h),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF10B981)),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: CustomText(
                text: "View More",
                size: 14,
                weight: FontWeight.w500,
                color: const Color(0xFF10B981),
                align: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInvoiceItem(String name, String amount) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          CircleAvatar(
            radius: 16.r,
            backgroundColor: Colors.grey[300],
            child: Icon(Icons.person, size: 16.sp, color: Colors.grey[600]),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: CustomText(text: name, size: 14, weight: FontWeight.w500),
          ),
          CustomText(text: amount, size: 14, weight: FontWeight.w600),
        ],
      ),
    );
  }
}

class LineChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF10B981)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final paint2 = Paint()
      ..color = const Color(0xFFEF4444)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Sample data points for green line
    final points1 = [
      Offset(0, size.height * 0.7),
      Offset(size.width * 0.2, size.height * 0.4),
      Offset(size.width * 0.4, size.height * 0.6),
      Offset(size.width * 0.6, size.height * 0.2),
      Offset(size.width * 0.8, size.height * 0.3),
      Offset(size.width, size.height * 0.1),
    ];

    // Sample data points for red line
    final points2 = [
      Offset(0, size.height * 0.8),
      Offset(size.width * 0.2, size.height * 0.9),
      Offset(size.width * 0.4, size.height * 0.7),
      Offset(size.width * 0.6, size.height * 0.8),
      Offset(size.width * 0.8, size.height * 0.6),
      Offset(size.width, size.height * 0.5),
    ];

    // Draw lines
    final path1 = Path();
    path1.moveTo(points1.first.dx, points1.first.dy);
    for (int i = 1; i < points1.length; i++) {
      path1.lineTo(points1[i].dx, points1[i].dy);
    }
    canvas.drawPath(path1, paint);

    final path2 = Path();
    path2.moveTo(points2.first.dx, points2.first.dy);
    for (int i = 1; i < points2.length; i++) {
      path2.lineTo(points2[i].dx, points2[i].dy);
    }
    canvas.drawPath(path2, paint2);

    // Draw dots
    final dotPaint1 = Paint()
      ..color = const Color(0xFF10B981)
      ..style = PaintingStyle.fill;

    final dotPaint2 = Paint()
      ..color = const Color(0xFFEF4444)
      ..style = PaintingStyle.fill;

    for (final point in points1) {
      canvas.drawCircle(point, 3, dotPaint1);
    }

    for (final point in points2) {
      canvas.drawCircle(point, 3, dotPaint2);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
