import 'package:get/get.dart';

import '../modules/analytics/bindings/analytics_binding.dart';
import '../modules/analytics/views/analytics_view.dart';
import '../modules/calendar_page/bindings/calendar_page_binding.dart';
import '../modules/calendar_page/views/calendar_page_view.dart';
import '../modules/chat_page/bindings/chat_page_binding.dart';
import '../modules/chat_page/views/chat_page_view.dart';
import '../modules/customer_details/bindings/customer_details_binding.dart';
import '../modules/customer_details/views/customer_details_view.dart';
import '../modules/customers/bindings/customers_binding.dart';
import '../modules/customers/views/customers_view.dart';
import '../modules/fooddetails/bindings/fooddetails_binding.dart';
import '../modules/fooddetails/views/fooddetails_view.dart';
import '../modules/foods/bindings/foods_binding.dart';
import '../modules/foods/views/foods_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/home_landing/bindings/home_landing_binding.dart';
import '../modules/home_landing/views/home_landing_view.dart';
import '../modules/order_details/bindings/order_details_binding.dart';
import '../modules/order_details/views/order_details_view.dart';
import '../modules/order_list/bindings/order_list_binding.dart';
import '../modules/order_list/views/order_list_view.dart';
import '../modules/reviews/bindings/reviews_binding.dart';
import '../modules/reviews/views/reviews_view.dart';
import '../modules/wallet_page/bindings/wallet_page_binding.dart';
import '../modules/wallet_page/views/wallet_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(name: _Paths.HOME, page: () => HomeView(), binding: HomeBinding()),
    GetPage(
      name: _Paths.HOME_LANDING,
      page: () => HomeLandingView(),
      binding: HomeLandingBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_LIST,
      page: () => orderlistview(),
      binding: OrderListBinding(),
    ),
    GetPage(
      name: _Paths.ORDER_DETAILS,
      page: () => const OrderDetailsView(),
      binding: OrderDetailsBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOMERS,
      page: () => const CustomersView(),
      binding: CustomersBinding(),
    ),
    GetPage(
      name: _Paths.ANALYTICS,
      page: () => const AnalyticsView(),
      binding: AnalyticsBinding(),
    ),
    GetPage(
      name: _Paths.REVIEWS,
      page: () => const ReviewsView(),
      binding: ReviewsBinding(),
    ),
    GetPage(
      name: _Paths.FOODS,
      page: () => const FoodsView(),
      binding: FoodsBinding(),
    ),
    GetPage(
      name: _Paths.FOODDETAILS,
      page: () => const FooddetailsView(),
      binding: FooddetailsBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOMER_DETAILS,
      page: () => const CustomerDetailsView(),
      binding: CustomerDetailsBinding(),
    ),
    GetPage(
      name: _Paths.CALENDAR_PAGE,
      page: () => const CalendarPageView(),
      binding: CalendarPageBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_PAGE,
      page: () => const ChatPageView(),
      binding: ChatPageBinding(),
    ),
    GetPage(
      name: _Paths.WALLET_PAGE,
      page: () => const WalletPageView(),
      binding: WalletPageBinding(),
    ),
  ];
}
