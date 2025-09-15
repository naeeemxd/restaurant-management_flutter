import 'package:admin_dashboard/app/routes/app_pages.dart';
import 'package:admin_dashboard/app/services/user_state_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light, // For Android (dark icons)
      statusBarBrightness: Brightness.dark,
    ),
  );

  ///////
  Get.put(UserStateController(), permanent: true);
  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812), // default mobile reference
      minTextAdapt: true,
      builder: (context, child) {
        final width = MediaQuery.of(context).size.width;
        // Breakpoints:
        // <600px   = Mobile
        // 600–1024 = Tablet
        // >1024px  = Desktop
        final designSize = width < 600
            ? const Size(375, 812) // mobile
            : (width < 1024
                  ? const Size(834, 1112) // tablet
                  : const Size(1440, 1024)); // desktop

        ScreenUtil.init(
          context,
          designSize: designSize,
          minTextAdapt: true,
          splitScreenMode: true,
        );

        return GetMaterialApp(
          title: "Admin Dashboard",
          debugShowCheckedModeBanner: false,

          // ✅ Theme Settings
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Colors.grey[100],
            fontFamily: 'Segoe UI',
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              elevation: 0,
            ),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.deepPurple,
            scaffoldBackgroundColor: Color(0xFF212121),
            fontFamily: 'Segoe UI',
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF212121),
              foregroundColor: Colors.white,
              elevation: 0,
            ),
          ),

          themeMode: ThemeMode.system, // 👈 uses system setting (light/dark)
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        );
      },
    ),
  );
}
