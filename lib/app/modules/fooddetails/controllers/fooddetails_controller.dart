import 'package:admin_dashboard/app/modules/fooddetails/views/fooddetails_model.dart';
import 'package:admin_dashboard/app/modules/fooddetails/views/fooddetails_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FooddetailsController extends GetxController {
var selectedTimeFrame = 'Monthly'.obs;
  var revenueData = <RevenuePoint>[].obs;
  
  final List<String> timeFrames = ['Monthly', 'Weekly', 'Daily'];
  
  final List<ReviewData> reviews = [
    ReviewData(
      name: 'Johnny Ahmad',
      avatar: 'JA',
      time: '1 hour ago',
      rating: 4,
      review: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean commodo ligula eget dolor.',
      avatarColor: Colors.orange,
    ),
    ReviewData(
      name: 'Maria Vania',
      avatar: 'MV',
      time: '1 hour ago',
      rating: 4,
      review: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean commodo ligula eget dolor.',
      avatarColor: Colors.blue,
    ),
    ReviewData(
      name: 'Sarah Muellerz',
      avatar: 'SM',
      time: '1 hour ago',
      rating: 4,
      review: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean commodo ligula eget dolor.',
      avatarColor: Colors.red,
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    // Generate sample revenue data
    revenueData.value = generateRevenueData();
  }

  void changeTimeFrame(String timeFrame) {
    selectedTimeFrame.value = timeFrame;
    // Here you would typically fetch new data based on the selected timeframe
    revenueData.value = generateRevenueData();
  }

  List<RevenuePoint> generateRevenueData() {
    // Sample data for the revenue chart
    return [
      RevenuePoint('Jan', 20),
      RevenuePoint('Feb', 45),
      RevenuePoint('Mar', 35),
      RevenuePoint('Apr', 70),
      RevenuePoint('May', 85),
      RevenuePoint('Jun', 80),
      RevenuePoint('Jul', 60),
      RevenuePoint('Aug', 65),
      RevenuePoint('Sept', 55),
    ];
  }
}
