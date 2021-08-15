import 'package:demo_pro/app/routes/app_routes.dart';
import 'package:demo_pro/app/screens/dashboard_page/dashboard_controller.dart';
import 'package:demo_pro/app/screens/login_page/login_controller.dart';
import 'package:demo_pro/app/screens/login_page/login_page.dart';
import 'package:demo_pro/app/screens/main_page/main_page.dart';
import 'package:demo_pro/app/screens/main_page/main_page_controller.dart';
import 'package:demo_pro/app/screens/profile_page/profile_page_controller.dart';
import 'package:demo_pro/app/screens/splash/splash_page.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashPage(),
    ),
    GetPage(
        name: AppRoutes.login,
        page: () => LoginPage(),
        binding: BindingsBuilder(
            () => Get.lazyPut<LoginController>(() => LoginController()))),
    
     GetPage(
        name: AppRoutes.main_page,
        page: () => MainPage(),
        binding: BindingsBuilder(
            // ignore: top_level_function_literal_block
            () {
              Get.lazyPut<MainPageController>(() => MainPageController());
              Get.lazyPut<DashBoardController>(() => DashBoardController());
              Get.lazyPut<ProfilePageController>(() => ProfilePageController());
              return;
              })),
    
   

  ];
}
