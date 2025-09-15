// Order Model
class Order {
  final String id;
  final DateTime date;
  final String customerName;
  final String location;
  final double amount;
  final OrderStatus status;

  Order({
    required this.id,
    required this.date,
    required this.customerName,
    required this.location,
    required this.amount,
    required this.status,
  });
}

enum OrderStatus { newOrder, onDelivery, delivered }
