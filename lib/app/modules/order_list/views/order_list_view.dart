import 'package:admin_dashboard/app/modules/custom_widgets/custom_text.dart';
import 'package:admin_dashboard/app/modules/home_landing/views/home_landing_view.dart';
import 'package:admin_dashboard/app/modules/order_list/controllers/order_list_controller.dart';
import 'package:admin_dashboard/app/modules/order_list/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// Main Widget
class orderlistview extends GetView<OrderListController> {
  const orderlistview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      body: Column(
        children: [
          buildTopBar(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  SizedBox(height: 52),
                  Expanded(child: _buildOrdersTable()),
                  SizedBox(height: 16),
                  _buildPagination(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'Your Orders',
              size: 28.sp, // ✅ responsive text
              weight: FontWeight.bold,
              color: const Color(0xFF2D3748),
            ),
            SizedBox(height: 4.h), // ✅ responsive spacing
            CustomText(
              text: 'This is your order list data',
              size: 14.sp,
              color: const Color(0xFF718096),
            ),
          ],
        ),
        Row(
          children: [
            _buildFilters(),
            SizedBox(width: 15),
            Container(
              height: 50.h,
              padding: EdgeInsets.symmetric(
                horizontal: 16.w, // ✅ responsive padding
                vertical: 8.h,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.today,
                    size: 16.sp, // ✅ responsive icon size
                    color: const Color(0xFF38A169),
                  ),
                  SizedBox(width: 8.w),
                  CustomText(
                    text: 'Today',
                    size: 14.sp,
                    color: const Color(0xFF38A169),
                    weight: FontWeight.w500,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildFilters() {
    return Obx(
      () => Container(
        height: 50.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: const Color(0xFFE2E8F0)),
        ),
        child: DropdownButton<String>(
          value: controller.selectedFilter.value,
          underline: const SizedBox(),
          items: ['All Status', 'New Order', 'On Delivery', 'Delivered'].map((
            String value,
          ) {
            return DropdownMenuItem<String>(
              value: value,
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle_outline,
                    size: 16.sp,
                    color: const Color(0xFF38A169),
                  ),
                  SizedBox(width: 8.w),
                  CustomText(
                    text: value,
                    size: 14.sp,
                    weight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            if (newValue != null) {
              controller.updateFilter(newValue);
            }
          },
        ),
      ),
    );
  }

  Widget _buildOrdersTable() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r), // ✅ responsive radius
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.05),
            blurRadius: 10.r, // ✅ responsive blur
            offset: Offset(0, 2.h), // ✅ responsive offset
          ),
        ],
      ),
      child: Column(
        children: [
          _buildTableHeader(), // ⚡ should also use CustomText internally
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              if (controller.filteredOrders.isEmpty) {
                return Center(
                  child: CustomText(
                    text: "No orders found",
                    size: 14,
                    weight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                );
              }

              return ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 8.h), // ✅ spacing
                itemCount: controller.filteredOrders.length,
                itemBuilder: (context, index) {
                  return _buildOrderRow(controller.filteredOrders[index]);
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildTableHeader() {
    return Container(
      padding: EdgeInsets.all(16.w), // ✅ responsive padding
      decoration: BoxDecoration(
        color: const Color(0xFF38A169),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12.r),
          topRight: Radius.circular(12.r),
        ),
      ),
      child: Row(
        children: [
          Expanded(flex: 2, child: _buildHeaderCell('Order ID')),
          Expanded(flex: 2, child: _buildHeaderCell('Date')),
          Expanded(flex: 3, child: _buildHeaderCell('Customer Name')),
          Expanded(flex: 4, child: _buildHeaderCell('Location')),
          Expanded(flex: 2, child: _buildHeaderCell('Amount')),
          Expanded(flex: 2, child: _buildHeaderCell('Status Order')),
          SizedBox(width: 40.w), // ✅ responsive spacing for menu button
        ],
      ),
    );
  }

  Widget _buildHeaderCell(String text) {
    return CustomText(
      text: text,
      size: 14,
      weight: FontWeight.w600,
      color: Colors.white,
    );
  }

  Widget _buildOrderRow(Order order) {
    return Container(
      padding: EdgeInsets.all(16.w), // ✅ responsive padding
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: const Color(0xFFF7FAFC), width: 1.w),
        ),
      ),
      child: Row(
        children: [
          // Order ID
          Expanded(
            flex: 2,
            child: CustomText(
              text: order.id,
              size: 14,
              weight: FontWeight.w600,
              color: const Color(0xFF2D3748),
            ),
          ),

          // Date
          Expanded(
            flex: 2,
            child: CustomText(
              text:
                  '${order.date.day} March ${order.date.year}, ${order.date.hour.toString().padLeft(2, '0')}:${order.date.minute.toString().padLeft(2, '0')} AM',
              size: 13,
              color: const Color(0xFF718096),
            ),
          ),

          // Customer Name
          Expanded(
            flex: 3,
            child: CustomText(
              text: order.customerName,
              size: 14,
              color: const Color(0xFF2D3748),
            ),
          ),

          // Location
          Expanded(
            flex: 4,
            child: CustomText(
              text: order.location,
              size: 13,
              color: const Color(0xFF718096),
            ),
          ),

          // Amount
          Expanded(
            flex: 2,
            child: CustomText(
              text: '\$${order.amount.toStringAsFixed(2)}',
              size: 14,
              weight: FontWeight.w600,
              color: const Color(0xFF2D3748),
            ),
          ),

          // Status Chip
          Expanded(flex: 2, child: _buildStatusChip(order.status)),

          // More Button
          SizedBox(
            width: 40.w, // ✅ responsive
            child: IconButton(
              icon: Icon(
                Icons.more_horiz,
                color: const Color(0xFF718096),
                size: 20.sp,
              ),
              onPressed: () => _showOrderMenu(order),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip(OrderStatus status) {
    Color backgroundColor;
    Color textColor;
    String text;

    switch (status) {
      case OrderStatus.newOrder:
        backgroundColor = const Color(0xFFFED7D7);
        textColor = const Color(0xFFE53E3E);
        text = 'New Order';
        break;
      case OrderStatus.onDelivery:
        backgroundColor = const Color(0xFFBEE3F8);
        textColor = const Color(0xFF3182CE);
        text = 'On Delivery';
        break;
      case OrderStatus.delivered:
        backgroundColor = const Color(0xFFC6F6D5);
        textColor = const Color(0xFF38A169);
        text = 'Delivered';
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
        vertical: 4.h,
      ), // ✅ responsive
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12.r), // ✅ responsive radius
      ),
      child: Center(
        child: CustomText(
          text: text,
          size: 12,
          color: textColor,
          weight: FontWeight.w500,
          align: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildPagination() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // ✅ Showing results text
        Obx(
          () => CustomText(
            text: 'Showing ${controller.filteredOrders.length} from 46 data',
            size: 14,
            color: const Color(0xFF718096),
          ),
        ),

        // ✅ Pagination buttons
        Row(
          children: [
            // Previous
            IconButton(
              icon: Icon(
                Icons.chevron_left,
                size: 20.sp,
                color: const Color(0xFF2D3748),
              ),
              onPressed: () {},
            ),

            // Page numbers
            ...List.generate(5, (index) {
              bool isSelected = index == 0;
              return Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 2.w,
                ), // ✅ responsive spacing
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    backgroundColor: isSelected
                        ? const Color(0xFF38A169)
                        : Colors.transparent,
                    minimumSize: Size(32.w, 32.h), // ✅ responsive button size
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        6.r,
                      ), // ✅ responsive radius
                    ),
                  ),
                  child: CustomText(
                    text: '${index + 1}',
                    size: 14,
                    color: isSelected ? Colors.white : const Color(0xFF718096),
                    weight: FontWeight.w500,
                    align: TextAlign.center,
                  ),
                ),
              );
            }),

            // Next
            IconButton(
              icon: Icon(
                Icons.chevron_right,
                size: 20.sp,
                color: const Color(0xFF2D3748),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }

  void _showOrderMenu(Order order) {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(20.w), // ✅ ScreenUtil
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r), // ✅ ScreenUtil
            topRight: Radius.circular(20.r),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 24.sp,
              ), // ✅ Responsive icon
              title: CustomText(
                text: 'Accept Order',
                size: 14.sp,
                weight: FontWeight.w500,
              ),
              onTap: () => Get.back(),
            ),
            ListTile(
              leading: Icon(Icons.cancel, color: Colors.red, size: 24.sp),
              title: CustomText(
                text: 'Reject Order',
                size: 14.sp,
                weight: FontWeight.w500,
              ),
              onTap: () => Get.back(),
            ),
            ListTile(
              leading: Icon(Icons.visibility, color: Colors.blue, size: 24.sp),
              title: CustomText(
                text: 'View Details',
                size: 14.sp,
                weight: FontWeight.w500,
              ),
              onTap: () => Get.back(),
            ),
          ],
        ),
      ),
    );
  }
}
