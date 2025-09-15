import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:admin_dashboard/app/services/user_state_controller.dart';


Color darkContainer = Color(0xFF1F1E26);

Color appBackgroundColor({Color? lightColor, Color? darkColor}) {
  final themeMode = Get.find<UserStateController>().themeMode.value;

  // Use passed colors or defaults
  final light = lightColor ?? Colors.white;
  final dark = darkColor ?? const Color(0xFF1F1E26);

  return themeMode == ThemeMode.light ? light : dark;
}


