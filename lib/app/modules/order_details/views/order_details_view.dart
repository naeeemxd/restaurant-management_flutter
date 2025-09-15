import 'package:admin_dashboard/app/modules/home_landing/views/home_landing_view.dart';
import 'package:admin_dashboard/app/modules/order_details/views/order_details_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/order_details_controller.dart';

class OrderDetailsView extends GetView<OrderDetailsController> {
  const OrderDetailsView({super.key});

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
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildHeader(),
                    SizedBox(height: 24),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left Column
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              _buildCustomerInfo(),
                              SizedBox(height: 24),
                              _buildOrderNote(),
                              SizedBox(height: 24),
                              _buildOrderHistory(),
                            ],
                          ),
                        ),
                        SizedBox(width: 24),
                        // Right Column
                        Expanded(
                          flex: 3,
                          child: Column(
                            children: [
                              _buildOrderItems(),
                              SizedBox(height: 24),
                              Row(
                                children: [
                                  Expanded(child: _buildTrackOrders()),
                                  SizedBox(width: 24),
                                  Expanded(child: _buildDeliveryInfo()),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
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

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => Text(
                'Order ID ${controller.orderId.value}',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2D3748),
                ),
              ),
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Text('Orders', style: TextStyle(color: Color(0xFF718096))),
                Text(
                  ' / Order Details',
                  style: TextStyle(color: Color(0xFF38A169)),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            OutlinedButton(
              onPressed: controller.cancelOrder,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
                side: BorderSide(color: Colors.red),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: Text('Cancel Order'),
            ),
            SizedBox(width: 16),
            Obx(
              () => Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Color(0xFF38A169),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButton<String>(
                  value: controller.orderStatus.value,
                  underline: SizedBox(),
                  dropdownColor: Color(0xFF38A169),
                  icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
                  style: TextStyle(color: Colors.white),
                  items: ['New Order', 'On Delivery', 'Delivered'].map((
                    String value,
                  ) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Row(
                        children: [
                          Icon(
                            Icons.local_shipping,
                            size: 16,
                            color: Colors.white,
                          ),
                          SizedBox(width: 8),
                          Text(value, style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      controller.updateOrderStatus(newValue);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCustomerInfo() {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF000000).withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Color(0xFF38A169),
            child: Image.network(
              'https://static.vecteezy.com/system/resources/previews/024/183/502/non_2x/male-avatar-portrait-of-a-young-man-with-a-beard-illustration-of-male-character-in-modern-color-style-vector.jpg',
            ),
          ),
          SizedBox(height: 16),
          Obx(
            () => Text(
              controller.customerName.value,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D3748),
              ),
            ),
          ),
          SizedBox(height: 4),
          Obx(
            () => Text(
              controller.customerType.value,
              style: TextStyle(color: Color(0xFF718096), fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderNote() {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Color(0xFF4A5568),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Note Order',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 12),
          Obx(
            () => Text(
              controller.orderNote.value,
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
                height: 1.5,
              ),
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color(0xFF3182CE),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(Icons.location_on, color: Colors.white, size: 16),
                SizedBox(width: 8),
                Expanded(
                  child: Obx(
                    () => Text(
                      controller.deliveryAddress.value,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderHistory() {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF000000).withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'History',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3748),
            ),
          ),
          SizedBox(height: 20),
          Obx(
            () => Column(
              children: controller.orderHistory.map((history) {
                return _buildHistoryItem(history);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryItem(OrderHistory history) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 12,
            height: 12,
            margin: EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              color: history.isCompleted
                  ? Color(0xFF38A169)
                  : history.isCurrent
                  ? Color(0xFFE53E3E)
                  : Color(0xFFE2E8F0),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  history.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2D3748),
                    fontSize: 14,
                  ),
                ),
                if (history.subtitle.isNotEmpty)
                  Text(
                    history.subtitle,
                    style: TextStyle(color: Color(0xFF718096), fontSize: 12),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderItems() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF000000).withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFF38A169),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Expanded(flex: 3, child: _buildHeaderText('Items')),
                Expanded(flex: 1, child: _buildHeaderText('Qty')),
                Expanded(flex: 1, child: _buildHeaderText('Price')),
                Expanded(flex: 1, child: _buildHeaderText('Total Price')),
                SizedBox(width: 40),
              ],
            ),
          ),
          Obx(
            () => Column(
              children: controller.orderItems.map((item) {
                return _buildOrderItemRow(item);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderText(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
    );
  }

  Widget _buildOrderItemRow(OrderItem item) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFF7FAFC), width: 1)),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Color(0xFF38A169).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.fastfood, color: Color(0xFF38A169)),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.category,
                        style: TextStyle(
                          color: Color(0xFF38A169),
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        item.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF2D3748),
                          fontSize: 14,
                        ),
                      ),
                      Row(
                        children: [
                          ...List.generate(5, (index) {
                            return Icon(
                              index < item.rating.floor()
                                  ? Icons.star
                                  : Icons.star_border,
                              size: 12,
                              color: Color(0xFFECC94B),
                            );
                          }),
                          SizedBox(width: 4),
                          Text(
                            '(${item.reviewCount} reviews)',
                            style: TextStyle(
                              color: Color(0xFF718096),
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              '${item.quantity}x',
              style: TextStyle(color: Color(0xFF2D3748), fontSize: 14),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              '\$${item.price.toStringAsFixed(2)}',
              style: TextStyle(color: Color(0xFF2D3748), fontSize: 14),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              '\$${item.totalPrice.toStringAsFixed(1)}',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF2D3748),
                fontSize: 14,
              ),
            ),
          ),
          SizedBox(
            width: 40,
            child: IconButton(
              icon: Icon(Icons.remove_circle_outline, color: Colors.red),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTrackOrders() {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF000000).withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Track Orders',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3748),
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Lorem ipsum dolor sit',
            style: TextStyle(color: Color(0xFF718096), fontSize: 12),
          ),
          SizedBox(height: 20),
          Container(
            height: 150,
            child: CustomPaint(
              size: Size(double.infinity, 150),
              painter: TrackingChartPainter(),
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Color(0xFFF7FAFC),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Obx(
              () => Text(
                controller.trackingMinutes.value,
                style: TextStyle(
                  color: Color(0xFF2D3748),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeliveryInfo() {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF000000).withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Delivery by',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2D3748),
            ),
          ),
          SizedBox(height: 20),
          Obx(() {
            final delivery = controller.deliveryPerson.value;
            if (delivery == null) return SizedBox();

            return Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Color(0xFF38A169),
                      child: Icon(Icons.person, color: Colors.white, size: 30),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            delivery.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xFF2D3748),
                            ),
                          ),
                          Text(
                            delivery.id,
                            style: TextStyle(
                              color: Color(0xFF718096),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: controller.callDeliveryPerson,
                        icon: Icon(Icons.phone, size: 16),
                        label: Text(
                          delivery.phone,
                          style: TextStyle(fontSize: 12),
                        ),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 12),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF3182CE),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.message, size: 16, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            'Delivery Time',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    color: Color(0xFF38A169),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    delivery.estimatedTime,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}

// Custom painter for the tracking chart
class TrackingChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color(0xFFE53E3E)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final path = Path();

    // Create a simple line chart
    path.moveTo(0, size.height * 0.8);
    path.lineTo(size.width * 0.2, size.height * 0.6);
    path.lineTo(size.width * 0.4, size.height * 0.9);
    path.lineTo(size.width * 0.6, size.height * 0.3);
    path.lineTo(size.width * 0.8, size.height * 0.7);
    path.lineTo(size.width, size.height * 0.4);

    canvas.drawPath(path, paint);

    // Draw points
    final pointPaint = Paint()
      ..color = Color(0xFFE53E3E)
      ..style = PaintingStyle.fill;

    final points = [
      Offset(size.width * 0.6, size.height * 0.3),
      Offset(size.width, size.height * 0.4),
    ];

    for (final point in points) {
      canvas.drawCircle(point, 6, pointPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
