import 'package:flutter/material.dart';

class Responsive {
  final BuildContext context;

  Responsive(this.context);

  double screenWidth() => MediaQuery.of(context).size.width;
  double screenHeight() => MediaQuery.of(context).size.height;

  bool isMobile() => screenWidth() < 600;
  bool isTablet() => screenWidth() >= 600 && screenWidth() < 1200;
  bool isDesktop() => screenWidth() >= 1200;

  double widthPercent(double percent) => screenWidth() * percent / 100;
  double heightPercent(double percent) => screenHeight() * percent / 100;

  double text(double size) {
    // scales text with screen width
    return size * screenWidth() / 375; // 375 is base width (iPhone 8)
  }
}
