import 'package:get/get.dart';

import '../controllers/fooddetails_controller.dart';

class FooddetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FooddetailsController>(
      () => FooddetailsController(),
    );
  }
}
