import 'package:admin_dashboard/app/modules/order_details/views/order_details_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController {
// Controller
  var orderStatus = 'On Delivery'.obs;
  var isLoading = false.obs;
  
  // Order Info
  var orderId = '#5552351'.obs;
  var customerName = 'Wahyu Adi Kurniawan'.obs;
  var customerType = 'Customer'.obs;
  var deliveryAddress = '6 The Avenue, London\nEC20 4QN'.obs;
  var orderNote = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'.obs;

  // Order Items
  var orderItems = <OrderItem>[].obs;
  
  // Delivery Person
  var deliveryPerson = Rx<DeliveryPerson?>(null);
  
  // Order History
  var orderHistory = <OrderHistory>[].obs;
  
  // Track Orders Data (for the chart)
  var trackingMinutes = '4-8 mins'.obs;

  @override
  void onInit() {
    super.onInit();
    loadOrderDetails();
  }

  void loadOrderDetails() {
    isLoading.value = true;
    
    // Simulate API call
    Future.delayed(Duration(milliseconds: 500), () {
      // Load order items
      orderItems.value = [
        OrderItem(
          id: '1',
          name: 'Watermelon juice with ice',
          category: 'MAIN COURSE',
          rating: 4.5,
          reviewCount: 15,
          quantity: 5,
          price: 10.8,
          totalPrice: 50.8,
          imageUrl: 'assets/watermelon_juice.jpg',
        ),
        OrderItem(
          id: '2',
          name: 'Watermelon juice with ice',
          category: 'MAIN COURSE',
          rating: 4.5,
          reviewCount: 8,
          quantity: 4,
          price: 5.78,
          totalPrice: 20.8,
          imageUrl: 'assets/watermelon_juice2.jpg',
        ),
        OrderItem(
          id: '3',
          name: 'Italiano pizza with garlic',
          category: 'MAIN COURSE',
          rating: 4.5,
          reviewCount: 10,
          quantity: 3,
          price: 16.40,
          totalPrice: 48.4,
          imageUrl: 'assets/pizza.jpg',
        ),
      ];

      // Load delivery person
      deliveryPerson.value = DeliveryPerson(
        name: 'Kevin Hobs Jr.',
        id: 'ID • 182568',
        phone: '+12 345 5862 66',
        avatar: 'assets/delivery_person.jpg',
        estimatedTime: '12:52',
      );

      // Load order history
      orderHistory.value = [
        OrderHistory(
          title: 'Order Created',
          subtitle: 'Thu, 23 Jul 2020, 11:32 AM',
          dateTime: DateTime(2020, 7, 23, 11, 32),
          isCompleted: true,
          isCurrent: false,
        ),
        OrderHistory(
          title: 'Payment Success',
          subtitle: 'Fri, 24 Jul 2020, 10:44 AM',
          dateTime: DateTime(2020, 7, 24, 10, 44),
          isCompleted: true,
          isCurrent: false,
        ),
        OrderHistory(
          title: 'On Delivery',
          subtitle: 'Sat, 25 Jul 2020, 01:26 PM',
          dateTime: DateTime(2020, 7, 25, 13, 26),
          isCompleted: false,
          isCurrent: true,
        ),
        OrderHistory(
          title: 'Order Delivered',
          subtitle: '',
          dateTime: DateTime.now(),
          isCompleted: false,
          isCurrent: false,
        ),
      ];

      isLoading.value = false;
    });
  }

  void cancelOrder() {
    Get.dialog(
      AlertDialog(
        title: Text('Cancel Order'),
        content: Text('Are you sure you want to cancel this order?'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('No'),
          ),
          ElevatedButton(
            onPressed: () {
              Get.back();
              Get.snackbar('Order Cancelled', 'Order has been cancelled successfully');
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text('Yes, Cancel', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void updateOrderStatus(String status) {
    orderStatus.value = status;
    Get.snackbar('Status Updated', 'Order status updated to $status');
  }

  void callDeliveryPerson() {
    Get.snackbar('Calling...', 'Calling ${deliveryPerson.value?.name}');
  }

  void messageDeliveryPerson() {
    Get.snackbar('Message', 'Opening message with ${deliveryPerson.value?.name}');
  }
}

