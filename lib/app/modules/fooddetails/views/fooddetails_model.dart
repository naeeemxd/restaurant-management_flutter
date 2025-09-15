import 'dart:ui';

class RevenuePoint {
  final String month;
  final double value;
  
  RevenuePoint(this.month, this.value);
}

class ReviewData {
  final String name;
  final String avatar;
  final String time;
  final int rating;
  final String review;
  final Color avatarColor;

  ReviewData({
    required this.name,
    required this.avatar,
    required this.time,
    required this.rating,
    required this.review,
    required this.avatarColor,
  });
}