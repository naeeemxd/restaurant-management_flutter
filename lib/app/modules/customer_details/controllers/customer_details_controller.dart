import 'package:admin_dashboard/app/modules/customer_details/views/customerdetails_page_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerDetailsController extends GetxController {
var selectedOrderTimeFrame = 'Monthly'.obs;
  var selectedLikesTimeFrame = 'Monthly'.obs;
  
  final List<String> timeFrames = ['Monthly', 'Weekly', 'Daily'];
  
  final List<OrderItem> orderHistory = [
    OrderItem(
      id: 1,
      name: 'Medium Spicy Spaghetti Italiano',
      category: 'SPAGHETTI',
      price: 12.56,
      description: 'Serves for 4 Person',
      additionalInfo: '2 Drinks',
      image: 'spaghetti1',
    ),
    OrderItem(
      id: 2,
      name: 'Medium Spicy Spaghetti Italiano',
      category: 'SPAGHETTI',
      price: 12.56,
      description: 'Serves for 4 Person',
      additionalInfo: '2 Drinks',
      image: 'spaghetti2',
    ),
    OrderItem(
      id: 3,
      name: 'Medium Spicy Spaghetti Italiano',
      category: 'SPAGHETTI',
      price: 12.56,
      description: 'Serves for 4 Person',
      additionalInfo: '2 Drinks',
      image: 'spaghetti3',
    ),
    OrderItem(
      id: 4,
      name: 'Medium Spicy Spaghetti Italiano',
      category: 'SPAGHETTI',
      price: 12.56,
      description: 'Serves for 4 Person',
      additionalInfo: '2 Drinks',
      image: 'spaghetti4',
    ),
    OrderItem(
      id: 5,
      name: 'Medium Spicy Spaghetti Italiano',
      category: 'SPAGHETTI',
      price: 12.56,
      description: 'Serves for 4 Person',
      additionalInfo: '2 Drinks',
      image: 'spaghetti5',
    ),
  ];

  final List<FoodStats> foodStats = [
    FoodStats('Spaghetti', 22, 69, Colors.blue),
    FoodStats('Pizza', 11, 321, Colors.red),
    FoodStats('Burger', 27, 763, Colors.green),
    FoodStats('Sprite', 15, 154, Colors.yellow[700]!),
  ];

  void changeOrderTimeFrame(String timeFrame) {
    selectedOrderTimeFrame.value = timeFrame;
  }

  void changeLikesTimeFrame(String timeFrame) {
    selectedLikesTimeFrame.value = timeFrame;
  }}
