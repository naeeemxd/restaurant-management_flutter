import 'package:admin_dashboard/app/modules/order_list/model.dart';
import 'package:get/get.dart';

class OrderListController extends GetxController {
var orders = <Order>[].obs;
  var isLoading = false.obs;
  var selectedFilter = 'All Status'.obs;
  var searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadOrders();
  }

  void loadOrders() {
    isLoading.value = true;
    
    // Simulate API call
    Future.delayed(Duration(milliseconds: 500), () {
      orders.value = [
        Order(
          id: '#555231',
          date: DateTime(2020, 3, 28, 12, 42),
          customerName: 'Mikasa Ackerman',
          location: 'Corner Street 5th London',
          amount: 184.52,
          status: OrderStatus.newOrder,
        ),
        Order(
          id: '#555232',
          date: DateTime(2020, 3, 28, 11, 42),
          customerName: 'Eren Yeager',
          location: "John's Road London 671",
          amount: 194.52,
          status: OrderStatus.onDelivery,
        ),
        Order(
          id: '#555233',
          date: DateTime(2020, 3, 28, 12, 22),
          customerName: 'Grisha Yeager',
          location: '31 The Green London',
          amount: 394.52,
          status: OrderStatus.delivered,
        ),
        Order(
          id: '#555234',
          date: DateTime(2020, 3, 28, 10, 42),
          customerName: 'Historia Reuss',
          location: '11 Church Road London',
          amount: 184.52,
          status: OrderStatus.newOrder,
        ),
        Order(
          id: '#555235',
          date: DateTime(2020, 3, 28, 12, 00),
          customerName: 'Levi Ackerman',
          location: '21 King Street London',
          amount: 584.52,
          status: OrderStatus.onDelivery,
        ),
        Order(
          id: '#555236',
          date: DateTime(2020, 3, 28, 13, 42),
          customerName: 'Armin Melancy',
          location: '14 The Drive London',
          amount: 186.52,
          status: OrderStatus.newOrder,
        ),
        Order(
          id: '#555237',
          date: DateTime(2020, 3, 28, 14, 42),
          customerName: 'Ronald Jamez',
          location: '69 Stations Road London',
          amount: 184.00,
          status: OrderStatus.newOrder,
        ),
        Order(
          id: '#555238',
          date: DateTime(2020, 3, 28, 15, 42),
          customerName: 'Anandreansyah',
          location: '45 Brighton Hills London',
          amount: 184.02,
          status: OrderStatus.delivered,
        ),
        Order(
          id: '#555239',
          date: DateTime(2020, 3, 28, 18, 42),
          customerName: 'Putra Frawira',
          location: '15 Leicester Street Road',
          amount: 184.60,
          status: OrderStatus.onDelivery,
        ),
        Order(
          id: '#555310',
          date: DateTime(2020, 3, 28, 18, 42),
          customerName: 'John Snow',
          location: '7th The Avenue Apartment',
          amount: 184.42,
          status: OrderStatus.newOrder,
        ),
        Order(
          id: '#555311',
          date: DateTime(2020, 3, 28, 21, 42),
          customerName: 'Snowden Spy',
          location: '72 Manchester Street',
          amount: 344.52,
          status: OrderStatus.delivered,
        ),
        Order(
          id: '#555312',
          date: DateTime(2020, 3, 28, 22, 42),
          customerName: 'John Wickerman',
          location: '12 Chelsea Road London',
          amount: 74.55,
          status: OrderStatus.onDelivery,
        ),
      ];
      isLoading.value = false;
    });
  }

  List<Order> get filteredOrders {
    var filtered = orders.where((order) {
      bool matchesSearch = order.customerName.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
          order.id.toLowerCase().contains(searchQuery.value.toLowerCase());
      
      bool matchesStatus = selectedFilter.value == 'All Status' || 
          _getStatusText(order.status) == selectedFilter.value;
      
      return matchesSearch && matchesStatus;
    }).toList();
    
    return filtered;
  }

  String _getStatusText(OrderStatus status) {
    switch (status) {
      case OrderStatus.newOrder:
        return 'New Order';
      case OrderStatus.onDelivery:
        return 'On Delivery';
      case OrderStatus.delivered:
        return 'Delivered';
    }
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query;
  }

  void updateFilter(String filter) {
    selectedFilter.value = filter;
  }
}
