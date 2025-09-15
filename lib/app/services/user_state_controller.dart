import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class UserStateController extends GetxController {
  void toggleThemeChange() {
    var isDark = Get.isDarkMode;

    Get.changeThemeMode(isDark ? ThemeMode.light : ThemeMode.dark);

    update();
  }
}
  