import 'package:get/get.dart';

class WalletPageController extends GetxController {
  var selectedTab = 0.obs;
  var selectedPaymentFilter = 2.obs; // Today selected by default

  void changeTab(int index) {
    selectedTab.value = index;
  }

  void changePaymentFilter(int index) {
    selectedPaymentFilter.value = index;
  }
}
