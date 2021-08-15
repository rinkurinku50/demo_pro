import 'package:demo_pro/app/routes/app_pages.dart';
import 'package:demo_pro/app/routes/app_routes.dart';
import 'package:demo_pro/app/screens/splash/splash_controller.dart';
import 'package:demo_pro/app/utils/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: () {
      return GetMaterialApp(
        getPages: AppPages.pages,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: AppColor.primarySwatch,),
        initialBinding: BindingsBuilder(
                () => Get.lazyPut<SplashController>(() => SplashController())),
        initialRoute: AppRoutes.splash,
      );
    });
  }
}