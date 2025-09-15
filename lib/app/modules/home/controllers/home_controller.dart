import 'package:admin_dashboard/app/modules/analytics/controllers/analytics_controller.dart';
import 'package:admin_dashboard/app/modules/calendar_page/controllers/calendar_page_controller.dart';
import 'package:admin_dashboard/app/modules/chat_page/controllers/chat_page_controller.dart';
import 'package:admin_dashboard/app/modules/customer_details/controllers/customer_details_controller.dart';
import 'package:admin_dashboard/app/modules/customers/controllers/customers_controller.dart';
import 'package:admin_dashboard/app/modules/fooddetails/controllers/fooddetails_controller.dart';
import 'package:admin_dashboard/app/modules/foods/controllers/foods_controller.dart';
import 'package:admin_dashboard/app/modules/home_landing/controllers/home_landing_controller.dart';
import 'package:admin_dashboard/app/modules/order_details/controllers/order_details_controller.dart';
import 'package:admin_dashboard/app/modules/order_list/controllers/order_list_controller.dart';
import 'package:admin_dashboard/app/modules/reviews/controllers/reviews_controller.dart';
import 'package:admin_dashboard/app/modules/wallet_page/controllers/wallet_page_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectedSidebarIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    Get.put(HomeLandingController());
    Get.put(OrderListController());
    Get.put(OrderDetailsController());
    Get.put(CustomersController());
    Get.put(AnalyticsController());
    Get.put(ReviewsController());
    Get.put(FoodsController());
    Get.put(FooddetailsController());
    Get.put(CustomerDetailsController());
    Get.put(CalendarPageController());
    Get.put(ChatPageController());
        Get.put(WalletPageController());

  }

  void selectSidebarItem(int index) {
    print(selectedSidebarIndex.value);
    selectedSidebarIndex.value = index;
  }
}
