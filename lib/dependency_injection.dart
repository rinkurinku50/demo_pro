import 'package:demo_pro/app/services/provider/api_provider.dart';
import 'package:demo_pro/app/services/provider/share_prefs_provider.dart';
import 'package:demo_pro/app/services/repository/api_repo.dart';
import 'package:demo_pro/app/services/repository/share_prefs_repo.dart';
import 'package:get/get.dart';

class DependencyInjection {
  // static final DependencyInjection _inst=DependencyInjection.internal();
  // DependencyInjection.internal();
  //
  // factory DependencyInjection() {
  //   return _inst;
  // }

//  add all other  Dependency that should execute first and never dispose like api,storage

  static void init()  {

    //fenix make restrict to dispose instance
      Get.lazyPut<ApiProvider>(() => ApiProvider(),fenix: true);
     Get.lazyPut<SharPrefsProvider>(() => SharPrefsProvider(),fenix: true);
     Get.lazyPut<SharPrefsRepo>(() => SharPrefsRepo(),fenix: true);
     Get.lazyPut<ApiRepo>(() => ApiRepo(),fenix: true);
   }
}