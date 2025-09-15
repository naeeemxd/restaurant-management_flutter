import 'dart:ui';

class OrderItem {
  final int id;
  final String name;
  final String category;
  final double price;
  final String description;
  final String additionalInfo;
  final String image;

  OrderItem({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.description,
    required this.additionalInfo,
    required this.image,
  });
}

class FoodStats {
  final String name;
  final int percentage;
  final int count;
  final Color color;

  FoodStats(this.name, this.percentage, this.count, this.color);
}