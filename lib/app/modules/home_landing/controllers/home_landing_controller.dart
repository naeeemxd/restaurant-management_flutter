import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';

class HomeLandingController extends GetxController {

  var selectedSidebarIndex = 0.obs;
  var showPieChartValue = true.obs;
  var filterPeriod = 'Filter Periods'.obs;
  
  // Dashboard stats
  var totalOrders = 75.obs;
  var totalDelivered = 357.obs;
  var totalCanceled = 65.obs;
  var totalRevenue = 128.obs;
  
  // Chart data
  var revenueData = <FlSpot>[].obs;
  var orderData = <FlSpot>[].obs;
  
  @override
  void onInit() {
    super.onInit();
    loadChartData();
  }
  
  void loadChartData() {
    // Sample revenue data
    revenueData.value = [
      FlSpot(0, 40),
      FlSpot(1, 30),
      FlSpot(2, 50),
      FlSpot(3, 45),
      FlSpot(4, 60),
      FlSpot(5, 35),
      FlSpot(6, 70),
      FlSpot(7, 55),
      FlSpot(8, 80),
      FlSpot(9, 65),
      FlSpot(10, 75),
      FlSpot(11, 85),
    ];
    
    // Sample order data
    orderData.value = [
      FlSpot(0, 20),
      FlSpot(1, 35),
      FlSpot(2, 28),
      FlSpot(3, 42),
      FlSpot(4, 38),
      FlSpot(5, 55),
      FlSpot(6, 48),
    ];
  }
  

  void toggleChartValue() {
    showPieChartValue.value = !showPieChartValue.value;
  }
}

