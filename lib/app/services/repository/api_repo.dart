import 'package:demo_pro/app/services/provider/api_provider.dart';
import 'package:demo_pro/app/services/repository/share_prefs_repo.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as DioObject;

class ApiRepo {
  ApiProvider apiProvider = Get.find<ApiProvider>();
  SharPrefsRepo sharPrefsRepo = Get.find<SharPrefsRepo>();
  

  
  Future<DioObject.Response> getUnSplashData() async =>
      apiProvider.getUnSplashData();


}