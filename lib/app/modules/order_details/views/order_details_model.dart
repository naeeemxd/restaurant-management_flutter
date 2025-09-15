class OrderItem {
  final String id;
  final String name;
  final String category;
  final double rating;
  final int reviewCount;
  final int quantity;
  final double price;
  final double totalPrice;
  final String imageUrl;

  OrderItem({
    required this.id,
    required this.name,
    required this.category,
    required this.rating,
    required this.reviewCount,
    required this.quantity,
    required this.price,
    required this.totalPrice,
    required this.imageUrl,
  });
}

class DeliveryPerson {
  final String name;
  final String id;
  final String phone;
  final String avatar;
  final String estimatedTime;

  DeliveryPerson({
    required this.name,
    required this.id,
    required this.phone,
    required this.avatar,
    required this.estimatedTime,
  });
}

class OrderHistory {
  final String title;
  final String subtitle;
  final DateTime dateTime;
  final bool isCompleted;
  final bool isCurrent;

  OrderHistory({
    required this.title,
    required this.subtitle,
    required this.dateTime,
    required this.isCompleted,
    required this.isCurrent,
  });
}
