import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserStateController extends GetxController {
  var themeMode = ThemeMode.system.obs;

  void toggleTheme() {
    themeMode.value = themeMode.value == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light;

    print(themeMode.value);
  }
}

