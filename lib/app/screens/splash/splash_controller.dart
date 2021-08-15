import 'dart:async';

import 'package:demo_pro/app/routes/app_routes.dart';
import 'package:demo_pro/app/services/models/login_response/login_response.dart';
import 'package:demo_pro/app/services/repository/share_prefs_repo.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class SplashController extends GetxController {
  // StorageService storageService =Get.find<StorageService>();

  SharPrefsRepo sharPrefsRepo = Get.find<SharPrefsRepo>();
  

  
  checkSignIn() {
    Future.delayed(Duration(seconds: 2), () async {
     
      LoginResponse? _loginResponse = await sharPrefsRepo.getLoginDetails();
      if (_loginResponse != null) {
        return Get.offAndToNamed(AppRoutes.main_page);
      } else {
      return Get.offAndToNamed(AppRoutes.login);
      } 
    });
  }
}
