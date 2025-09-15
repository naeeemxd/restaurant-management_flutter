class Customer {
  final String id;
  final DateTime joinDate;
  final String name;
  final String location;
  final double totalSpent;
  final double lastOrder;

  Customer({
    required this.id,
    required this.joinDate,
    required this.name,
    required this.location,
    required this.totalSpent,
    required this.lastOrder,
  });
}